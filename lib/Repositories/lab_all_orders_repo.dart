import 'package:doctoworld_seller/Controllers/loading_controller.dart';
import 'package:doctoworld_seller/Data/global_data.dart';
import 'package:doctoworld_seller/Models/lab_all_orders_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

getLabAllOrders(
    bool responseCheck, Map<String, dynamic> response, BuildContext context) {
  print('darta' + response.toString());
  if (responseCheck) {
    labAllOrdersModel = LabAllOrdersModel.fromJson(response);
    Get.find<LoaderController>().updateDataController(false);
  } else {
    Get.find<LoaderController>().updateDataController(false);
  }
}
