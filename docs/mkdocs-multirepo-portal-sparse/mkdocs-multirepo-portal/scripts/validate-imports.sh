#!/usr/bin/env bash

set -Eeuo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CONFIG_FILE="${REPOSITORIES_CONFIG:-${ROOT_DIR}/repositories.conf}"
IMPORT_DIR="${IMPORT_DIR:-${ROOT_DIR}/imported}"

failures=0
count=0

trim() {
  local value="$1"
  value="${value#"${value%%[![:space:]]*}"}"
  value="${value%"${value##*[![:space:]]}"}"
  printf '%s' "$value"
}

while IFS='|' read -r repo_id _repository_url _branch target_name _username_variable _token_variable docs_path mkdocs_path _extra; do
  repo_id="$(trim "${repo_id:-}")"
  [[ -z "$repo_id" || "$repo_id" == \#* ]] && continue

  target_name="$(trim "${target_name:-}")"
  docs_path="$(trim "${docs_path:-}")"
  mkdocs_path="$(trim "${mkdocs_path:-}")"
  count=$((count + 1))

  if [[ ! -f "$IMPORT_DIR/$target_name/$mkdocs_path" ]]; then
    printf 'ERROR: %s missing %s\n' "$repo_id" "$mkdocs_path" >&2
    failures=$((failures + 1))
  fi

  if [[ ! -d "$IMPORT_DIR/$target_name/$docs_path" ]]; then
    printf 'ERROR: %s missing %s/\n' "$repo_id" "$docs_path" >&2
    failures=$((failures + 1))
  fi
done < "$CONFIG_FILE"

[[ "$count" -gt 0 ]] || {
  printf 'ERROR: No repositories configured in %s\n' "$CONFIG_FILE" >&2
  exit 1
}

[[ "$failures" -eq 0 ]] || exit 1
printf 'Validated %s imported repositories.\n' "$count"
