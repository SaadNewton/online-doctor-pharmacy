/// data : [{"id":2,"customer_id":2,"session_id":null,"customer_name":null,"shipping_method":null,"payment_method":"Jazz Cash","sub_total":"4","total_price":"54","commission_price":null,"pay_total":null,"shipping_price":"50","tax":"0","discount":null,"status":"delivered","lab_id":null,"pharmacy_id":1,"is_prescription":0,"is_order_approved":0,"image_path1":null,"image_path2":null,"remarks":null,"created_at":"2021-10-04T08:34:37.000000Z","updated_at":"2021-10-04T08:39:46.000000Z","order_billing":null,"order_shipping":{"id":2,"order_id":2,"name":"Bilal Hassan","email":null,"company_name":null,"phone_number":"+923477459552","address":"Faisalabad - Samundri Road, Faisalabad, Pakistan","city":null,"country":null,"state":null,"postal_code":null,"created_at":"2021-10-04T08:34:37.000000Z","updated_at":"2021-10-04T08:34:37.000000Z"},"order_product":[{"id":3,"order_id":2,"product_id":1,"category_id":1,"company_id":2,"name":"Arinac","salt_name":"Arinac","image_path":null,"retail_price":null,"sale_price":"4","item_type_name":"","sku":"1986","qty":"1","potency":"20mg","type":"medicine","created_at":"2021-10-04T08:34:37.000000Z","updated_at":"2021-10-04T08:34:37.000000Z"}],"customer":{"id":2,"name":"Bilal Hassan","user_name":null,"email":"hassanbilal099@gmail.com","image":null,"phone":"+923477459552","otp_is_verified":1,"address":"Faisalabad - Samundri Road, Faisalabad, Pakistan","country":null,"city":null,"state":null,"postal_code":null,"lat":"31.45036619999999","long":"73.13496049999999","location":null,"status":null,"is_active":null,"is_profile_complete":"1","created_at":"2021-08-10T05:57:52.000000Z","updated_at":"2021-09-10T09:57:48.000000Z"},"lab":null},null]
/// status : true
/// success : 1
/// message : "Fetching record"

class AcceptedOrdersModel {
  List<AcceptedOrderDetailData>? _data;
  bool? _status;
  int? _success;
  String? _message;

  List<AcceptedOrderDetailData>? get data => _data;
  bool? get status => _status;
  int? get success => _success;
  String? get message => _message;

  AcceptedOrdersModel(
      {List<AcceptedOrderDetailData>? data,
      bool? status,
      int? success,
      String? message}) {
    _data = data;
    _status = status;
    _success = success;
    _message = message;
  }

  AcceptedOrdersModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(AcceptedOrderDetailData.fromJson(v));
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

/// id : 2
/// customer_id : 2
/// session_id : null
/// customer_name : null
/// shipping_method : null
/// payment_method : "Jazz Cash"
/// sub_total : "4"
/// total_price : "54"
/// commission_price : null
/// pay_total : null
/// shipping_price : "50"
/// tax : "0"
/// discount : null
/// status : "delivered"
/// lab_id : null
/// pharmacy_id : 1
/// is_prescription : 0
/// is_order_approved : 0
/// image_path1 : null
/// image_path2 : null
/// remarks : null
/// created_at : "2021-10-04T08:34:37.000000Z"
/// updated_at : "2021-10-04T08:39:46.000000Z"
/// order_billing : null
/// order_shipping : {"id":2,"order_id":2,"name":"Bilal Hassan","email":null,"company_name":null,"phone_number":"+923477459552","address":"Faisalabad - Samundri Road, Faisalabad, Pakistan","city":null,"country":null,"state":null,"postal_code":null,"created_at":"2021-10-04T08:34:37.000000Z","updated_at":"2021-10-04T08:34:37.000000Z"}
/// order_product : [{"id":3,"order_id":2,"product_id":1,"category_id":1,"company_id":2,"name":"Arinac","salt_name":"Arinac","image_path":null,"retail_price":null,"sale_price":"4","item_type_name":"","sku":"1986","qty":"1","potency":"20mg","type":"medicine","created_at":"2021-10-04T08:34:37.000000Z","updated_at":"2021-10-04T08:34:37.000000Z"}]
/// customer : {"id":2,"name":"Bilal Hassan","user_name":null,"email":"hassanbilal099@gmail.com","image":null,"phone":"+923477459552","otp_is_verified":1,"address":"Faisalabad - Samundri Road, Faisalabad, Pakistan","country":null,"city":null,"state":null,"postal_code":null,"lat":"31.45036619999999","long":"73.13496049999999","location":null,"status":null,"is_active":null,"is_profile_complete":"1","created_at":"2021-08-10T05:57:52.000000Z","updated_at":"2021-09-10T09:57:48.000000Z"}
/// lab : null

class AcceptedOrderDetailData {
  int? _id;
  int? _customerId;
  dynamic? _sessionId;
  dynamic? _customerName;
  dynamic? _shippingMethod;
  String? _paymentMethod;
  String? _subTotal;
  String? _totalPrice;
  dynamic? _commissionPrice;
  dynamic? _payTotal;
  String? _shippingPrice;
  String? _tax;
  dynamic? _discount;
  String? _status;
  dynamic? _labId;
  int? _pharmacyId;
  int? _isPrescription;
  int? _isOrderApproved;
  dynamic? _imagePath1;
  dynamic? _imagePath2;
  dynamic? _remarks;
  String? _createdAt;
  String? _updatedAt;
  dynamic? _orderBilling;
  Order_shipping? _orderShipping;
  List<Order_product>? _orderProduct;
  Customer? _customer;
  dynamic? _lab;

  int? get id => _id;
  int? get customerId => _customerId;
  dynamic? get sessionId => _sessionId;
  dynamic? get customerName => _customerName;
  dynamic? get shippingMethod => _shippingMethod;
  String? get paymentMethod => _paymentMethod;
  String? get subTotal => _subTotal;
  String? get totalPrice => _totalPrice;
  dynamic? get commissionPrice => _commissionPrice;
  dynamic? get payTotal => _payTotal;
  String? get shippingPrice => _shippingPrice;
  String? get tax => _tax;
  dynamic? get discount => _discount;
  String? get status => _status;
  dynamic? get labId => _labId;
  int? get pharmacyId => _pharmacyId;
  int? get isPrescription => _isPrescription;
  int? get isOrderApproved => _isOrderApproved;
  dynamic? get imagePath1 => _imagePath1;
  dynamic? get imagePath2 => _imagePath2;
  dynamic? get remarks => _remarks;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic? get orderBilling => _orderBilling;
  Order_shipping? get orderShipping => _orderShipping;
  List<Order_product>? get orderProduct => _orderProduct;
  Customer? get customer => _customer;
  dynamic? get lab => _lab;

  AcceptedOrderDetailData(
      {int? id,
      int? customerId,
      dynamic? sessionId,
      dynamic? customerName,
      dynamic? shippingMethod,
      String? paymentMethod,
      String? subTotal,
      String? totalPrice,
      dynamic? commissionPrice,
      dynamic? payTotal,
      String? shippingPrice,
      String? tax,
      dynamic? discount,
      String? status,
      dynamic? labId,
      int? pharmacyId,
      int? isPrescription,
      int? isOrderApproved,
      dynamic? imagePath1,
      dynamic? imagePath2,
      dynamic? remarks,
      String? createdAt,
      String? updatedAt,
      dynamic? orderBilling,
      Order_shipping? orderShipping,
      List<Order_product>? orderProduct,
      Customer? customer,
      dynamic? lab}) {
    _id = id;
    _customerId = customerId;
    _sessionId = sessionId;
    _customerName = customerName;
    _shippingMethod = shippingMethod;
    _paymentMethod = paymentMethod;
    _subTotal = subTotal;
    _totalPrice = totalPrice;
    _commissionPrice = commissionPrice;
    _payTotal = payTotal;
    _shippingPrice = shippingPrice;
    _tax = tax;
    _discount = discount;
    _status = status;
    _labId = labId;
    _pharmacyId = pharmacyId;
    _isPrescription = isPrescription;
    _isOrderApproved = isOrderApproved;
    _imagePath1 = imagePath1;
    _imagePath2 = imagePath2;
    _remarks = remarks;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _orderBilling = orderBilling;
    _orderShipping = orderShipping;
    _orderProduct = orderProduct;
    _customer = customer;
    _lab = lab;
  }

  AcceptedOrderDetailData.fromJson(dynamic json) {
    _id = json['id'];
    _customerId = json['customer_id'];
    _sessionId = json['session_id'];
    _customerName = json['customer_name'];
    _shippingMethod = json['shipping_method'];
    _paymentMethod = json['payment_method'];
    _subTotal = json['sub_total'];
    _totalPrice = json['total_price'];
    _commissionPrice = json['commission_price'];
    _payTotal = json['pay_total'];
    _shippingPrice = json['shipping_price'];
    _tax = json['tax'];
    _discount = json['discount'];
    _status = json['status'];
    _labId = json['lab_id'];
    _pharmacyId = json['pharmacy_id'];
    _isPrescription = json['is_prescription'];
    _isOrderApproved = json['is_order_approved'];
    _imagePath1 = json['image_path1'];
    _imagePath2 = json['image_path2'];
    _remarks = json['remarks'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _orderBilling = json['order_billing'];
    _orderShipping = json['order_shipping'] != null
        ? Order_shipping.fromJson(json['order_shipping'])
        : null;
    if (json['order_product'] != null) {
      _orderProduct = [];
      json['order_product'].forEach((v) {
        _orderProduct?.add(Order_product.fromJson(v));
      });
    }
    _customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    _lab = json['lab'];
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
    map['commission_price'] = _commissionPrice;
    map['pay_total'] = _payTotal;
    map['shipping_price'] = _shippingPrice;
    map['tax'] = _tax;
    map['discount'] = _discount;
    map['status'] = _status;
    map['lab_id'] = _labId;
    map['pharmacy_id'] = _pharmacyId;
    map['is_prescription'] = _isPrescription;
    map['is_order_approved'] = _isOrderApproved;
    map['image_path1'] = _imagePath1;
    map['image_path2'] = _imagePath2;
    map['remarks'] = _remarks;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['order_billing'] = _orderBilling;
    if (_orderShipping != null) {
      map['order_shipping'] = _orderShipping?.toJson();
    }
    if (_orderProduct != null) {
      map['order_product'] = _orderProduct?.map((v) => v.toJson()).toList();
    }
    if (_customer != null) {
      map['customer'] = _customer?.toJson();
    }
    map['lab'] = _lab;
    return map;
  }
}

/// id : 2
/// name : "Bilal Hassan"
/// user_name : null
/// email : "hassanbilal099@gmail.com"
/// image : null
/// phone : "+923477459552"
/// otp_is_verified : 1
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
/// is_profile_complete : "1"
/// created_at : "2021-08-10T05:57:52.000000Z"
/// updated_at : "2021-09-10T09:57:48.000000Z"

class Customer {
  int? _id;
  String? _name;
  dynamic? _userName;
  String? _email;
  dynamic? _image;
  String? _phone;
  int? _otpIsVerified;
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
  int? _isProfileComplete;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get name => _name;
  dynamic? get userName => _userName;
  String? get email => _email;
  dynamic? get image => _image;
  String? get phone => _phone;
  int? get otpIsVerified => _otpIsVerified;
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
  int? get isProfileComplete => _isProfileComplete;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Customer(
      {int? id,
      String? name,
      dynamic? userName,
      String? email,
      dynamic? image,
      String? phone,
      int? otpIsVerified,
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
      int? isProfileComplete,
      String? createdAt,
      String? updatedAt}) {
    _id = id;
    _name = name;
    _userName = userName;
    _email = email;
    _image = image;
    _phone = phone;
    _otpIsVerified = otpIsVerified;
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
    _isProfileComplete = isProfileComplete;
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
    _otpIsVerified = json['otp_is_verified'];
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
    _isProfileComplete = int.parse(json['is_profile_complete'].toString());
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
    map['otp_is_verified'] = _otpIsVerified;
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
    map['is_profile_complete'] = _isProfileComplete;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

/// id : 3
/// order_id : 2
/// product_id : 1
/// category_id : 1
/// company_id : 2
/// name : "Arinac"
/// salt_name : "Arinac"
/// image_path : null
/// retail_price : null
/// sale_price : "4"
/// item_type_name : ""
/// sku : "1986"
/// qty : "1"
/// potency : "20mg"
/// type : "medicine"
/// created_at : "2021-10-04T08:34:37.000000Z"
/// updated_at : "2021-10-04T08:34:37.000000Z"

class Order_product {
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
  String? _itemTypeName;
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
  String? get itemTypeName => _itemTypeName;
  String? get sku => _sku;
  String? get qty => _qty;
  String? get potency => _potency;
  String? get type => _type;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  set qty(String? name) {
    this._qty = name;
  }

  set salePrice(String? name) {
    this._salePrice = name;
  }

  Order_product(
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
      String? itemTypeName,
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
    _itemTypeName = itemTypeName;
    _sku = sku;
    _qty = qty;
    _potency = potency;
    _type = type;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Order_product.fromJson(dynamic json) {
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
    _itemTypeName = json['item_type_name'];
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
    map['item_type_name'] = _itemTypeName;
    map['sku'] = _sku;
    map['qty'] = _qty;
    map['potency'] = _potency;
    map['type'] = _type;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

/// id : 2
/// order_id : 2
/// name : "Bilal Hassan"
/// email : null
/// company_name : null
/// phone_number : "+923477459552"
/// address : "Faisalabad - Samundri Road, Faisalabad, Pakistan"
/// city : null
/// country : null
/// state : null
/// postal_code : null
/// created_at : "2021-10-04T08:34:37.000000Z"
/// updated_at : "2021-10-04T08:34:37.000000Z"

class Order_shipping {
  int? _id;
  int? _orderId;
  String? _name;
  dynamic? _email;
  dynamic? _companyName;
  String? _phoneNumber;
  String? _address;
  dynamic? _city;
  dynamic? _country;
  dynamic? _state;
  dynamic? _postalCode;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  int? get orderId => _orderId;
  String? get name => _name;
  dynamic? get email => _email;
  dynamic? get companyName => _companyName;
  String? get phoneNumber => _phoneNumber;
  String? get address => _address;
  dynamic? get city => _city;
  dynamic? get country => _country;
  dynamic? get state => _state;
  dynamic? get postalCode => _postalCode;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Order_shipping(
      {int? id,
      int? orderId,
      String? name,
      dynamic? email,
      dynamic? companyName,
      String? phoneNumber,
      String? address,
      dynamic? city,
      dynamic? country,
      dynamic? state,
      dynamic? postalCode,
      String? createdAt,
      String? updatedAt}) {
    _id = id;
    _orderId = orderId;
    _name = name;
    _email = email;
    _companyName = companyName;
    _phoneNumber = phoneNumber;
    _address = address;
    _city = city;
    _country = country;
    _state = state;
    _postalCode = postalCode;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Order_shipping.fromJson(dynamic json) {
    _id = json['id'];
    _orderId = json['order_id'];
    _name = json['name'];
    _email = json['email'];
    _companyName = json['company_name'];
    _phoneNumber = json['phone_number'];
    _address = json['address'];
    _city = json['city'];
    _country = json['country'];
    _state = json['state'];
    _postalCode = json['postal_code'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['order_id'] = _orderId;
    map['name'] = _name;
    map['email'] = _email;
    map['company_name'] = _companyName;
    map['phone_number'] = _phoneNumber;
    map['address'] = _address;
    map['city'] = _city;
    map['country'] = _country;
    map['state'] = _state;
    map['postal_code'] = _postalCode;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
