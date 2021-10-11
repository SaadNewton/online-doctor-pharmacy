/// data : [{"id":24796,"product_category_id":2,"company_id":2,"name":"Delaware Tab","salt_name":"test","slug":"delaware-tab","potency":"6.25mg","image_path":"assets/admin/product/1631258084_6016delaware 6.25mg.png","retail_price":"136","sale_price":"160","on_sale":"yes","is_feature":"yes","is_item_type":"1","item_type_price":"{\"Strip\":\"200\",\"Box\":\"40\",\"Piece\":\"20\"}","sku":"21273","status":null,"is_active":"yes","description":"Delaware Tablet","created_at":"2021-09-10 07:14:44","updated_at":"2021-09-21 05:47:24","item_price":[{"type":"Strip","price":"200"},{"type":"Box","price":"40"},{"type":"Piece","price":"20"}]},{"id":24795,"product_category_id":60,"company_id":2,"name":"Delaware Tab ","salt_name":"test","slug":"","potency":"25mg","image_path":"assets/admin/product/1631258084_6016delaware 6.25mg.png","retail_price":"170","sale_price":"200","on_sale":"yes","is_feature":"0","is_item_type":"0","item_type_price":null,"sku":"21272","status":null,"is_active":null,"description":"Delaware Tablet","created_at":"2021-09-10 07:14:44","updated_at":"2021-09-10 07:14:44","item_price":null}]
/// status : true
/// success : 1
/// message : "Fetching Record"

class GetMedicineFromSearchModel {
  List<ProductDetailData>? _data;
  bool? _status;
  int? _success;
  String? _message;

  List<ProductDetailData>? get data => _data;
  bool? get status => _status;
  int? get success => _success;
  String? get message => _message;

  GetMedicineFromSearchModel(
      {List<ProductDetailData>? data,
      bool? status,
      int? success,
      String? message}) {
    _data = data;
    _status = status;
    _success = success;
    _message = message;
  }

  GetMedicineFromSearchModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(ProductDetailData.fromJson(v));
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

/// id : 24796
/// product_category_id : 2
/// company_id : 2
/// name : "Delaware Tab"
/// salt_name : "test"
/// slug : "delaware-tab"
/// potency : "6.25mg"
/// image_path : "assets/admin/product/1631258084_6016delaware 6.25mg.png"
/// retail_price : "136"
/// sale_price : "160"
/// on_sale : "yes"
/// is_feature : "yes"
/// is_item_type : "1"
/// item_type_price : "{\"Strip\":\"200\",\"Box\":\"40\",\"Piece\":\"20\"}"
/// sku : "21273"
/// status : null
/// is_active : "yes"
/// description : "Delaware Tablet"
/// created_at : "2021-09-10 07:14:44"
/// updated_at : "2021-09-21 05:47:24"
/// item_price : [{"type":"Strip","price":"200"},{"type":"Box","price":"40"},{"type":"Piece","price":"20"}]

class ProductDetailData {
  int? _id;
  int? _productCategoryId;
  int? _companyId;
  String? _name;
  String? _saltName;
  String? _slug;
  String? _potency;
  String? _imagePath;
  String? _retailPrice;
  String? _salePrice;
  String? _onSale;
  String? _isFeature;
  String? _isItemType;
  String? _itemTypePrice;
  String? _sku;
  dynamic? _status;
  String? _isActive;
  String? _description;
  String? _createdAt;
  String? _updatedAt;
  List<Item_price>? _itemPrice;

  int? get id => _id;
  int? get productCategoryId => _productCategoryId;
  int? get companyId => _companyId;
  String? get name => _name;
  String? get saltName => _saltName;
  String? get slug => _slug;
  String? get potency => _potency;
  String? get imagePath => _imagePath;
  String? get retailPrice => _retailPrice;
  String? get salePrice => _salePrice;
  String? get onSale => _onSale;
  String? get isFeature => _isFeature;
  String? get isItemType => _isItemType;
  String? get itemTypePrice => _itemTypePrice;
  String? get sku => _sku;
  dynamic? get status => _status;
  String? get isActive => _isActive;
  String? get description => _description;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  List<Item_price>? get itemPrice => _itemPrice;

  ProductDetailData(
      {int? id,
      int? productCategoryId,
      int? companyId,
      String? name,
      String? saltName,
      String? slug,
      String? potency,
      String? imagePath,
      String? retailPrice,
      String? salePrice,
      String? onSale,
      String? isFeature,
      String? isItemType,
      String? itemTypePrice,
      String? sku,
      dynamic? status,
      String? isActive,
      String? description,
      String? createdAt,
      String? updatedAt,
      List<Item_price>? itemPrice}) {
    _id = id;
    _productCategoryId = productCategoryId;
    _companyId = companyId;
    _name = name;
    _saltName = saltName;
    _slug = slug;
    _potency = potency;
    _imagePath = imagePath;
    _retailPrice = retailPrice;
    _salePrice = salePrice;
    _onSale = onSale;
    _isFeature = isFeature;
    _isItemType = isItemType;
    _itemTypePrice = itemTypePrice;
    _sku = sku;
    _status = status;
    _isActive = isActive;
    _description = description;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _itemPrice = itemPrice;
  }

  ProductDetailData.fromJson(dynamic json) {
    _id = json['id'];
    _productCategoryId = json['product_category_id'];
    _companyId = json['company_id'];
    _name = json['name'];
    _saltName = json['salt_name'];
    _slug = json['slug'];
    _potency = json['potency'];
    _imagePath = json['image_path'];
    _retailPrice = json['retail_price'];
    _salePrice = json['sale_price'];
    _onSale = json['on_sale'];
    _isFeature = json['is_feature'];
    _isItemType = json['is_item_type'];
    _itemTypePrice = json['item_type_price'];
    _sku = json['sku'];
    _status = json['status'];
    _isActive = json['is_active'];
    _description = json['description'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['item_price'] != null) {
      _itemPrice = [];
      json['item_price'].forEach((v) {
        _itemPrice?.add(Item_price.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['product_category_id'] = _productCategoryId;
    map['company_id'] = _companyId;
    map['name'] = _name;
    map['salt_name'] = _saltName;
    map['slug'] = _slug;
    map['potency'] = _potency;
    map['image_path'] = _imagePath;
    map['retail_price'] = _retailPrice;
    map['sale_price'] = _salePrice;
    map['on_sale'] = _onSale;
    map['is_feature'] = _isFeature;
    map['is_item_type'] = _isItemType;
    map['item_type_price'] = _itemTypePrice;
    map['sku'] = _sku;
    map['status'] = _status;
    map['is_active'] = _isActive;
    map['description'] = _description;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_itemPrice != null) {
      map['item_price'] = _itemPrice?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// type : "Strip"
/// price : "200"

class Item_price {
  String? _type;
  String? _price;

  String? get type => _type;
  String? get price => _price;

  Item_price({String? type, String? price}) {
    _type = type;
    _price = price;
  }

  Item_price.fromJson(dynamic json) {
    _type = json['type'];
    _price = json['price'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['type'] = _type;
    map['price'] = _price;
    return map;
  }
}
