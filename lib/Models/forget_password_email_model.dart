/// status : false
/// success : 0
/// message : "Email and Token Does Not Exists"
/// validation : "Email and Token Does Not Exists"

class ForgetPasswordEmailModel {
  bool? _status;
  int? _success;
  String? _message;

  bool? get status => _status;
  int? get success => _success;
  String? get message => _message;

  ForgetPasswordEmailModel({
    bool? status,
    int? success,
    String? message,
  }) {
    _status = status;
    _success = success;
    _message = message;
  }

  ForgetPasswordEmailModel.fromJson(dynamic json) {
    _status = json['status'];
    _success = json['success'];
    _message = json['message'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['status'] = _status;
    map['success'] = _success;
    map['message'] = _message;

    return map;
  }
}
