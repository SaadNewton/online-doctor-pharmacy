/// data : {"current_page":1,"data":[{"id":1,"customer_id":2,"order_id":14,"pharmacy_id":1,"image_path1":null,"image_path2":null,"is_prescription":0,"created_at":"2021-09-02T04:59:12.000000Z","updated_at":"2021-09-02T04:59:12.000000Z","product":[{"id":4,"order_id":14,"product_id":1,"category_id":1,"company_id":2,"name":"Arinac","salt_name":"Arinac","image_path":null,"retail_price":null,"sale_price":"240","sku":"1986","qty":"1","potency":"20mg","type":"medicine","created_at":"2021-09-02T04:59:12.000000Z","updated_at":"2021-09-02T04:59:12.000000Z"},{"id":5,"order_id":14,"product_id":24438,"category_id":1,"company_id":2,"name":"Trust-Regular-Long-Stick-ons-Napkins-16-Pack","salt_name":"","image_path":null,"retail_price":null,"sale_price":"170","sku":"OD6NHWD","qty":"1","potency":"","type":"medicine","created_at":"2021-09-02T04:59:12.000000Z","updated_at":"2021-09-02T04:59:12.000000Z"},{"id":6,"order_id":14,"product_id":24436,"category_id":1,"company_id":2,"name":"Tampax-Backup-Protection-Super-Plus-Unscented-Tampons,-40-Pack","salt_name":"","image_path":null,"retail_price":null,"sale_price":"1950","sku":"OD7LQTO","qty":"1","potency":"","type":"medicine","created_at":"2021-09-02T04:59:12.000000Z","updated_at":"2021-09-02T04:59:12.000000Z"},{"id":7,"order_id":14,"product_id":24439,"category_id":1,"company_id":2,"name":"Trust-Regular-Long-Stick-ons-Thicks-Napkins-10-Pack","salt_name":"Trust-Regular-Long-Stick-ons-Thicks-Napkins-10-Pack","image_path":null,"retail_price":null,"sale_price":"344","sku":"ODE1Z8P","qty":"1","potency":"20mg","type":"medicine","created_at":"2021-09-02T04:59:12.000000Z","updated_at":"2021-09-02T04:59:12.000000Z"}],"order":{"id":14,"customer_id":2,"session_id":null,"customer_name":null,"shipping_method":null,"payment_method":"Easy Paisa","sub_total":"2704","total_price":"2704","shipping_price":"0","tax":"0","discount":null,"status":"pending","lab_id":null,"pharmacy_id":null,"is_prescription":0,"image_path1":null,"image_path2":null,"created_at":"2021-09-02T04:59:12.000000Z","updated_at":"2021-09-02T04:59:12.000000Z"},"pharmacy":{"id":1,"name":"Care Pharmacy","user_name":null,"email":"hassanbilal099@gmail.com","owner_image":null,"slug":"care-pharmacy","owner_name":"Bilal Hassan","owner_phone":"656565","contact_name":"Atif","contact_phone":"4343434","image_path":"assets/admin/pharmacy/1628578887_b.jpg","country":"Pakistan","city":"Faisalabad","address":"Kohinoor Town Madina Town, Faisalabad, Pakistan","lat":"31.466512","long":"73.0696543","status":null,"is_active":"1","is_verified":1,"created_at":"2021-08-10T06:58:13.000000Z","updated_at":"2021-08-10T07:03:47.000000Z"},"customer":{"id":2,"name":"Bilal Hassan","user_name":null,"email":"hassanbilal099@gmail.com","image":null,"phone":"454545","address":"Faisalabad - Samundri Road, Faisalabad, Pakistan","country":null,"city":null,"state":null,"postal_code":null,"lat":"31.45036619999999","long":"73.13496049999999","location":null,"status":null,"is_active":null,"created_at":"2021-08-10T05:57:52.000000Z","updated_at":"2021-08-10T05:57:52.000000Z"}}],"first_page_url":"http://192.168.88.43:8000/api/order-request?page=1","from":1,"last_page":1,"last_page_url":"http://192.168.88.43:8000/api/order-request?page=1","next_page_url":null,"path":"http://192.168.88.43:8000/api/order-request","per_page":20,"prev_page_url":null,"to":1,"total":1}
/// status : true
/// success : 1
/// message : "Fetching record"

class OrderRequestsModel {
  OrderData? _data;
  bool? _status;
  int? _success;
  String? _message;

  OrderData? get data => _data;
  bool? get status => _status;
  int? get success => _success;
  String? get message => _message;

  OrderRequestsModel(
      {OrderData? data, bool? status, int? success, String? message}) {
    _data = data;
    _status = status;
    _success = success;
    _message = message;
  }

  OrderRequestsModel.fromJson(dynamic json) {
    _data = json['data'] != null ? OrderData.fromJson(json['data']) : null;
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

/// current_page : 1
/// data : [{"id":1,"customer_id":2,"order_id":14,"pharmacy_id":1,"image_path1":null,"image_path2":null,"is_prescription":0,"created_at":"2021-09-02T04:59:12.000000Z","updated_at":"2021-09-02T04:59:12.000000Z","product":[{"id":4,"order_id":14,"product_id":1,"category_id":1,"company_id":2,"name":"Arinac","salt_name":"Arinac","image_path":null,"retail_price":null,"sale_price":"240","sku":"1986","qty":"1","potency":"20mg","type":"medicine","created_at":"2021-09-02T04:59:12.000000Z","updated_at":"2021-09-02T04:59:12.000000Z"},{"id":5,"order_id":14,"product_id":24438,"category_id":1,"company_id":2,"name":"Trust-Regular-Long-Stick-ons-Napkins-16-Pack","salt_name":"","image_path":null,"retail_price":null,"sale_price":"170","sku":"OD6NHWD","qty":"1","potency":"","type":"medicine","created_at":"2021-09-02T04:59:12.000000Z","updated_at":"2021-09-02T04:59:12.000000Z"},{"id":6,"order_id":14,"product_id":24436,"category_id":1,"company_id":2,"name":"Tampax-Backup-Protection-Super-Plus-Unscented-Tampons,-40-Pack","salt_name":"","image_path":null,"retail_price":null,"sale_price":"1950","sku":"OD7LQTO","qty":"1","potency":"","type":"medicine","created_at":"2021-09-02T04:59:12.000000Z","updated_at":"2021-09-02T04:59:12.000000Z"},{"id":7,"order_id":14,"product_id":24439,"category_id":1,"company_id":2,"name":"Trust-Regular-Long-Stick-ons-Thicks-Napkins-10-Pack","salt_name":"Trust-Regular-Long-Stick-ons-Thicks-Napkins-10-Pack","image_path":null,"retail_price":null,"sale_price":"344","sku":"ODE1Z8P","qty":"1","potency":"20mg","type":"medicine","created_at":"2021-09-02T04:59:12.000000Z","updated_at":"2021-09-02T04:59:12.000000Z"}],"order":{"id":14,"customer_id":2,"session_id":null,"customer_name":null,"shipping_method":null,"payment_method":"Easy Paisa","sub_total":"2704","total_price":"2704","shipping_price":"0","tax":"0","discount":null,"status":"pending","lab_id":null,"pharmacy_id":null,"is_prescription":0,"image_path1":null,"image_path2":null,"created_at":"2021-09-02T04:59:12.000000Z","updated_at":"2021-09-02T04:59:12.000000Z"},"pharmacy":{"id":1,"name":"Care Pharmacy","user_name":null,"email":"hassanbilal099@gmail.com","owner_image":null,"slug":"care-pharmacy","owner_name":"Bilal Hassan","owner_phone":"656565","contact_name":"Atif","contact_phone":"4343434","image_path":"assets/admin/pharmacy/1628578887_b.jpg","country":"Pakistan","city":"Faisalabad","address":"Kohinoor Town Madina Town, Faisalabad, Pakistan","lat":"31.466512","long":"73.0696543","status":null,"is_active":"1","is_verified":1,"created_at":"2021-08-10T06:58:13.000000Z","updated_at":"2021-08-10T07:03:47.000000Z"},"customer":{"id":2,"name":"Bilal Hassan","user_name":null,"email":"hassanbilal099@gmail.com","image":null,"phone":"454545","address":"Faisalabad - Samundri Road, Faisalabad, Pakistan","country":null,"city":null,"state":null,"postal_code":null,"lat":"31.45036619999999","long":"73.13496049999999","location":null,"status":null,"is_active":null,"created_at":"2021-08-10T05:57:52.000000Z","updated_at":"2021-08-10T05:57:52.000000Z"}}]
/// first_page_url : "http://192.168.88.43:8000/api/order-request?page=1"
/// from : 1
/// last_page : 1
/// last_page_url : "http://192.168.88.43:8000/api/order-request?page=1"
/// next_page_url : null
/// path : "http://192.168.88.43:8000/api/order-request"
/// per_page : 20
/// prev_page_url : null
/// to : 1
/// total : 1

class OrderData {
  int? _currentPage;
  List<OrderDetailData>? _data;
  String? _firstPageUrl;
  int? _from;
  int? _lastPage;
  String? _lastPageUrl;
  dynamic? _nextPageUrl;
  String? _path;
  int? _perPage;
  dynamic? _prevPageUrl;
  int? _to;
  int? _total;

  int? get currentPage => _currentPage;
  List<OrderDetailData>? get data => _data;
  String? get firstPageUrl => _firstPageUrl;
  int? get from => _from;
  int? get lastPage => _lastPage;
  String? get lastPageUrl => _lastPageUrl;
  dynamic? get nextPageUrl => _nextPageUrl;
  String? get path => _path;
  int? get perPage => _perPage;
  dynamic? get prevPageUrl => _prevPageUrl;
  int? get to => _to;
  int? get total => _total;

  OrderData(
      {int? currentPage,
      List<OrderDetailData>? data,
      String? firstPageUrl,
      int? from,
      int? lastPage,
      String? lastPageUrl,
      dynamic? nextPageUrl,
      String? path,
      int? perPage,
      dynamic? prevPageUrl,
      int? to,
      int? total}) {
    _currentPage = currentPage;
    _data = data;
    _firstPageUrl = firstPageUrl;
    _from = from;
    _lastPage = lastPage;
    _lastPageUrl = lastPageUrl;
    _nextPageUrl = nextPageUrl;
    _path = path;
    _perPage = perPage;
    _prevPageUrl = prevPageUrl;
    _to = to;
    _total = total;
  }

  OrderData.fromJson(dynamic json) {
    _currentPage = json['current_page']!;
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(OrderDetailData.fromJson(v));
      });
    }
    _firstPageUrl = json['first_page_url'];
    _from = json['from'];
    _lastPage = json['last_page'];
    _lastPageUrl = json['last_page_url'];
    _nextPageUrl = json['next_page_url'];
    _path = json['path'];
    _perPage = json['per_page'];
    _prevPageUrl = json['prev_page_url'];
    _to = json['to'];
    _total = json['total'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['current_page'] = _currentPage;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['first_page_url'] = _firstPageUrl;
    map['from'] = _from;
    map['last_page'] = _lastPage;
    map['last_page_url'] = _lastPageUrl;
    map['next_page_url'] = _nextPageUrl;
    map['path'] = _path;
    map['per_page'] = _perPage;
    map['prev_page_url'] = _prevPageUrl;
    map['to'] = _to;
    map['total'] = _total;
    return map;
  }
}

/// id : 1
/// customer_id : 2
/// order_id : 14
/// pharmacy_id : 1
/// image_path1 : null
/// image_path2 : null
/// is_prescription : 0
/// created_at : "2021-09-02T04:59:12.000000Z"
/// updated_at : "2021-09-02T04:59:12.000000Z"
/// product : [{"id":4,"order_id":14,"product_id":1,"category_id":1,"company_id":2,"name":"Arinac","salt_name":"Arinac","image_path":null,"retail_price":null,"sale_price":"240","sku":"1986","qty":"1","potency":"20mg","type":"medicine","created_at":"2021-09-02T04:59:12.000000Z","updated_at":"2021-09-02T04:59:12.000000Z"},{"id":5,"order_id":14,"product_id":24438,"category_id":1,"company_id":2,"name":"Trust-Regular-Long-Stick-ons-Napkins-16-Pack","salt_name":"","image_path":null,"retail_price":null,"sale_price":"170","sku":"OD6NHWD","qty":"1","potency":"","type":"medicine","created_at":"2021-09-02T04:59:12.000000Z","updated_at":"2021-09-02T04:59:12.000000Z"},{"id":6,"order_id":14,"product_id":24436,"category_id":1,"company_id":2,"name":"Tampax-Backup-Protection-Super-Plus-Unscented-Tampons,-40-Pack","salt_name":"","image_path":null,"retail_price":null,"sale_price":"1950","sku":"OD7LQTO","qty":"1","potency":"","type":"medicine","created_at":"2021-09-02T04:59:12.000000Z","updated_at":"2021-09-02T04:59:12.000000Z"},{"id":7,"order_id":14,"product_id":24439,"category_id":1,"company_id":2,"name":"Trust-Regular-Long-Stick-ons-Thicks-Napkins-10-Pack","salt_name":"Trust-Regular-Long-Stick-ons-Thicks-Napkins-10-Pack","image_path":null,"retail_price":null,"sale_price":"344","sku":"ODE1Z8P","qty":"1","potency":"20mg","type":"medicine","created_at":"2021-09-02T04:59:12.000000Z","updated_at":"2021-09-02T04:59:12.000000Z"}]
/// order : {"id":14,"customer_id":2,"session_id":null,"customer_name":null,"shipping_method":null,"payment_method":"Easy Paisa","sub_total":"2704","total_price":"2704","shipping_price":"0","tax":"0","discount":null,"status":"pending","lab_id":null,"pharmacy_id":null,"is_prescription":0,"image_path1":null,"image_path2":null,"created_at":"2021-09-02T04:59:12.000000Z","updated_at":"2021-09-02T04:59:12.000000Z"}
/// pharmacy : {"id":1,"name":"Care Pharmacy","user_name":null,"email":"hassanbilal099@gmail.com","owner_image":null,"slug":"care-pharmacy","owner_name":"Bilal Hassan","owner_phone":"656565","contact_name":"Atif","contact_phone":"4343434","image_path":"assets/admin/pharmacy/1628578887_b.jpg","country":"Pakistan","city":"Faisalabad","address":"Kohinoor Town Madina Town, Faisalabad, Pakistan","lat":"31.466512","long":"73.0696543","status":null,"is_active":"1","is_verified":1,"created_at":"2021-08-10T06:58:13.000000Z","updated_at":"2021-08-10T07:03:47.000000Z"}
/// customer : {"id":2,"name":"Bilal Hassan","user_name":null,"email":"hassanbilal099@gmail.com","image":null,"phone":"454545","address":"Faisalabad - Samundri Road, Faisalabad, Pakistan","country":null,"city":null,"state":null,"postal_code":null,"lat":"31.45036619999999","long":"73.13496049999999","location":null,"status":null,"is_active":null,"created_at":"2021-08-10T05:57:52.000000Z","updated_at":"2021-08-10T05:57:52.000000Z"}

class OrderDetailData {
  int? _id;
  int? _customerId;
  int? _orderId;
  int? _pharmacyId;
  dynamic? _imagePath1;
  dynamic? _imagePath2;
  int? _isPrescription;
  String? _createdAt;
  String? _updatedAt;
  List<Product>? _product;
  Order? _order;
  Pharmacy? _pharmacy;
  Customer? _customer;

  int? get id => _id;
  int? get customerId => _customerId;
  int? get orderId => _orderId;
  int? get pharmacyId => _pharmacyId;
  dynamic? get imagePath1 => _imagePath1;
  dynamic? get imagePath2 => _imagePath2;
  int? get isPrescription => _isPrescription;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  List<Product>? get product => _product;
  Order? get order => _order;
  Pharmacy? get pharmacy => _pharmacy;
  Customer? get customer => _customer;

  OrderDetailData(
      {int? id,
      int? customerId,
      int? orderId,
      int? pharmacyId,
      dynamic? imagePath1,
      dynamic? imagePath2,
      int? isPrescription,
      String? createdAt,
      String? updatedAt,
      List<Product>? product,
      Order? order,
      Pharmacy? pharmacy,
      Customer? customer}) {
    _id = id;
    _customerId = customerId;
    _orderId = orderId;
    _pharmacyId = pharmacyId;
    _imagePath1 = imagePath1;
    _imagePath2 = imagePath2;
    _isPrescription = isPrescription;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _product = product;
    _order = order;
    _pharmacy = pharmacy;
    _customer = customer;
  }

  OrderDetailData.fromJson(dynamic json) {
    _id = json['id'];
    _customerId = json['customer_id'];
    _orderId = json['order_id'];
    _pharmacyId = json['pharmacy_id'];
    _imagePath1 = json['image_path1'];
    _imagePath2 = json['image_path2'];
    _isPrescription = json['is_prescription'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['product'] != null) {
      _product = [];
      json['product'].forEach((v) {
        _product?.add(Product.fromJson(v));
      });
    }
    _order = json['order'] != null ? Order.fromJson(json['order']) : null;
    _pharmacy =
        json['pharmacy'] != null ? Pharmacy.fromJson(json['pharmacy']) : null;
    _customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['customer_id'] = _customerId;
    map['order_id'] = _orderId;
    map['pharmacy_id'] = _pharmacyId;
    map['image_path1'] = _imagePath1;
    map['image_path2'] = _imagePath2;
    map['is_prescription'] = _isPrescription;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_product != null) {
      map['product'] = _product?.map((v) => v.toJson()).toList();
    }
    if (_order != null) {
      map['order'] = _order?.toJson();
    }
    if (_pharmacy != null) {
      map['pharmacy'] = _pharmacy?.toJson();
    }
    if (_customer != null) {
      map['customer'] = _customer?.toJson();
    }
    return map;
  }
}

/// id : 2
/// name : "Bilal Hassan"
/// user_name : null
/// email : "hassanbilal099@gmail.com"
/// image : null
/// phone : "454545"
/// address : "Faisalabad - Samundri Road, Faisalabad, Pakistan"
/// country : null
/// city : null
/// state : null
/// postal_code : null
/// lat : "31.45036619999999"
/// long : "73.13496049999999"
/// location : null
/// status : null
/// is_active : null
/// created_at : "2021-08-10T05:57:52.000000Z"
/// updated_at : "2021-08-10T05:57:52.000000Z"

class Customer {
  int? _id;
  String? _name;
  dynamic? _userName;
  String? _email;
  dynamic? _image;
  String? _phone;
  String? _address;
  dynamic? _country;
  dynamic? _city;
  dynamic? _state;
  dynamic? _postalCode;
  String? _lat;
  String? _long;
  dynamic? _location;
  dynamic? _status;
  dynamic? _isActive;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get name => _name;
  dynamic? get userName => _userName;
  String? get email => _email;
  dynamic? get image => _image;
  String? get phone => _phone;
  String? get address => _address;
  dynamic? get country => _country;
  dynamic? get city => _city;
  dynamic? get state => _state;
  dynamic? get postalCode => _postalCode;
  String? get lat => _lat;
  String? get long => _long;
  dynamic? get location => _location;
  dynamic? get status => _status;
  dynamic? get isActive => _isActive;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Customer(
      {int? id,
      String? name,
      dynamic? userName,
      String? email,
      dynamic? image,
      String? phone,
      String? address,
      dynamic? country,
      dynamic? city,
      dynamic? state,
      dynamic? postalCode,
      String? lat,
      String? long,
      dynamic? location,
      dynamic? status,
      dynamic? isActive,
      String? createdAt,
      String? updatedAt}) {
    _id = id;
    _name = name;
    _userName = userName;
    _email = email;
    _image = image;
    _phone = phone;
    _address = address;
    _country = country;
    _city = city;
    _state = state;
    _postalCode = postalCode;
    _lat = lat;
    _long = long;
    _location = location;
    _status = status;
    _isActive = isActive;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Customer.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _userName = json['user_name'];
    _email = json['email'];
    _image = json['image'];
    _phone = json['phone'];
    _address = json['address'];
    _country = json['country'];
    _city = json['city'];
    _state = json['state'];
    _postalCode = json['postal_code'];
    _lat = json['lat'];
    _long = json['long'];
    _location = json['location'];
    _status = json['status'];
    _isActive = json['is_active'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['user_name'] = _userName;
    map['email'] = _email;
    map['image'] = _image;
    map['phone'] = _phone;
    map['address'] = _address;
    map['country'] = _country;
    map['city'] = _city;
    map['state'] = _state;
    map['postal_code'] = _postalCode;
    map['lat'] = _lat;
    map['long'] = _long;
    map['location'] = _location;
    map['status'] = _status;
    map['is_active'] = _isActive;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

/// id : 1
/// name : "Care Pharmacy"
/// user_name : null
/// email : "hassanbilal099@gmail.com"
/// owner_image : null
/// slug : "care-pharmacy"
/// owner_name : "Bilal Hassan"
/// owner_phone : "656565"
/// contact_name : "Atif"
/// contact_phone : "4343434"
/// image_path : "assets/admin/pharmacy/1628578887_b.jpg"
/// country : "Pakistan"
/// city : "Faisalabad"
/// address : "Kohinoor Town Madina Town, Faisalabad, Pakistan"
/// lat : "31.466512"
/// long : "73.0696543"
/// status : null
/// is_active : "1"
/// is_verified : 1
/// created_at : "2021-08-10T06:58:13.000000Z"
/// updated_at : "2021-08-10T07:03:47.000000Z"

class Pharmacy {
  int? _id;
  String? _name;
  dynamic? _userName;
  String? _email;
  dynamic? _ownerImage;
  String? _slug;
  String? _ownerName;
  String? _ownerPhone;
  String? _contactName;
  String? _contactPhone;
  String? _imagePath;
  String? _country;
  String? _city;
  String? _address;
  String? _lat;
  String? _long;
  dynamic? _status;
  String? _isActive;
  int? _isVerified;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get name => _name;
  dynamic? get userName => _userName;
  String? get email => _email;
  dynamic? get ownerImage => _ownerImage;
  String? get slug => _slug;
  String? get ownerName => _ownerName;
  String? get ownerPhone => _ownerPhone;
  String? get contactName => _contactName;
  String? get contactPhone => _contactPhone;
  String? get imagePath => _imagePath;
  String? get country => _country;
  String? get city => _city;
  String? get address => _address;
  String? get lat => _lat;
  String? get long => _long;
  dynamic? get status => _status;
  String? get isActive => _isActive;
  int? get isVerified => _isVerified;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Pharmacy(
      {int? id,
      String? name,
      dynamic? userName,
      String? email,
      dynamic? ownerImage,
      String? slug,
      String? ownerName,
      String? ownerPhone,
      String? contactName,
      String? contactPhone,
      String? imagePath,
      String? country,
      String? city,
      String? address,
      String? lat,
      String? long,
      dynamic? status,
      String? isActive,
      int? isVerified,
      String? createdAt,
      String? updatedAt}) {
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
  }

  Pharmacy.fromJson(dynamic json) {
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
    return map;
  }
}

/// id : 14
/// customer_id : 2
/// session_id : null
/// customer_name : null
/// shipping_method : null
/// payment_method : "Easy Paisa"
/// sub_total : "2704"
/// total_price : "2704"
/// shipping_price : "0"
/// tax : "0"
/// discount : null
/// status : "pending"
/// lab_id : null
/// pharmacy_id : null
/// is_prescription : 0
/// image_path1 : null
/// image_path2 : null
/// created_at : "2021-09-02T04:59:12.000000Z"
/// updated_at : "2021-09-02T04:59:12.000000Z"

class Order {
  int? _id;
  int? _customerId;
  dynamic? _sessionId;
  dynamic? _customerName;
  dynamic? _shippingMethod;
  String? _paymentMethod;
  String? _subTotal;
  String? _totalPrice;
  String? _shippingPrice;
  String? _tax;
  dynamic? _discount;
  String? _status;
  dynamic? _labId;
  dynamic? _pharmacyId;
  int? _isPrescription;
  dynamic? _imagePath1;
  dynamic? _imagePath2;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  int? get customerId => _customerId;
  dynamic? get sessionId => _sessionId;
  dynamic? get customerName => _customerName;
  dynamic? get shippingMethod => _shippingMethod;
  String? get paymentMethod => _paymentMethod;
  String? get subTotal => _subTotal;
  String? get totalPrice => _totalPrice;
  String? get shippingPrice => _shippingPrice;
  String? get tax => _tax;
  dynamic? get discount => _discount;
  String? get status => _status;
  dynamic? get labId => _labId;
  dynamic? get pharmacyId => _pharmacyId;
  int? get isPrescription => _isPrescription;
  dynamic? get imagePath1 => _imagePath1;
  dynamic? get imagePath2 => _imagePath2;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Order(
      {int? id,
      int? customerId,
      dynamic? sessionId,
      dynamic? customerName,
      dynamic? shippingMethod,
      String? paymentMethod,
      String? subTotal,
      String? totalPrice,
      String? shippingPrice,
      String? tax,
      dynamic? discount,
      String? status,
      dynamic? labId,
      dynamic? pharmacyId,
      int? isPrescription,
      dynamic? imagePath1,
      dynamic? imagePath2,
      String? createdAt,
      String? updatedAt}) {
    _id = id;
    _customerId = customerId;
    _sessionId = sessionId;
    _customerName = customerName;
    _shippingMethod = shippingMethod;
    _paymentMethod = paymentMethod;
    _subTotal = subTotal;
    _totalPrice = totalPrice;
    _shippingPrice = shippingPrice;
    _tax = tax;
    _discount = discount;
    _status = status;
    _labId = labId;
    _pharmacyId = pharmacyId;
    _isPrescription = isPrescription;
    _imagePath1 = imagePath1;
    _imagePath2 = imagePath2;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Order.fromJson(dynamic json) {
    _id = json['id'];
    _customerId = json['customer_id'];
    _sessionId = json['session_id'];
    _customerName = json['customer_name'];
    _shippingMethod = json['shipping_method'];
    _paymentMethod = json['payment_method'];
    _subTotal = json['sub_total'];
    _totalPrice = json['total_price'];
    _shippingPrice = json['shipping_price'];
    _tax = json['tax'];
    _discount = json['discount'];
    _status = json['status'];
    _labId = json['lab_id'];
    _pharmacyId = json['pharmacy_id'];
    _isPrescription = json['is_prescription'];
    _imagePath1 = json['image_path1'];
    _imagePath2 = json['image_path2'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['customer_id'] = _customerId;
    map['session_id'] = _sessionId;
    map['customer_name'] = _customerName;
    map['shipping_method'] = _shippingMethod;
    map['payment_method'] = _paymentMethod;
    map['sub_total'] = _subTotal;
    map['total_price'] = _totalPrice;
    map['shipping_price'] = _shippingPrice;
    map['tax'] = _tax;
    map['discount'] = _discount;
    map['status'] = _status;
    map['lab_id'] = _labId;
    map['pharmacy_id'] = _pharmacyId;
    map['is_prescription'] = _isPrescription;
    map['image_path1'] = _imagePath1;
    map['image_path2'] = _imagePath2;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

/// id : 4
/// order_id : 14
/// product_id : 1
/// category_id : 1
/// company_id : 2
/// name : "Arinac"
/// salt_name : "Arinac"
/// image_path : null
/// retail_price : null
/// sale_price : "240"
/// sku : "1986"
/// qty : "1"
/// potency : "20mg"
/// type : "medicine"
/// created_at : "2021-09-02T04:59:12.000000Z"
/// updated_at : "2021-09-02T04:59:12.000000Z"

class Product {
  int? _id;
  int? _orderId;
  int? _productId;
  int? _categoryId;
  int? _companyId;
  String? _name;
  String? _saltName;
  dynamic? _imagePath;
  dynamic? _retailPrice;
  String? _salePrice;
  String? _sku;
  String? _qty;
  String? _potency;
  String? _type;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  int? get orderId => _orderId;
  int? get productId => _productId;
  int? get categoryId => _categoryId;
  int? get companyId => _companyId;
  String? get name => _name;
  String? get saltName => _saltName;
  dynamic? get imagePath => _imagePath;
  dynamic? get retailPrice => _retailPrice;
  String? get salePrice => _salePrice;
  String? get sku => _sku;
  String? get qty => _qty;
  String? get potency => _potency;
  String? get type => _type;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Product(
      {int? id,
      int? orderId,
      int? productId,
      int? categoryId,
      int? companyId,
      String? name,
      String? saltName,
      dynamic? imagePath,
      dynamic? retailPrice,
      String? salePrice,
      String? sku,
      String? qty,
      String? potency,
      String? type,
      String? createdAt,
      String? updatedAt}) {
    _id = id;
    _orderId = orderId;
    _productId = productId;
    _categoryId = categoryId;
    _companyId = companyId;
    _name = name;
    _saltName = saltName;
    _imagePath = imagePath;
    _retailPrice = retailPrice;
    _salePrice = salePrice;
    _sku = sku;
    _qty = qty;
    _potency = potency;
    _type = type;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Product.fromJson(dynamic json) {
    _id = json['id'];
    _orderId = json['order_id'];
    _productId = json['product_id'];
    _categoryId = json['category_id'];
    _companyId = json['company_id'];
    _name = json['name'];
    _saltName = json['salt_name'];
    _imagePath = json['image_path'];
    _retailPrice = json['retail_price'];
    _salePrice = json['sale_price'];
    _sku = json['sku'];
    _qty = json['qty'];
    _potency = json['potency'];
    _type = json['type'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['order_id'] = _orderId;
    map['product_id'] = _productId;
    map['category_id'] = _categoryId;
    map['company_id'] = _companyId;
    map['name'] = _name;
    map['salt_name'] = _saltName;
    map['image_path'] = _imagePath;
    map['retail_price'] = _retailPrice;
    map['sale_price'] = _salePrice;
    map['sku'] = _sku;
    map['qty'] = _qty;
    map['potency'] = _potency;
    map['type'] = _type;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
