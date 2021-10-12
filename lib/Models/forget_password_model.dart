/// status : true
/// success : 1
/// message : "Pasword Updated Successfully"
/// validation : "Pasword Updated Successfully"

class ForgetPasswordModel {
  bool? _status;
  int? _success;
  String? _message;
  String? _validation;

  bool? get status => _status;
  int? get success => _success;
  String? get message => _message;
  String? get validation => _validation;

  ForgetPasswordModel({
      bool? status, 
      int? success, 
      String? message, 
      String? validation}){
    _status = status;
    _success = success;
    _message = message;
    _validation = validation;
}

  ForgetPasswordModel.fromJson(dynamic json) {
    _status = json['status'];
    _success = json['success'];
    _message = json['message'];
    _validation = json['validation'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['status'] = _status;
    map['success'] = _success;
    map['message'] = _message;
    map['validation'] = _validation;
    return map;
  }

}