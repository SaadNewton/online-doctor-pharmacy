import 'package:doctoworld_seller/Controllers/loading_controller.dart';
import 'package:doctoworld_seller/Data/global_data.dart';
import 'package:doctoworld_seller/Models/order_requests_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

getOrderRequestData(
    bool responseCheck, Map<String, dynamic> response, BuildContext context) {
  if (responseCheck) {
    orderRequestsModel = OrderRequestsModel.fromJson(response);
    Get.find<LoaderController>().updateDataController(false);
  } else {
    Get.find<LoaderController>().updateDataController(false);
  }
}
