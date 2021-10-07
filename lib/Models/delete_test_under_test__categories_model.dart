/// status : true
/// success : 1
/// message : "Test has been deleted"

class DeleteTestUnderTestCategoriesModel {
  bool? _status;
  int? _success;
  String? _message;

  bool? get status => _status;
  int? get success => _success;
  String? get message => _message;

  DeleteTestUnderTestCategoriesModel(
      {bool? status, int? success, String? message}) {
    _status = status;
    _success = success;
    _message = message;
  }

  DeleteTestUnderTestCategoriesModel.fromJson(dynamic json) {
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
