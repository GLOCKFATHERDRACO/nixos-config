{
  # -- privacy
  "dom.security.https_only_mode" = true;
  "privacy.fingerprintingProtection" = true;
  "privacy.fingerprintingProtection.overrides" = "+AllTargets,-CSSPrefersColorScheme,-JSDateTimeUTC";
  "privacy.resistFingerprinting" = false;
  "network.dns.disablePrefetch" = true;
  "network.prefetch-next" = false;
  "media.eme.enabled" = false;
  "extensions.install_origins.enabled" = true;
  "dom.text_fragments.create_text_fragment.enabled" = true;

  # -- permissions
  "permissions.default.geo" = 2;
  "permissions.default.camera" = 2;
  "permissions.default.microphone" = 2;
  "permissions.default.desktop-notification" = 2;
  "permissions.default.xr" = 2;

  # -- annoyances
  "accessibility.force_disabled" = 1;
  "browser.aboutConfig.showWarning" = false;
  "browser.shell.checkDefaultBrowser" = false;
  "browser.tabs.warnOnClose" = false;
  "browser.bookmarks.addedImportButton" = false;
  "browser.migrate.bookmarks-file.enabled" = false;
  "browser.sessionstore.resume_from_crash" = false;
  "middlemouse.paste" = false;
  "network.protocol-handler.external.mailto" = false;
  "network.protocol-handler.warn-external-default" = false;
  "browser.translations.neverTranslateLanguages" = "en";
  "signon.rememberSignons" = false;

  # -- appearance
  "browser.startup.homepage" = "about:home";
  "browser.startup.page" = 1;
  "browser.toolbars.bookmarks.visibility" = "newtab";
  "intl.accept_languages" = "en-US, en";
  "browser.display.use_document_fonts" = 0;
  "widget.gtk.libadwaita-colors.enabled" = false;
  "general.autoScroll" = true;

  # -- gpu prefs
  "gfx.canvas.accelerated" = true;
  "webgl.disabled" = true;

  # -- clear on shutdown overrides
  "privacy.sanitize.sanitizeOnShutdown" = false;
  "privacy.clearOnShutdown_v2.browsingHistoryAndDownloads" = true;
  "privacy.clearOnShutdown_v2.cache" = true;
  "privacy.clearOnShutdown_v2.formdata" = true;
  "privacy.clearOnShutdown_v2.cookiesAndStorage" = false;
  "privacy.clearOnShutdown_v2.siteSettings" = false;
}
