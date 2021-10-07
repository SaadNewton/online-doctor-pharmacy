import 'package:doctoworld_seller/Controllers/loading_controller.dart';
import 'package:doctoworld_seller/Controllers/model_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

testsByTestCategoryRepo(
    bool responseCheck, Map<String, dynamic> response, BuildContext context) {
  if (responseCheck) {
    Get.find<ModelControllers>().getTestsByTestCategory(response);
    Get.find<LoaderController>().updateDataController(false);
  } else {
    Get.find<LoaderController>().updateDataController(false);
  }
}
