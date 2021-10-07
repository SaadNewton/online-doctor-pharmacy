/// data : {"id":43,"name":null,"user_name":null,"email":"john131456@gmail.com","owner_image":null,"slug":null,"owner_name":"John Walker","owner_phone":"343434345","contact_name":null,"contact_phone":null,"otp_is_verified":0,"image_path":null,"country":null,"city":null,"address":"qwessd","lat":"455","long":"55","status":null,"is_active":"1","is_verified":0,"created_at":"2021-09-27T08:15:12.000000Z","updated_at":"2021-09-27T08:15:12.000000Z","auth":{"id":45,"user_id":43,"role":"pharmacy_owner","token":"81a59328f0722a66ada657142d6308ba777b08a22746af9c9d433ca95fa33f38303aafa74ce38d75f64a400843bbd9e1658f","created_at":null,"updated_at":null}}
/// status : true
/// success : 1
/// message : "Pharmacy Owner Registration successfully"

class SignupUserdataModel {
  Data? _data;
  bool? _status;
  int? _success;
  String? _message;

  Data? get data => _data;
  bool? get status => _status;
  int? get success => _success;
  String? get message => _message;

  SignupUserdataModel({
      Data? data, 
      bool? status, 
      int? success, 
      String? message}){
    _data = data;
    _status = status;
    _success = success;
    _message = message;
}

  SignupUserdataModel.fromJson(dynamic json) {
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

/// id : 43
/// name : null
/// user_name : null
/// email : "john131456@gmail.com"
/// owner_image : null
/// slug : null
/// owner_name : "John Walker"
/// owner_phone : "343434345"
/// contact_name : null
/// contact_phone : null
/// otp_is_verified : 0
/// image_path : null
/// country : null
/// city : null
/// address : "qwessd"
/// lat : "455"
/// long : "55"
/// status : null
/// is_active : "1"
/// is_verified : 0
/// created_at : "2021-09-27T08:15:12.000000Z"
/// updated_at : "2021-09-27T08:15:12.000000Z"
/// auth : {"id":45,"user_id":43,"role":"pharmacy_owner","token":"81a59328f0722a66ada657142d6308ba777b08a22746af9c9d433ca95fa33f38303aafa74ce38d75f64a400843bbd9e1658f","created_at":null,"updated_at":null}

class Data {
  int? _id;
  dynamic? _name;
  dynamic? _userName;
  String? _email;
  dynamic? _ownerImage;
  dynamic? _slug;
  String? _ownerName;
  String? _ownerPhone;
  dynamic? _contactName;
  dynamic? _contactPhone;
  int? _otpIsVerified;
  dynamic? _imagePath;
  dynamic? _country;
  dynamic? _city;
  String? _address;
  String? _lat;
  String? _long;
  dynamic? _status;
  String? _isActive;
  int? _isVerified;
  String? _createdAt;
  String? _updatedAt;
  Auth? _auth;

  int? get id => _id;
  dynamic? get name => _name;
  dynamic? get userName => _userName;
  String? get email => _email;
  dynamic? get ownerImage => _ownerImage;
  dynamic? get slug => _slug;
  String? get ownerName => _ownerName;
  String? get ownerPhone => _ownerPhone;
  dynamic? get contactName => _contactName;
  dynamic? get contactPhone => _contactPhone;
  int? get otpIsVerified => _otpIsVerified;
  dynamic? get imagePath => _imagePath;
  dynamic? get country => _country;
  dynamic? get city => _city;
  String? get address => _address;
  String? get lat => _lat;
  String? get long => _long;
  dynamic? get status => _status;
  String? get isActive => _isActive;
  int? get isVerified => _isVerified;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Auth? get auth => _auth;

  Data({
      int? id, 
      dynamic? name, 
      dynamic? userName, 
      String? email, 
      dynamic? ownerImage, 
      dynamic? slug, 
      String? ownerName, 
      String? ownerPhone, 
      dynamic? contactName, 
      dynamic? contactPhone, 
      int? otpIsVerified, 
      dynamic? imagePath, 
      dynamic? country, 
      dynamic? city, 
      String? address, 
      String? lat, 
      String? long, 
      dynamic? status, 
      String? isActive, 
      int? isVerified, 
      String? createdAt, 
      String? updatedAt, 
      Auth? auth}){
    _id = id;
    _name = name;
    _userName = userName;
    _email = email;
    _ownerImage = ownerImage;
    _slug = slug;
    _ownerName = ownerName;
    _ownerPhone = ownerPhone;
    _contactName = contactName;
    _contactPhone = contactPhone;
    _otpIsVerified = otpIsVerified;
    _imagePath = imagePath;
    _country = country;
    _city = city;
    _address = address;
    _lat = lat;
    _long = long;
    _status = status;
    _isActive = isActive;
    _isVerified = isVerified;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _auth = auth;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _userName = json['user_name'];
    _email = json['email'];
    _ownerImage = json['owner_image'];
    _slug = json['slug'];
    _ownerName = json['owner_name'];
    _ownerPhone = json['owner_phone'];
    _contactName = json['contact_name'];
    _contactPhone = json['contact_phone'];
    _otpIsVerified = json['otp_is_verified'];
    _imagePath = json['image_path'];
    _country = json['country'];
    _city = json['city'];
    _address = json['address'];
    _lat = json['lat'];
    _long = json['long'];
    _status = json['status'];
    _isActive = json['is_active'];
    _isVerified = json['is_verified'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _auth = json['auth'] != null ? Auth.fromJson(json['auth']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['user_name'] = _userName;
    map['email'] = _email;
    map['owner_image'] = _ownerImage;
    map['slug'] = _slug;
    map['owner_name'] = _ownerName;
    map['owner_phone'] = _ownerPhone;
    map['contact_name'] = _contactName;
    map['contact_phone'] = _contactPhone;
    map['otp_is_verified'] = _otpIsVerified;
    map['image_path'] = _imagePath;
    map['country'] = _country;
    map['city'] = _city;
    map['address'] = _address;
    map['lat'] = _lat;
    map['long'] = _long;
    map['status'] = _status;
    map['is_active'] = _isActive;
    map['is_verified'] = _isVerified;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_auth != null) {
      map['auth'] = _auth?.toJson();
    }
    return map;
  }

}

/// id : 45
/// user_id : 43
/// role : "pharmacy_owner"
/// token : "81a59328f0722a66ada657142d6308ba777b08a22746af9c9d433ca95fa33f38303aafa74ce38d75f64a400843bbd9e1658f"
/// created_at : null
/// updated_at : null

class Auth {
  int? _id;
  int? _userId;
  String? _role;
  String? _token;
  dynamic? _createdAt;
  dynamic? _updatedAt;

  int? get id => _id;
  int? get userId => _userId;
  String? get role => _role;
  String? get token => _token;
  dynamic? get createdAt => _createdAt;
  dynamic? get updatedAt => _updatedAt;

  Auth({
      int? id, 
      int? userId, 
      String? role, 
      String? token, 
      dynamic? createdAt, 
      dynamic? updatedAt}){
    _id = id;
    _userId = userId;
    _role = role;
    _token = token;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Auth.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _role = json['role'];
    _token = json['token'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['role'] = _role;
    map['token'] = _token;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}