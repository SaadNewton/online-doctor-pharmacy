/// data : {"lab_id":"3","test_category_id":"47","name":"Liver Test 5","price":"1000","est_time":"20 Hours","is_available_for_home":"0","description":"Liver Test 5 des","slug":"liver-test-5","image_path":"assets/admin/lab/1632114458_cover.jpg","updated_at":"2021-09-20T05:07:38.000000Z","created_at":"2021-09-20T05:07:38.000000Z","id":14}
/// status : true
/// success : 1
/// message : "Test has been added"

class AddTestUnderTestCategoryModel {
  Data? _data;
  bool? _status;
  int? _success;
  String? _message;

  Data? get data => _data;
  bool? get status => _status;
  int? get success => _success;
  String? get message => _message;

  AddTestUnderTestCategoryModel(
      {Data? data, bool? status, int? success, String? message}) {
    _data = data;
    _status = status;
    _success = success;
    _message = message;
  }

  AddTestUnderTestCategoryModel.fromJson(dynamic json) {
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

/// lab_id : "3"
/// test_category_id : "47"
/// name : "Liver Test 5"
/// price : "1000"
/// est_time : "20 Hours"
/// is_available_for_home : "0"
/// description : "Liver Test 5 des"
/// slug : "liver-test-5"
/// image_path : "assets/admin/lab/1632114458_cover.jpg"
/// updated_at : "2021-09-20T05:07:38.000000Z"
/// created_at : "2021-09-20T05:07:38.000000Z"
/// id : 14

class Data {
  String? _labId;
  String? _testCategoryId;
  String? _name;
  String? _price;
  String? _estTime;
  String? _isAvailableForHome;
  String? _description;
  String? _slug;
  String? _imagePath;
  String? _updatedAt;
  String? _createdAt;
  int? _id;

  String? get labId => _labId;
  String? get testCategoryId => _testCategoryId;
  String? get name => _name;
  String? get price => _price;
  String? get estTime => _estTime;
  String? get isAvailableForHome => _isAvailableForHome;
  String? get description => _description;
  String? get slug => _slug;
  String? get imagePath => _imagePath;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;
  int? get id => _id;

  Data(
      {String? labId,
      String? testCategoryId,
      String? name,
      String? price,
      String? estTime,
      String? isAvailableForHome,
      String? description,
      String? slug,
      String? imagePath,
      String? updatedAt,
      String? createdAt,
      int? id}) {
    _labId = labId;
    _testCategoryId = testCategoryId;
    _name = name;
    _price = price;
    _estTime = estTime;
    _isAvailableForHome = isAvailableForHome;
    _description = description;
    _slug = slug;
    _imagePath = imagePath;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
  }

  Data.fromJson(dynamic json) {
    _labId = json['lab_id'];
    _testCategoryId = json['test_category_id'];
    _name = json['name'];
    _price = json['price'];
    _estTime = json['est_time'];
    _isAvailableForHome = json['is_available_for_home'];
    _description = json['description'];
    _slug = json['slug'];
    _imagePath = json['image_path'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['lab_id'] = _labId;
    map['test_category_id'] = _testCategoryId;
    map['name'] = _name;
    map['price'] = _price;
    map['est_time'] = _estTime;
    map['is_available_for_home'] = _isAvailableForHome;
    map['description'] = _description;
    map['slug'] = _slug;
    map['image_path'] = _imagePath;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    return map;
  }
}
