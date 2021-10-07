import 'package:doctoworld_seller/Controllers/loading_controller.dart';
import 'package:doctoworld_seller/Models/delete_test_category_model.dart';
import 'package:doctoworld_seller/Repositories/all_lab_test_categories_repo.dart';
import 'package:doctoworld_seller/Services/get_method_call.dart';
import 'package:doctoworld_seller/Services/service_urls.dart';
import 'package:doctoworld_seller/Storage/local_Storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

deleteTestCategoryRepo(
    bool responseCheck, Map<String, dynamic> response, BuildContext context) {
  var deletelabTestCategoryModel;
  deletelabTestCategoryModel = DeleteTestCategoryModel.fromJson(response);
  if (responseCheck) {
    if (deletelabTestCategoryModel.status == true) {
      getMethod(
          context,
          getAllLabTestCategoriesService,
          {'lab_id': storageBox!.read('lab_id')},
          true,
          getAllLabTestCategoriesRepo);
      Get.snackbar('Deleted', deletelabTestCategoryModel.message,
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
      Get.find<LoaderController>().updateFormController(false);
    } else {
      Get.snackbar('Failed', deletelabTestCategoryModel.message,
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
      Get.find<LoaderController>().updateFormController(false);
    }
  } else {
    Get.snackbar('Failed', 'Something went wrong.',
        snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
  }
}
