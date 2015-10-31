/*
TODO:
  noscript/pocket/adblock settings
*/

// no need to warn from editting about:config
user_pref("general.warnOnAboutConfig", false);

// general settings
user_pref("signon.rememberSignons", false);

// locale settings
user_pref("spellchecker.dictionary", "en-US");
user_pref("browser.search.region", "US");
user_pref("browser.search.countryCode", "US");

// ensure that Google is used as the search engine
user_pref("browser.search.defaultenginename", "Google");
user_pref("browser.search.defaultenginename.US", "Google");

// turn off health report and telemetry traffic
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("toolkit.telemetry.reportingpolicy.firstRun", false);

// security and privacy network settings
user_pref("network.prefetch-next", false);
user_pref("network.dns.disablePrefetch", true);
user_pref("browser.send_pings", false);
user_pref("beacon.enabled", false);
user_pref("geo.enabled", false);
user_pref("security.tls.version.min", 1);

// disable WebRTC to prevent leaking IP
user_pref("media.peerconnection.enabled", false);
user_pref("media.peerconnection.video.enabled", false);

// make web development easier by changing some settings that can be annoying
user_pref("network.dnsCacheExpiration", 0);
user_pref("network.dnsCacheExpirationGracePeriod", 0);
user_pref("browser.fixup.dns_first_for_single_words", 0);
user_pref("browser.fixup.alternate.enabled", false);
