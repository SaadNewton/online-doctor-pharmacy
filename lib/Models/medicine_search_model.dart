/// data : [{"id":1,"product_category_id":1,"company_id":2,"name":"Arinac","salt_name":"Arinac","slug":"arinac","potency":"20mg","image_path":null,"retail_price":"4","sale_price":"4","on_sale":"yes","is_feature":"no","is_item_type":"0","item_type_price":null,"sku":"1986","status":"","is_active":"yes","description":"Get Your Medicine","created_at":"2021-08-26 10:55:02","updated_at":"2021-08-26 06:54:07"},{"id":2,"product_category_id":1,"company_id":2,"name":"ARINAC-FORTE","salt_name":"","slug":"ARINAC-FORTE","potency":"","image_path":null,"retail_price":"6","sale_price":"6","on_sale":"yes","is_feature":"0","is_item_type":"0","item_type_price":null,"sku":"1995","status":"","is_active":"","description":"Get Your Medicine ","created_at":"2021-08-26 10:55:02","updated_at":"2021-08-26 10:55:38"},{"id":18619,"product_category_id":1,"company_id":2,"name":"Arinac--Syp","salt_name":"","slug":"Arinac--Syp","potency":"","image_path":null,"retail_price":"72.2","sale_price":"72.2","on_sale":"yes","is_feature":"0","is_item_type":"0","item_type_price":null,"sku":"","status":"","is_active":"","description":"Get Your Medicine ","created_at":"2021-08-26 10:55:02","updated_at":"2021-08-26 10:55:38"},{"id":19438,"product_category_id":1,"company_id":2,"name":"Arinac-Fort-Tab","salt_name":"","slug":"Arinac-Fort-Tab","potency":"","image_path":null,"retail_price":"6.01","sale_price":"6.01","on_sale":"yes","is_feature":"0","is_item_type":"0","item_type_price":null,"sku":"","status":"","is_active":"","description":"Get Your Medicine ","created_at":"2021-08-26 10:55:02","updated_at":"2021-08-26 10:55:38"},{"id":19439,"product_category_id":1,"company_id":2,"name":"Arinac-Tab","salt_name":"","slug":"Arinac-Tab","potency":"","image_path":null,"retail_price":"3.25","sale_price":"3.25","on_sale":"yes","is_feature":"0","is_item_type":"0","item_type_price":null,"sku":"","status":"","is_active":"","description":"Get Your Medicine ","created_at":"2021-08-26 10:55:02","updated_at":"2021-08-26 10:55:38"}]
/// status : true
/// success : 1
/// message : "Fetching Record"

/// id : 1
/// product_category_id : 1
/// company_id : 2
/// name : "Arinac"
/// salt_name : "Arinac"
/// slug : "arinac"
/// potency : "20mg"
/// image_path : null
/// retail_price : "4"
/// sale_price : "4"
/// on_sale : "yes"
/// is_feature : "no"
/// is_item_type : "0"
/// item_type_price : null
/// sku : "1986"
/// status : ""
/// is_active : "yes"
/// description : "Get Your Medicine"
/// created_at : "2021-08-26 10:55:02"
/// updated_at : "2021-08-26 06:54:07"

class MedicineSearchDetailData {
  int? _id;
  int? _productCategoryId;
  int? _companyId;
  String? _name;
  String? _saltName;
  String? _slug;
  String? _potency;
  dynamic? _imagePath;
  String? _retailPrice;
  String? _salePrice;
  String? _onSale;
  String? _isFeature;
  String? _isItemType;
  dynamic? _itemTypePrice;
  String? _sku;
  String? _status;
  String? _isActive;
  String? _description;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  int? get productCategoryId => _productCategoryId;
  int? get companyId => _companyId;
  String? get name => _name;
  String? get saltName => _saltName;
  String? get slug => _slug;
  String? get potency => _potency;
  dynamic? get imagePath => _imagePath;
  String? get retailPrice => _retailPrice;
  String? get salePrice => _salePrice;
  String? get onSale => _onSale;
  String? get isFeature => _isFeature;
  String? get isItemType => _isItemType;
  dynamic? get itemTypePrice => _itemTypePrice;
  String? get sku => _sku;
  String? get status => _status;
  String? get isActive => _isActive;
  String? get description => _description;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  MedicineSearchDetailData(
      {int? id,
      int? productCategoryId,
      int? companyId,
      String? name,
      String? saltName,
      String? slug,
      String? potency,
      dynamic? imagePath,
      String? retailPrice,
      String? salePrice,
      String? onSale,
      String? isFeature,
      String? isItemType,
      dynamic? itemTypePrice,
      String? sku,
      String? status,
      String? isActive,
      String? description,
      String? createdAt,
      String? updatedAt}) {
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
  }

  MedicineSearchDetailData.fromJson(dynamic json) {
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
    return map;
  }
}
