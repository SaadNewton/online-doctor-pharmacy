/// status : true
/// success : 1
/// message : "Test Category has been deleted"

class DeleteTestCategoryModel {
  bool? _status;
  int? _success;
  String? _message;

  bool? get status => _status;
  int? get success => _success;
  String? get message => _message;

  DeleteTestCategoryModel({bool? status, int? success, String? message}) {
    _status = status;
    _success = success;
    _message = message;
  }

  DeleteTestCategoryModel.fromJson(dynamic json) {
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
