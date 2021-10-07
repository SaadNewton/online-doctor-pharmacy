/// data : {"id":1,"user_id":1,"user_type":"doctor","token":"213123sdf,lsdh","is_active":"1","created_at":null,"updated_at":null}
/// status : true
/// success : 1
/// message : "Token created successfully"

class GetNotifyTokenModel {
  Data? _data;
  bool? _status;
  int? _success;
  String? _message;

  Data? get data => _data;
  bool? get status => _status;
  int? get success => _success;
  String? get message => _message;

  GetNotifyTokenModel({
      Data? data, 
      bool? status, 
      int? success, 
      String? message}){
    _data = data;
    _status = status;
    _success = success;
    _message = message;
}

  GetNotifyTokenModel.fromJson(dynamic json) {
    _data = json["data"] != null ? Data.fromJson(json["data"]) : null;
    _status = json["status"];
    _success = json["success"];
    _message = json["message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_data != null) {
      map["data"] = _data?.toJson();
    }
    map["status"] = _status;
    map["success"] = _success;
    map["message"] = _message;
    return map;
  }

}

/// id : 1
/// user_id : 1
/// user_type : "doctor"
/// token : "213123sdf,lsdh"
/// is_active : "1"
/// created_at : null
/// updated_at : null

class Data {
  int? _id;
  int? _userId;
  String? _userType;
  String? _token;
  String? _isActive;
  dynamic? _createdAt;
  dynamic? _updatedAt;

  int? get id => _id;
  int? get userId => _userId;
  String? get userType => _userType;
  String? get token => _token;
  String? get isActive => _isActive;
  dynamic? get createdAt => _createdAt;
  dynamic? get updatedAt => _updatedAt;

  Data({
      int? id, 
      int? userId, 
      String? userType, 
      String? token, 
      String? isActive, 
      dynamic? createdAt, 
      dynamic? updatedAt}){
    _id = id;
    _userId = userId;
    _userType = userType;
    _token = token;
    _isActive = isActive;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json["id"];
    _userId = json["user_id"];
    _userType = json["user_type"];
    _token = json["token"];
    _isActive = json["is_active"];
    _createdAt = json["created_at"];
    _updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["user_id"] = _userId;
    map["user_type"] = _userType;
    map["token"] = _token;
    map["is_active"] = _isActive;
    map["created_at"] = _createdAt;
    map["updated_at"] = _updatedAt;
    return map;
  }

}