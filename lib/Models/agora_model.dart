/// channel_name : "onlinedoctor"
/// token : "0065960b0461e6c4b0a842848d82653e870IAC8oNRcNORdhoosu6Fi6TyDPPL222D4mg/xEGpNRBl0ASvYR6oAAAAAIgDSvifOG/xbYQQAAQAb/FthAgAb/FthAwAb/FthBAAb/Fth"

class AgoraModel {
  String? _channelName;
  String? _token;

  String? get channelName => _channelName;
  String? get token => _token;

  set channelName(String? name) {
    this._channelName = name;
  }

  set token(String? name) {
    this._token = name;
  }

  AgoraModel({String? channelName, String? token}) {
    _channelName = channelName;
    _token = token;
  }

  AgoraModel.fromJson(dynamic json) {
    _channelName = json["channel_name"];
    _token = json["token"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["channel_name"] = _channelName;
    map["token"] = _token;
    return map;
  }
}
