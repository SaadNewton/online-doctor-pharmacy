import 'dart:developer';

import 'package:doctoworld_seller/Controllers/loading_controller.dart';
import 'package:doctoworld_seller/DrawerItems/recent_orders.dart';
import 'package:doctoworld_seller/Services/post_method_call.dart';
import 'package:doctoworld_seller/Services/service_urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

nullMethod() {}
editOrderRepo(
    bool responseCheck, Map<String, dynamic> response, BuildContext context) {
  if (responseCheck) {
    log(response.toString());
    if (response['status']) {
      Get.find<LoaderController>().updateFormController(false);
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
          nullMethod);
      Get.to(RecentOrders(
        tabIndex: 1,
      ));
    }
  } else if (!responseCheck && response == null) {
    print('Doctor not Accept');
    Get.find<LoaderController>().updateFormController(false);

    print('Exception........................ ' + response.toString());
  }
}
