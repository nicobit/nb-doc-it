/*
 * Design theme switcher.
 * Stamps data-nb-theme on <html>, persists the choice in localStorage,
 * and adds a flat dropdown in the header listing the registered themes.
 * The attribute is applied before paint by the inline script in
 * overrides/main.html; this file only handles the picker UI.
 * Dropdown styles live at the end of extra.css (.nb-theme-picker).
 */
(function () {
  var STORAGE_KEY = "nb-theme";

  /* Labels are display names; the ids are stable (stored in localStorage
     and matched by the [data-nb-theme] selectors in the theme CSS files). */
  var THEMES = [
    { id: "default", label: "Onyx" },
    { id: "gitbook", label: "Pearl" },
    { id: "docusaurus", label: "Jade" },
    { id: "starlight", label: "Amethyst" },
    { id: "sapphire", label: "Sapphire" }
  ];

  var ICON_PALETTE =
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">' +
    '<path fill="currentColor" d="M17.5,12A1.5,1.5 0 0,1 16,10.5A1.5,1.5 0 0,1 ' +
    '17.5,9A1.5,1.5 0 0,1 19,10.5A1.5,1.5 0 0,1 17.5,12M14.5,8A1.5,1.5 0 0,1 ' +
    '13,6.5A1.5,1.5 0 0,1 14.5,5A1.5,1.5 0 0,1 16,6.5A1.5,1.5 0 0,1 14.5,8M9.5,8A1.5,1.5 ' +
    '0 0,1 8,6.5A1.5,1.5 0 0,1 9.5,5A1.5,1.5 0 0,1 11,6.5A1.5,1.5 0 0,1 9.5,8M6.5,12A1.5,1.5 ' +
    '0 0,1 5,10.5A1.5,1.5 0 0,1 6.5,9A1.5,1.5 0 0,1 8,10.5A1.5,1.5 0 0,1 6.5,12M12,3A9,9 ' +
    '0 0,0 3,12A9,9 0 0,0 12,21A1.5,1.5 0 0,0 13.5,19.5C13.5,19.11 13.35,18.76 13.11,18.5C12.88,18.23 ' +
    '12.73,17.88 12.73,17.5A1.5,1.5 0 0,1 14.23,16H16A5,5 0 0,0 21,11C21,6.58 16.97,3 12,3Z"/></svg>';

  var ICON_CHEVRON =
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">' +
    '<path fill="currentColor" d="M7,10L12,15L17,10H7Z"/></svg>';

  var ICON_CHECK =
    '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">' +
    '<path fill="currentColor" d="M21,7L9,19L3.5,13.5L4.91,12.09L9,16.17L19.59,5.59L21,7Z"/></svg>';

  function currentTheme() {
    return document.documentElement.getAttribute("data-nb-theme") || "default";
  }

  function themeLabel(id) {
    for (var i = 0; i < THEMES.length; i++) {
      if (THEMES[i].id === id) return THEMES[i].label;
    }
    return id;
  }

  function applyTheme(id) {
    if (id === "default") {
      document.documentElement.removeAttribute("data-nb-theme");
    } else {
      document.documentElement.setAttribute("data-nb-theme", id);
    }
    try { localStorage.setItem(STORAGE_KEY, id); } catch (e) { /* storage blocked */ }
  }

  var LAYOUT_KEY = "nb-layout";

  /* Wide is the default (no attribute); "centered" restores the 61rem grid. */
  function currentLayout() {
    return document.documentElement.getAttribute("data-nb-layout") === "centered"
      ? "centered"
      : "wide";
  }

  function applyLayout(id) {
    if (id === "centered") {
      document.documentElement.setAttribute("data-nb-layout", "centered");
    } else {
      document.documentElement.removeAttribute("data-nb-layout");
    }
    try { localStorage.setItem(LAYOUT_KEY, id); } catch (e) { /* storage blocked */ }
  }

  function createPicker() {
    var inner = document.querySelector(".md-header__inner");
    if (!inner || inner.querySelector(".nb-theme-picker")) return;

    var picker = document.createElement("div");
    picker.className = "nb-theme-picker";

    var button = document.createElement("button");
    button.type = "button";
    button.className = "nb-theme-picker__button";
    button.setAttribute("aria-haspopup", "menu");
    button.setAttribute("aria-expanded", "false");

    // Icon-only button; the theme names show inside the open menu.
    button.innerHTML = ICON_PALETTE + ICON_CHEVRON;

    var menu = document.createElement("div");
    menu.className = "nb-theme-picker__menu";
    menu.setAttribute("role", "menu");

    THEMES.forEach(function (theme) {
      var item = document.createElement("button");
      item.type = "button";
      item.className = "nb-theme-picker__item";
      item.setAttribute("role", "menuitemradio");
      item.dataset.theme = theme.id;

      var name = document.createElement("span");
      name.textContent = theme.label;
      item.appendChild(name);

      var check = document.createElement("span");
      check.className = "nb-theme-picker__check";
      check.innerHTML = ICON_CHECK;
      item.appendChild(check);

      item.addEventListener("click", function () {
        applyTheme(theme.id);
        refresh();
        close();
      });

      menu.appendChild(item);
    });

    // Layout toggle below a divider: centered (default) vs wide
    var divider = document.createElement("div");
    divider.className = "nb-theme-picker__divider";
    menu.appendChild(divider);

    var wideItem = document.createElement("button");
    wideItem.type = "button";
    wideItem.className = "nb-theme-picker__item";
    wideItem.setAttribute("role", "menuitemcheckbox");

    var wideName = document.createElement("span");
    wideName.textContent = "Wide layout";
    wideItem.appendChild(wideName);

    var wideCheck = document.createElement("span");
    wideCheck.className = "nb-theme-picker__check";
    wideCheck.innerHTML = ICON_CHECK;
    wideItem.appendChild(wideCheck);

    wideItem.addEventListener("click", function () {
      applyLayout(currentLayout() === "wide" ? "centered" : "wide");
      refresh();
      close();
    });

    menu.appendChild(wideItem);

    function refresh() {
      var active = currentTheme();
      var title = "Theme: " + themeLabel(active) + " — switch design theme";
      button.title = title;
      button.setAttribute("aria-label", title);
      var items = menu.querySelectorAll(".nb-theme-picker__item[data-theme]");
      for (var i = 0; i < items.length; i++) {
        items[i].setAttribute(
          "aria-checked",
          items[i].dataset.theme === active ? "true" : "false"
        );
      }
      wideItem.setAttribute(
        "aria-checked",
        currentLayout() === "wide" ? "true" : "false"
      );
    }

    function open() {
      picker.classList.add("nb-theme-picker--open");
      button.setAttribute("aria-expanded", "true");
    }

    function close() {
      picker.classList.remove("nb-theme-picker--open");
      button.setAttribute("aria-expanded", "false");
    }

    button.addEventListener("click", function (event) {
      event.stopPropagation();
      if (picker.classList.contains("nb-theme-picker--open")) close();
      else open();
    });

    document.addEventListener("click", function (event) {
      if (!picker.contains(event.target)) close();
    });

    document.addEventListener("keydown", function (event) {
      if (event.key === "Escape") close();
    });

    refresh();

    picker.appendChild(button);
    picker.appendChild(menu);

    // Place it next to the palette (light/dark) toggle when present.
    var anchor = inner.querySelector(".md-header__option") ||
      inner.querySelector(".md-search");
    inner.insertBefore(picker, anchor);
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", createPicker);
  } else {
    createPicker();
  }
})();
