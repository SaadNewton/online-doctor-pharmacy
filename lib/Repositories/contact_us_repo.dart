import 'dart:developer';

import 'package:doctoworld_seller/Components/custom_dialog.dart';
import 'package:doctoworld_seller/Controllers/loading_controller.dart';
import 'package:doctoworld_seller/Data/global_data.dart';
import 'package:doctoworld_seller/DrawerItems/recent_orders.dart';
import 'package:doctoworld_seller/Models/contact_us_model.dart';
import 'package:doctoworld_seller/Storage/local_Storage.dart';
import 'package:doctoworld_seller/Theme/colors.dart';
import 'package:doctoworld_seller/lab_owner/Orders/all_lab_orders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///-------- Approve Appointments by doctor
contactUsRepo(
    bool responseCheck, Map<String, dynamic> response, BuildContext context) {
  if (responseCheck) {
    Get.find<LoaderController>().updateFormController(false);
    contactUsModel = ContactUsModel.fromJson(response);
    if (contactUsModel.status == true) {
      print('Contact Us Message------>> ${contactUsModel.message}');
      Get.snackbar('Submitted', 'Thank you for your feedback',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
      if (storageBox!.read('role') == 'pharmacy_owner') {
        Get.offAll(RecentOrders(
          tabIndex: 0,
        ));
      } else {
        Get.offAll(AllLabOrders(
          tabIndex: 0,
        ));
      }
    } else {
      log('data ' + response.toString());
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomDialogBox(
              title: 'FAILED!',
              titleColor: customDialogErrorColor,
              descriptions: 'Sorry, Something went wrong.',
              text: 'Ok',
              functionCall: () {
                Navigator.pop(context);
              },
              img: 'assets/dialog_error.svg',
            );
          });
    }
  } else if (!responseCheck && response == null) {
    print('Email not sent');
    Get.find<LoaderController>().updateFormController(false);

    print('Exception........................ ' + response.toString());
    // Get.find<AppController>().changeServerErrorCheck(true);
  }
}
