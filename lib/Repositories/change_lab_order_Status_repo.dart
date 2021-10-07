/// status : true
/// success : 1
/// message : "Order accepted successfully"
import 'package:doctoworld_seller/Controllers/loading_controller.dart';
import 'package:doctoworld_seller/DrawerItems/recent_orders.dart';
import 'package:doctoworld_seller/Services/post_method_call.dart';
import 'package:doctoworld_seller/Services/service_urls.dart';
import 'package:doctoworld_seller/Storage/local_Storage.dart';
import 'package:doctoworld_seller/lab_owner/Orders/all_lab_orders.dart';
import 'package:doctoworld_seller/lab_owner/Orders/lab_pending_order_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

labMethod() {}
changeOrderStatusRepo(
    bool responseCheck, Map<String, dynamic> response, BuildContext context) {
  if (responseCheck) {
    if (response['success'] == true) {
      if (storageBox!.read('role') == 'pharmacy_owner') {
        postMethod(
            context,
            fcmService,
            {
              'notification': <String, dynamic>{
                'body': 'Your order status has been changed!',
                'title': 'Lab'
              },
              'priority': 'high',
              'data': <String, dynamic>{
                'routeWeb': 'doctor/appointment',
                'routeApp': '/recentOrders',
              },
              'to': Get.find<LoaderController>().otherRoleToken,
            },
            false,
            labMethod);
        Get.to(RecentOrders(
          tabIndex: 1,
        ));
      } else {
        if (orderStatusChanger == 'sample_collected') {
          postMethod(
              context,
              fcmService,
              {
                'notification': <String, dynamic>{
                  'body': 'Your sample has been collected for test!',
                  'title': 'Lab'
                },
                'priority': 'high',
                'data': <String, dynamic>{
                  'routeWeb': 'doctor/appointment',
                  'routeApp': '/labOrders',
                },
                'to': Get.find<LoaderController>().otherRoleToken,
              },
              false,
              labMethod);
          Get.off(AllLabOrders(
            tabIndex: 1,
          ));
        } else if (orderStatusChanger == 'in_progress') {
          postMethod(
              context,
              fcmService,
              {
                'notification': <String, dynamic>{
                  'body': 'Your lab test is now in progress!',
                  'title': 'Lab'
                },
                'priority': 'high',
                'data': <String, dynamic>{
                  'routeWeb': 'doctor/appointment',
                  'routeApp': '/labOrders',
                },
                'to': Get.find<LoaderController>().otherRoleToken,
              },
              false,
              labMethod);
          Get.off(AllLabOrders(
            tabIndex: 2,
          ));
        } else if (orderStatusChanger == 'delivered') {
          postMethod(
              context,
              fcmService,
              {
                'notification': <String, dynamic>{
                  'body': 'Your lab test has been delivered',
                  'title': 'Lab'
                },
                'priority': 'high',
                'data': <String, dynamic>{
                  'routeWeb': 'doctor/appointment',
                  'routeApp': '/labOrders',
                },
                'to': Get.find<LoaderController>().otherRoleToken,
              },
              false,
              labMethod);
          Get.off(AllLabOrders(
            tabIndex: 3,
          ));
        }
      }

      Get.snackbar('Changed', '${response['message']}',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
      Get.find<LoaderController>().updateFormController(false);
    } else {
      Get.snackbar('Failed', response['message'],
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
      Get.find<LoaderController>().updateFormController(false);
    }
  }
}
