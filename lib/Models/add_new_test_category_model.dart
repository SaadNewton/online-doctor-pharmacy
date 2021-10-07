/// data : {"name":"sfg","discription":"sfg","lab_id":"3","slug":"sfg","updated_at":"2021-09-16T10:53:04.000000Z","created_at":"2021-09-16T10:53:04.000000Z","id":19}
/// status : true
/// success : 1
/// message : "Test Category has been added"

class AddNewTestCategory {
  Data? _data;
  bool? _status;
  int? _success;
  String? _message;

  Data? get data => _data;
  bool? get status => _status;
  int? get success => _success;
  String? get message => _message;

  AddNewTestCategory(
      {Data? data, bool? status, int? success, String? message}) {
    _data = data;
    _status = status;
    _success = success;
    _message = message;
  }

  AddNewTestCategory.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _status = json['status'];
    _success = json['success'];
    _message = json['message'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['status'] = _status;
    map['success'] = _success;
    map['message'] = _message;
    return map;
  }
}

/// name : "sfg"
/// discription : "sfg"
/// lab_id : "3"
/// slug : "sfg"
/// updated_at : "2021-09-16T10:53:04.000000Z"
/// created_at : "2021-09-16T10:53:04.000000Z"
/// id : 19

class Data {
  String? _name;
  String? _discription;
  String? _labId;
  String? _slug;
  String? _updatedAt;
  String? _createdAt;
  int? _id;

  String? get name => _name;
  String? get discription => _discription;
  String? get labId => _labId;
  String? get slug => _slug;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;
  int? get id => _id;

  Data(
      {String? name,
      String? discription,
      String? labId,
      String? slug,
      String? updatedAt,
      String? createdAt,
      int? id}) {
    _name = name;
    _discription = discription;
    _labId = labId;
    _slug = slug;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
  }

  Data.fromJson(dynamic json) {
    _name = json['name'];
    _discription = json['discription'];
    _labId = json['lab_id'];
    _slug = json['slug'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['name'] = _name;
    map['discription'] = _discription;
    map['lab_id'] = _labId;
    map['slug'] = _slug;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    return map;
  }
}
