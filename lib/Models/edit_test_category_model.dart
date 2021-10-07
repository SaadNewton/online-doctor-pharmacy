/// status : false
/// success : 0
/// message : "Missing fields are required"
/// validation : {"update_id":["The update id field is required."],"lab_id":["The lab id field is required."],"name":["The name field is required."]}

class EditTestCategoryModel {
  bool? _status;
  int? _success;
  String? _message;
  Validation? _validation;

  bool? get status => _status;
  int? get success => _success;
  String? get message => _message;
  Validation? get validation => _validation;

  EditTestCategoryModel(
      {bool? status, int? success, String? message, Validation? validation}) {
    _status = status;
    _success = success;
    _message = message;
    _validation = validation;
  }

  EditTestCategoryModel.fromJson(dynamic json) {
    _status = json['status'];
    _success = json['success'];
    _message = json['message'];
    _validation = json['validation'] != null
        ? Validation.fromJson(json['validation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['status'] = _status;
    map['success'] = _success;
    map['message'] = _message;
    if (_validation != null) {
      map['validation'] = _validation?.toJson();
    }
    return map;
  }
}

/// update_id : ["The update id field is required."]
/// lab_id : ["The lab id field is required."]
/// name : ["The name field is required."]

class Validation {
  List<String>? _updateId;
  List<String>? _labId;
  List<String>? _name;

  List<String>? get updateId => _updateId;
  List<String>? get labId => _labId;
  List<String>? get name => _name;

  Validation(
      {List<String>? updateId, List<String>? labId, List<String>? name}) {
    _updateId = updateId;
    _labId = labId;
    _name = name;
  }

  Validation.fromJson(dynamic json) {
    _updateId =
        json['update_id'] != null ? json['update_id'].cast<String>() : [];
    _labId = json['lab_id'] != null ? json['lab_id'].cast<String>() : [];
    _name = json['name'] != null ? json['name'].cast<String>() : [];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['update_id'] = _updateId;
    map['lab_id'] = _labId;
    map['name'] = _name;
    return map;
  }
}
