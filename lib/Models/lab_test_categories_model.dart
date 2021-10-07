/// data : [{"id":4,"lab_id":3,"name":"PCR","slug":"pcr","image_path":"assets/admin/lab/1626671348_download.jpg","discription":"PCR","is_active":null,"created_at":"2021-07-19T05:09:08.000000Z","updated_at":"2021-07-19T05:09:08.000000Z"},{"id":5,"lab_id":3,"name":"Diabties","slug":"diabties","image_path":"assets/admin/lab/1626671370_download.jpg","discription":"Diabties","is_active":null,"created_at":"2021-07-19T05:09:30.000000Z","updated_at":"2021-07-19T05:09:30.000000Z"},{"id":9,"lab_id":3,"name":"HB","slug":"hb","image_path":"assets/admin/lab/1626671468_download.jpg","discription":"HB","is_active":null,"created_at":"2021-07-19T05:11:08.000000Z","updated_at":"2021-07-19T05:11:08.000000Z"}]
/// status : true
/// success : 1
/// message : "Fetching record"

class LabTestCategoriesModel {
  List<Data>? _data;
  bool? _status;
  int? _success;
  String? _message;

  List<Data>? get data => _data;
  bool? get status => _status;
  int? get success => _success;
  String? get message => _message;

  LabTestCategoriesModel(
      {List<Data>? data, bool? status, int? success, String? message}) {
    _data = data;
    _status = status;
    _success = success;
    _message = message;
  }

  LabTestCategoriesModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _status = json['status'];
    _success = json['success'];
    _message = json['message'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    map['success'] = _success;
    map['message'] = _message;
    return map;
  }
}

/// id : 4
/// lab_id : 3
/// name : "PCR"
/// slug : "pcr"
/// image_path : "assets/admin/lab/1626671348_download.jpg"
/// discription : "PCR"
/// is_active : null
/// created_at : "2021-07-19T05:09:08.000000Z"
/// updated_at : "2021-07-19T05:09:08.000000Z"

class Data {
  int? _id;
  int? _labId;
  String? _name;
  String? _slug;
  String? _imagePath;
  String? _discription;
  dynamic? _isActive;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  int? get labId => _labId;
  String? get name => _name;
  String? get slug => _slug;
  String? get imagePath => _imagePath;
  String? get discription => _discription;
  dynamic? get isActive => _isActive;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Data(
      {int? id,
      int? labId,
      String? name,
      String? slug,
      String? imagePath,
      String? discription,
      dynamic? isActive,
      String? createdAt,
      String? updatedAt}) {
    _id = id;
    _labId = labId;
    _name = name;
    _slug = slug;
    _imagePath = imagePath;
    _discription = discription;
    _isActive = isActive;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _labId = json['lab_id'];
    _name = json['name'];
    _slug = json['slug'];
    _imagePath = json['image_path'];
    _discription = json['discription'];
    _isActive = json['is_active'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['lab_id'] = _labId;
    map['name'] = _name;
    map['slug'] = _slug;
    map['image_path'] = _imagePath;
    map['discription'] = _discription;
    map['is_active'] = _isActive;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
