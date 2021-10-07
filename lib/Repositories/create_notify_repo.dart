import 'package:doctoworld_seller/Repositories/get_notify_token_repo.dart';
import 'package:doctoworld_seller/Services/get_method_call.dart';
import 'package:doctoworld_seller/Services/service_urls.dart';
import 'package:doctoworld_seller/Storage/local_Storage.dart';
import 'package:flutter/material.dart';

createNotifyRepo(
    bool responseCheck, Map<String, dynamic> response, BuildContext context) {
  if (responseCheck) {
    if (response['status']) {
      if (storageBox!.read('role') == 'pharmacy_owner') {
        getMethod(
            context,
            getNotifyTokenService,
            {
              'user_id': storageBox!.read('pharmacy_id'),
              'role': storageBox!.read('role')
            },
            false,
            getNotifyTokenRepo);
      } else {
        getMethod(
            context,
            getNotifyTokenService,
            {
              'user_id': storageBox!.read('lab_id'),
              'role': storageBox!.read('role')
            },
            false,
            getNotifyTokenRepo);
      }
    } else {}
    print('cart ------>> $response');
  } else if (!responseCheck && response == null) {
    print('Exception........................');
    // Get.find<AppController>().changeServerErrorCheck(true);
  }
}
