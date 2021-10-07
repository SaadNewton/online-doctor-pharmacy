/// status : true
/// success : 1
/// message : "Order accepted successfully"
import 'package:doctoworld_seller/Controllers/loading_controller.dart';
import 'package:doctoworld_seller/DrawerItems/recent_orders.dart';
import 'package:doctoworld_seller/Models/accept_order_request_model.dart';
import 'package:doctoworld_seller/Repositories/show_all_orders_repo.dart';
import 'package:doctoworld_seller/Services/get_method_call.dart';
import 'package:doctoworld_seller/Services/post_method_call.dart';
import 'package:doctoworld_seller/Services/service_urls.dart';
import 'package:doctoworld_seller/Storage/local_Storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

method() {}
acceptOrderRequest(
    bool responseCheck, Map<String, dynamic> response, BuildContext context) {
  var acceptOrderModel;
  acceptOrderModel = AcceptOrderRequestModel.fromJson(response);
  if (responseCheck) {
    if (acceptOrderModel.status == true) {
      postMethod(
          context,
          fcmService,
          {
            'notification': <String, dynamic>{
              'body': 'Your order has been accepted',
              'title': 'Pharmacy'
            },
            'priority': 'high',
            'data': <String, dynamic>{
              'routeWeb': 'doctor/appointment',
              'routeApp': '/recentOrders',
            },
            'to': Get.find<LoaderController>().otherRoleToken,
          },
          false,
          method);
      Get.to(RecentOrders(
        tabIndex: 0,
      ));
      Get.snackbar('Accepted', acceptOrderModel.message,
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
      getMethod(
          context,
          getAllAcceptedOrdersService,
          {'pharmacy_id': storageBox!.read('pharmacy_id')},
          true,
          showAllOrders);
    } else {
      Get.snackbar('Failed', acceptOrderModel.message,
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
    }
  } else {
    Get.snackbar('Failed', 'Something went wrong.',
        snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
  }
}
