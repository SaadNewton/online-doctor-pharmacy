import 'package:doctoworld_seller/Models/accepted_orders_model.dart';
import 'package:doctoworld_seller/Models/get_medicine_from_search_model.dart';
import 'package:doctoworld_seller/Models/get_notify_token_model.dart';
import 'package:doctoworld_seller/Models/lab_all_orders_model.dart';
import 'package:doctoworld_seller/Models/order_requests_model.dart';
import 'package:doctoworld_seller/Models/signup_userdata_model.dart';
import 'package:doctoworld_seller/Models/user_detail_model.dart';
import 'package:flutter/cupertino.dart';

ProductDetailData medicineSearchDetailData = ProductDetailData();

UserDetailModel? userDetailModel;
SignupUserdataModel? signupUserdataModel;
GetNotifyTokenModel getNotifyTokenModel = GetNotifyTokenModel();
GetMedicineFromSearchModel? medicineSearchModel = GetMedicineFromSearchModel();
AcceptedOrdersModel acceptedOrdersModel = AcceptedOrdersModel();
OrderRequestsModel orderRequestsModel = OrderRequestsModel();
final TextEditingController phoneController = TextEditingController();
final TextEditingController nameController = TextEditingController();
final TextEditingController usernameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController passController = TextEditingController();
final TextEditingController confirmPassController = TextEditingController();
final TextEditingController addressController = TextEditingController();
final TextEditingController locationController = TextEditingController();

// Forget Email Controllers
final TextEditingController forgetEmailController = TextEditingController();

// Sign Up Location Variables
var signUplongitude;
var signUplatitude;
var signUpCurrentAddress;
String? signUpSelectedRole;

/// LabAllOrdersModel model object
LabAllOrdersModel labAllOrdersModel = LabAllOrdersModel();

var contactUsModel;

String isItemTypeAvailable = '0';

List<String> itemTypes = [];
List<String> itemTypePrice = [];

String? selectedValue;
