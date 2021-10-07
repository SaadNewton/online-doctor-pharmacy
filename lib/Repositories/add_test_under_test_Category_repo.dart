import 'package:doctoworld_seller/Models/add_test_under_test_category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

addTestUnderTestCategoryRepo(
    bool responseCheck, Map<String, dynamic> response, BuildContext context) {
  var addNewTestUnderTestCategoryModel;
  addNewTestUnderTestCategoryModel =
      AddTestUnderTestCategoryModel.fromJson(response);
  if (responseCheck) {
    if (addNewTestUnderTestCategoryModel.status == true) {
      Get.snackbar('Added', addNewTestUnderTestCategoryModel.message,
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
    } else {
      Get.snackbar('Failed', addNewTestUnderTestCategoryModel.message,
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
    }
  }
}
