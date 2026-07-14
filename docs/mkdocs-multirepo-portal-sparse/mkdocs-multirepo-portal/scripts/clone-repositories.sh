#!/usr/bin/env bash

set -Eeuo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CONFIG_FILE="${REPOSITORIES_CONFIG:-${ROOT_DIR}/repositories.conf}"
IMPORT_DIR="${IMPORT_DIR:-${ROOT_DIR}/imported}"

log() {
  printf '[clone-repositories] %s\n' "$*"
}

fail() {
  printf '[clone-repositories] ERROR: %s\n' "$*" >&2
  exit 1
}

require_command() {
  command -v "$1" >/dev/null 2>&1 || fail "Required command not found: $1"
}

trim() {
  local value="$1"
  value="${value#"${value%%[![:space:]]*}"}"
  value="${value%"${value##*[![:space:]]}"}"
  printf '%s' "$value"
}

validate_relative_path() {
  local value="$1"
  local label="$2"

  [[ -n "$value" ]] || fail "$label cannot be empty"
  [[ "$value" != /* ]] || fail "$label must be relative: $value"
  [[ "$value" != *".."* ]] || fail "$label cannot contain '..': $value"
  [[ "$value" != *"//"* ]] || fail "$label cannot contain '//': $value"
}

url_encode() {
  python3 - "$1" <<'PY'
import sys
from urllib.parse import quote
print(quote(sys.argv[1], safe=""))
PY
}

clone_repository() {
  local repo_id="$1"
  local repository_url="$2"
  local branch="$3"
  local target_name="$4"
  local username_variable="$5"
  local token_variable="$6"
  local docs_path="$7"
  local mkdocs_path="$8"

  local username="${!username_variable:-}"
  local token="${!token_variable:-}"

  [[ -n "$username" ]] || fail "Environment variable $username_variable is not set for $repo_id"
  [[ -n "$token" ]] || fail "Environment variable $token_variable is not set for $repo_id"
  [[ "$repository_url" == https://* ]] || fail "Only HTTPS repository URLs are supported: $repository_url"
  [[ "$repository_url" != *"@"* ]] || fail "Repository URL must not contain credentials: $repository_url"

  validate_relative_path "$target_name" "target_directory for $repo_id"
  validate_relative_path "$docs_path" "docs_path for $repo_id"
  validate_relative_path "$mkdocs_path" "mkdocs_path for $repo_id"

  local target_directory="${IMPORT_DIR}/${target_name}"
  local credentials_file
  credentials_file="$(mktemp)"

  cleanup_credentials() {
    rm -f "$credentials_file"
  }
  trap cleanup_credentials RETURN

  local host_and_path="${repository_url#https://}"
  local encoded_username encoded_token
  encoded_username="$(url_encode "$username")"
  encoded_token="$(url_encode "$token")"

  printf 'https://%s:%s@%s\n' \
    "$encoded_username" \
    "$encoded_token" \
    "$host_and_path" > "$credentials_file"
  chmod 600 "$credentials_file"

  rm -rf "$target_directory"
  mkdir -p "$(dirname "$target_directory")"

  log "Importing $repo_id from $repository_url"
  log "  branch: $branch"
  log "  paths:  $docs_path, $mkdocs_path"

  # --depth 1 limits history.
  # --filter=blob:none creates a partial clone and downloads file contents only
  # when the sparse checkout needs them.
  # --no-checkout avoids materialising the complete repository first.
  git \
    -c credential.helper="store --file=${credentials_file}" \
    -c advice.detachedHead=false \
    clone \
    --quiet \
    --depth 1 \
    --filter=blob:none \
    --no-checkout \
    --branch "$branch" \
    "$repository_url" \
    "$target_directory"

  # Non-cone mode allows selecting both an individual mkdocs.yml file and a
  # documentation directory, including paths nested below the repository root.
  git -C "$target_directory" sparse-checkout init --no-cone
  git -C "$target_directory" sparse-checkout set --no-cone \
    "/${docs_path%/}/" \
    "/${mkdocs_path}"
  git -C "$target_directory" checkout --quiet

  [[ -f "$target_directory/$mkdocs_path" ]] || \
    fail "$repo_id does not contain $mkdocs_path on branch $branch"

  [[ -d "$target_directory/$docs_path" ]] || \
    fail "$repo_id does not contain $docs_path/ on branch $branch"

  cleanup_credentials
  trap - RETURN
}

main() {
  require_command git
  require_command python3

  [[ -f "$CONFIG_FILE" ]] || fail "Repository configuration not found: $CONFIG_FILE"

  rm -rf "$IMPORT_DIR"
  mkdir -p "$IMPORT_DIR"

  local count=0
  local line_number=0

  while IFS='|' read -r repo_id repository_url branch target_name username_variable token_variable docs_path mkdocs_path extra; do
    line_number=$((line_number + 1))

    repo_id="$(trim "${repo_id:-}")"
    [[ -z "$repo_id" ]] && continue
    [[ "$repo_id" == \#* ]] && continue

    repository_url="$(trim "${repository_url:-}")"
    branch="$(trim "${branch:-}")"
    target_name="$(trim "${target_name:-}")"
    username_variable="$(trim "${username_variable:-}")"
    token_variable="$(trim "${token_variable:-}")"
    docs_path="$(trim "${docs_path:-}")"
    mkdocs_path="$(trim "${mkdocs_path:-}")"
    extra="$(trim "${extra:-}")"

    [[ -z "$extra" ]] || fail "Too many fields at $CONFIG_FILE:$line_number"
    [[ -n "$repository_url" && -n "$branch" && -n "$target_name" ]] || \
      fail "Missing repository fields at $CONFIG_FILE:$line_number"
    [[ -n "$username_variable" && -n "$token_variable" ]] || \
      fail "Missing credential variable names at $CONFIG_FILE:$line_number"
    [[ -n "$docs_path" && -n "$mkdocs_path" ]] || \
      fail "Missing docs_path or mkdocs_path at $CONFIG_FILE:$line_number"

    clone_repository \
      "$repo_id" \
      "$repository_url" \
      "$branch" \
      "$target_name" \
      "$username_variable" \
      "$token_variable" \
      "$docs_path" \
      "$mkdocs_path"

    count=$((count + 1))
  done < "$CONFIG_FILE"

  [[ "$count" -gt 0 ]] || fail "No repositories found in $CONFIG_FILE"
  log "Successfully imported $count repositories into $IMPORT_DIR"
}

main "$@"
