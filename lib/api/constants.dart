import 'package:project_structure/api/request_constants.dart';

import '../constant/constant.dart';

Map<String, String> requestHeader(bool passAuthToken, {bool? isChatGpt}) {
  return {
    RequestHeaderKey.contentType: "application/json",
    RequestHeaderKey.appSecret: "",
    RequestHeaderKey.userAgent: "",
    RequestHeaderKey.appTrackVersion: "",
    RequestHeaderKey.appStoreVersion: '',
    RequestHeaderKey.appDeviceModel: '',
    RequestHeaderKey.appOsVersion: '',
    RequestHeaderKey.appStoreBuildNumber: '',
  };
}
