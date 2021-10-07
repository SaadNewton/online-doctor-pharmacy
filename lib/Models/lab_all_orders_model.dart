/// data : [{"id":8,"customer_id":1,"session_id":null,"customer_name":null,"shipping_method":null,"payment_method":"Cash on Delivery","sub_total":"700","total_price":"700","shipping_price":"0","tax":"0","discount":null,"status":"pending","lab_id":11,"pharmacy_id":null,"is_prescription":0,"is_order_approved":0,"image_path1":null,"image_path2":null,"created_at":"2021-09-23T09:40:53.000000Z","updated_at":"2021-09-23T09:40:53.000000Z","order_product":[{"id":4,"order_id":8,"product_id":36,"category_id":22,"company_id":null,"name":"PCR Test","salt_name":null,"image_path":"assets/admin/lab/1632389647_scaled_84255822-fba4-45bc-9ae5-45e0cf9c659f421084129.jpg","retail_price":null,"sale_price":"700","item_type_name":null,"sku":null,"qty":"1","potency":null,"type":"test","created_at":"2021-09-23T09:40:53.000000Z","updated_at":"2021-09-23T09:40:53.000000Z"}],"order_shipping":{"id":6,"order_id":8,"name":"Muhammad Aftab ur Rehman","email":null,"company_name":null,"phone_number":"+923217858824","address":"P#215 Street#8 Redux Road Nisar Colony Samnabad","city":null,"country":null,"state":null,"postal_code":null,"created_at":"2021-09-12T23:46:38.000000Z","updated_at":"2021-09-12T23:46:38.000000Z"}}]
/// status : true
/// success : 1
/// message : "Fetching record"

class LabAllOrdersModel {
  List<LabOrderDetail>? _data;
  bool? _status;
  int? _success;
  String? _message;

  List<LabOrderDetail>? get data => _data;
  bool? get status => _status;
  int? get success => _success;
  String? get message => _message;

  LabAllOrdersModel(
      {List<LabOrderDetail>? data,
      bool? status,
      int? success,
      String? message}) {
    _data = data;
    _status = status;
    _success = success;
    _message = message;
  }

  LabAllOrdersModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(LabOrderDetail.fromJson(v));
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

/// id : 8
/// customer_id : 1
/// session_id : null
/// customer_name : null
/// shipping_method : null
/// payment_method : "Cash on Delivery"
/// sub_total : "700"
/// total_price : "700"
/// shipping_price : "0"
/// tax : "0"
/// discount : null
/// status : "pending"
/// lab_id : 11
/// pharmacy_id : null
/// is_prescription : 0
/// is_order_approved : 0
/// image_path1 : null
/// image_path2 : null
/// created_at : "2021-09-23T09:40:53.000000Z"
/// updated_at : "2021-09-23T09:40:53.000000Z"
/// order_product : [{"id":4,"order_id":8,"product_id":36,"category_id":22,"company_id":null,"name":"PCR Test","salt_name":null,"image_path":"assets/admin/lab/1632389647_scaled_84255822-fba4-45bc-9ae5-45e0cf9c659f421084129.jpg","retail_price":null,"sale_price":"700","item_type_name":null,"sku":null,"qty":"1","potency":null,"type":"test","created_at":"2021-09-23T09:40:53.000000Z","updated_at":"2021-09-23T09:40:53.000000Z"}]
/// order_shipping : {"id":6,"order_id":8,"name":"Muhammad Aftab ur Rehman","email":null,"company_name":null,"phone_number":"+923217858824","address":"P#215 Street#8 Redux Road Nisar Colony Samnabad","city":null,"country":null,"state":null,"postal_code":null,"created_at":"2021-09-12T23:46:38.000000Z","updated_at":"2021-09-12T23:46:38.000000Z"}

class LabOrderDetail {
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
  int? _labId;
  dynamic? _pharmacyId;
  int? _isPrescription;
  int? _isOrderApproved;
  dynamic? _imagePath1;
  dynamic? _imagePath2;
  String? _createdAt;
  String? _updatedAt;
  List<Order_product>? _orderProduct;
  Order_shipping? _orderShipping;

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
  int? get labId => _labId;
  dynamic? get pharmacyId => _pharmacyId;
  int? get isPrescription => _isPrescription;
  int? get isOrderApproved => _isOrderApproved;
  dynamic? get imagePath1 => _imagePath1;
  dynamic? get imagePath2 => _imagePath2;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  List<Order_product>? get orderProduct => _orderProduct;
  Order_shipping? get orderShipping => _orderShipping;

  LabOrderDetail(
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
      int? labId,
      dynamic? pharmacyId,
      int? isPrescription,
      int? isOrderApproved,
      dynamic? imagePath1,
      dynamic? imagePath2,
      String? createdAt,
      String? updatedAt,
      List<Order_product>? orderProduct,
      Order_shipping? orderShipping}) {
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
    _isOrderApproved = isOrderApproved;
    _imagePath1 = imagePath1;
    _imagePath2 = imagePath2;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _orderProduct = orderProduct;
    _orderShipping = orderShipping;
  }

  LabOrderDetail.fromJson(dynamic json) {
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
    _isOrderApproved = json['is_order_approved'];
    _imagePath1 = json['image_path1'];
    _imagePath2 = json['image_path2'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['order_product'] != null) {
      _orderProduct = [];
      json['order_product'].forEach((v) {
        _orderProduct?.add(Order_product.fromJson(v));
      });
    }
    _orderShipping = json['order_shipping'] != null
        ? Order_shipping.fromJson(json['order_shipping'])
        : null;
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
    map['is_order_approved'] = _isOrderApproved;
    map['image_path1'] = _imagePath1;
    map['image_path2'] = _imagePath2;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_orderProduct != null) {
      map['order_product'] = _orderProduct?.map((v) => v.toJson()).toList();
    }
    if (_orderShipping != null) {
      map['order_shipping'] = _orderShipping?.toJson();
    }
    return map;
  }
}

/// id : 6
/// order_id : 8
/// name : "Muhammad Aftab ur Rehman"
/// email : null
/// company_name : null
/// phone_number : "+923217858824"
/// address : "P#215 Street#8 Redux Road Nisar Colony Samnabad"
/// city : null
/// country : null
/// state : null
/// postal_code : null
/// created_at : "2021-09-12T23:46:38.000000Z"
/// updated_at : "2021-09-12T23:46:38.000000Z"

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

/// id : 4
/// order_id : 8
/// product_id : 36
/// category_id : 22
/// company_id : null
/// name : "PCR Test"
/// salt_name : null
/// image_path : "assets/admin/lab/1632389647_scaled_84255822-fba4-45bc-9ae5-45e0cf9c659f421084129.jpg"
/// retail_price : null
/// sale_price : "700"
/// item_type_name : null
/// sku : null
/// qty : "1"
/// potency : null
/// type : "test"
/// created_at : "2021-09-23T09:40:53.000000Z"
/// updated_at : "2021-09-23T09:40:53.000000Z"

class Order_product {
  int? _id;
  int? _orderId;
  int? _productId;
  int? _categoryId;
  dynamic? _companyId;
  String? _name;
  dynamic? _saltName;
  String? _imagePath;
  dynamic? _retailPrice;
  String? _salePrice;
  dynamic? _itemTypeName;
  dynamic? _sku;
  String? _qty;
  dynamic? _potency;
  String? _type;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  int? get orderId => _orderId;
  int? get productId => _productId;
  int? get categoryId => _categoryId;
  dynamic? get companyId => _companyId;
  String? get name => _name;
  dynamic? get saltName => _saltName;
  String? get imagePath => _imagePath;
  dynamic? get retailPrice => _retailPrice;
  String? get salePrice => _salePrice;
  dynamic? get itemTypeName => _itemTypeName;
  dynamic? get sku => _sku;
  String? get qty => _qty;
  dynamic? get potency => _potency;
  String? get type => _type;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Order_product(
      {int? id,
      int? orderId,
      int? productId,
      int? categoryId,
      dynamic? companyId,
      String? name,
      dynamic? saltName,
      String? imagePath,
      dynamic? retailPrice,
      String? salePrice,
      dynamic? itemTypeName,
      dynamic? sku,
      String? qty,
      dynamic? potency,
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
