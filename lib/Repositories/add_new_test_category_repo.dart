import 'package:doctoworld_seller/Models/add_new_test_category_model.dart';
import 'package:doctoworld_seller/Services/get_method_call.dart';
import 'package:doctoworld_seller/Services/service_urls.dart';
import 'package:doctoworld_seller/Storage/local_Storage.dart';
import 'package:doctoworld_seller/lab_owner/show_all_test_categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'all_lab_test_categories_repo.dart';

addLabTestCategoryRepo(
    bool responseCheck, Map<String, dynamic> response, BuildContext context) {
  var addTestCategoryModel;
  addTestCategoryModel = AddNewTestCategory.fromJson(response);
  if (responseCheck) {
    if (addTestCategoryModel.status == true) {
      Get.off(ShowAllTestCategories());
      getMethod(
          context,
          getAllLabTestCategoriesService,
          {'lab_id': storageBox!.read('lab_id')},
          true,
          getAllLabTestCategoriesRepo);
      Get.snackbar('Added', addTestCategoryModel.message,
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
    } else {
      Get.snackbar('Failed', addTestCategoryModel.message,
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
    }
  } else {
    Get.snackbar('Failed', 'Something went wrong.',
        snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
  }
}
