import 'package:doctoworld_seller/Models/edit_test_category_model.dart';
import 'package:doctoworld_seller/Services/get_method_call.dart';
import 'package:doctoworld_seller/Services/service_urls.dart';
import 'package:doctoworld_seller/Storage/local_Storage.dart';
import 'package:doctoworld_seller/lab_owner/show_all_test_categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'all_lab_test_categories_repo.dart';

editTestCategoryRepo(
    bool responseCheck, Map<String, dynamic> response, BuildContext context) {
  var editTestCategoryModel;
  editTestCategoryModel = EditTestCategoryModel.fromJson(response);
  if (responseCheck) {
    if (editTestCategoryModel.status == true) {
      Get.to(ShowAllTestCategories());
      getMethod(
          context,
          getAllLabTestCategoriesService,
          {'lab_id': storageBox!.read('lab_id')},
          true,
          getAllLabTestCategoriesRepo);
      Get.snackbar('Edited', editTestCategoryModel.message,
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
    } else {
      Get.snackbar('Failed', editTestCategoryModel.message,
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
    }
  } else {
    Get.snackbar('Failed', 'Something went wrong.',
        snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
  }
}
