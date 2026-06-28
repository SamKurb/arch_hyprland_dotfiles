// Text and Background
user_pref("browser.display.background_color", "{{ background  | lighten(0.0627) }}");
user_pref("browser.display.foreground_color", "{{ foreground }}");

// Link Colors
user_pref("browser.anchor_color", "{{ color7 }}");   // unvisited links
user_pref("browser.visited_color", "{{ color3 }}");  // visited links


// userchrome.css usercontent.css activate
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

// Fill SVG Color
user_pref("svg.context-properties.content.enabled", true);

// CSS's `:has()` selector 
user_pref("layout.css.has-selector.enabled", true);
