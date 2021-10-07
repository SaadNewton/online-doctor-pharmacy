/// data : [{"id":4,"lab_id":3,"test_category_id":4,"name":"PCR","slug":"pcr","image_path":"assets/admin/lab/1626680910_download.jpg","price":"250","est_time":"15","is_available_for_home":1,"description":"pcr","created_at":"2021-07-19T07:48:30.000000Z","updated_at":"2021-07-19T07:48:30.000000Z"}]
/// status : true
/// success : 1
/// message : "Fetching record"

class TestsByTestCategoryModel {
  List<TestsByTestCategoryModelData>? _data;
  bool? _status;
  int? _success;
  String? _message;

  List<TestsByTestCategoryModelData>? get data => _data;
  bool? get status => _status;
  int? get success => _success;
  String? get message => _message;

  TestsByTestCategoryModel(
      {List<TestsByTestCategoryModelData>? data,
      bool? status,
      int? success,
      String? message}) {
    _data = data;
    _status = status;
    _success = success;
    _message = message;
  }

  TestsByTestCategoryModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(TestsByTestCategoryModelData.fromJson(v));
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
/// test_category_id : 4
/// name : "PCR"
/// slug : "pcr"
/// image_path : "assets/admin/lab/1626680910_download.jpg"
/// price : "250"
/// est_time : "15"
/// is_available_for_home : 1
/// description : "pcr"
/// created_at : "2021-07-19T07:48:30.000000Z"
/// updated_at : "2021-07-19T07:48:30.000000Z"

class TestsByTestCategoryModelData {
  int? _id;
  int? _labId;
  int? _testCategoryId;
  String? _name;
  String? _slug;
  String? _imagePath;
  String? _price;
  String? _estTime;
  int? _isAvailableForHome;
  String? _description;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  int? get labId => _labId;
  int? get testCategoryId => _testCategoryId;
  String? get name => _name;
  String? get slug => _slug;
  String? get imagePath => _imagePath;
  String? get price => _price;
  String? get estTime => _estTime;
  int? get isAvailableForHome => _isAvailableForHome;
  String? get description => _description;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  TestsByTestCategoryModelData(
      {int? id,
      int? labId,
      int? testCategoryId,
      String? name,
      String? slug,
      String? imagePath,
      String? price,
      String? estTime,
      int? isAvailableForHome,
      String? description,
      String? createdAt,
      String? updatedAt}) {
    _id = id;
    _labId = labId;
    _testCategoryId = testCategoryId;
    _name = name;
    _slug = slug;
    _imagePath = imagePath;
    _price = price;
    _estTime = estTime;
    _isAvailableForHome = isAvailableForHome;
    _description = description;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  TestsByTestCategoryModelData.fromJson(dynamic json) {
    _id = json['id'];
    _labId = json['lab_id'];
    _testCategoryId = json['test_category_id'];
    _name = json['name'];
    _slug = json['slug'];
    _imagePath = json['image_path'];
    _price = json['price'];
    _estTime = json['est_time'];
    _isAvailableForHome = json['is_available_for_home'];
    _description = json['description'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['lab_id'] = _labId;
    map['test_category_id'] = _testCategoryId;
    map['name'] = _name;
    map['slug'] = _slug;
    map['image_path'] = _imagePath;
    map['price'] = _price;
    map['est_time'] = _estTime;
    map['is_available_for_home'] = _isAvailableForHome;
    map['description'] = _description;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
