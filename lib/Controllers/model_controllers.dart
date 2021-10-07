import 'package:doctoworld_seller/Models/accepted_orders_model.dart';
import 'package:doctoworld_seller/Models/lab_test_categories_model.dart';
import 'package:doctoworld_seller/Models/order_requests_model.dart';
import 'package:doctoworld_seller/Models/tests_under_test_category.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ModelControllers extends GetxController {
  OrderRequestsModel? orderRequestsModel;
  AcceptedOrdersModel? acceptedOrdersModel;

  // Lab Level Models
  /// Tests Model
  LabTestCategoriesModel? labTestCategoriesModel;
  TestsByTestCategoryModel? testsByTestCategoryModel;

  /// Orders Model

  getAllLabTestCategories(Map<String, dynamic> response) {
    labTestCategoriesModel = LabTestCategoriesModel.fromJson(response);
    update();
  }

  getTestsByTestCategory(Map<String, dynamic> response) {
    testsByTestCategoryModel = TestsByTestCategoryModel.fromJson(response);
    update();
  }
}
