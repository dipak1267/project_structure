class AppUrls {
  // ignore: constant_identifier_names
  static const String _BASE_URL_TEST = "";

  // ignore: constant_identifier_names
  static const String _BASE_URL = ""; // dev base url
  // ignore: constant_identifier_names
  static const String _DEV_BASE_URL = "${_BASE_URL_TEST}"; // dev base url
  // ignore: constant_identifier_names
  static const bool IS_LIVE = false;

  // ignore: constant_identifier_names
  static const String _LIVE_BASE_URL = "${_BASE_URL}"; // live base url
  // ignore: constant_identifier_names

  /// Create request with query parameter
  // ignore: constant_identifier_names
  static const String BASE_URL = "${IS_LIVE ? _LIVE_BASE_URL : _DEV_BASE_URL}";

  static const String imageUrl = "${IS_LIVE
      ? _BASE_URL
      : _BASE_URL_TEST}app_images/";
}

class MethodNames {
  // userModule apis
  static const userSignIn = "login";
  static const userSignUp = "registration";
  static const forgotPassword = "forgotPassword";
  static const resetPassword = "changePasswordWithVerifyCode";
  static const changePassword = "changePassword";
}

class RequestParam {
  static const service = "Service"; // -> pass method name
  static const showError = "show_error"; // -> bool in String
}

class RequestHeaderKey {
  static const contentType = "Content-Type";
  static const userAgent = "User-Agent";
  static const appSecret = "App-Secret";
  static const appTrackVersion = "App-Track-Version";
  static const appDeviceType = "App-Device-Type";
  static const appStoreVersion = "App-Store-Version";
  static const appDeviceModel = "App-Device-Model";
  static const appOsVersion = "App-Os-Version";
  static const appStoreBuildNumber = "App-Store-Build-Number";
  static const authToken = "Auth-Token";
  static const accessControlAllowOrigin = "Access-Control-Allow-Origin";
}
