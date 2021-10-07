import 'package:doctoworld_seller/Controllers/loading_controller.dart';
import 'package:doctoworld_seller/Models/delete_test_under_test__categories_model.dart';
import 'package:doctoworld_seller/Repositories/tests_by_test_category_repo.dart';
import 'package:doctoworld_seller/Services/get_method_call.dart';
import 'package:doctoworld_seller/Services/service_urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

var deletedTestCategoryId;
deleteTestUnderTestsCategoryRepo(
    bool responseCheck, Map<String, dynamic> response, BuildContext context) {
  var deleteTestUnderTestCategoryModel;
  deleteTestUnderTestCategoryModel =
      DeleteTestUnderTestCategoriesModel.fromJson(response);
  if (responseCheck) {
    if (deleteTestUnderTestCategoryModel.status == true) {
      getMethod(
          context,
          getAllTestsUnderTestCategoryService,
          {'test_category_id': deletedTestCategoryId},
          true,
          testsByTestCategoryRepo);
      Get.find<LoaderController>().updateFormController(false);
      Get.snackbar('Deleted', deleteTestUnderTestCategoryModel.message,
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
    } else {
      Get.find<LoaderController>().updateFormController(false);
      Get.snackbar('Failed', deleteTestUnderTestCategoryModel.message,
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
    }
  } else {
    Get.find<LoaderController>().updateFormController(false);
    Get.snackbar('Failed', 'Something went wrong.',
        snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
  }
}
