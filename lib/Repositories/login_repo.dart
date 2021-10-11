import 'dart:developer';

import 'package:doctoworld_seller/Components/custom_dialog.dart';
import 'package:doctoworld_seller/Controllers/loading_controller.dart';
import 'package:doctoworld_seller/Data/global_data.dart';
import 'package:doctoworld_seller/DrawerItems/recent_orders.dart';
import 'package:doctoworld_seller/Models/user_detail_model.dart';
import 'package:doctoworld_seller/Storage/local_Storage.dart';
import 'package:doctoworld_seller/Theme/colors.dart';
import 'package:doctoworld_seller/lab_owner/Orders/all_lab_orders.dart';
import 'package:doctoworld_seller/lab_owner/profile_wizard/lab_profile_wizard.dart';
import 'package:doctoworld_seller/screens/pharmacr_profile_wizard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///-------- get-login-data-API-call
getLoginData(
    bool responseCheck, Map<String, dynamic> response, BuildContext context) {
  if (responseCheck) {
    log('getLogin UserData ------>> $response');

    userDetailModel = UserDetailModel.fromJson(response);
    if (userDetailModel!.status == true) {
      storeDataLocally('user_detail', userDetailModel);
      storeDataLocally('session', 'active');
      storeDataLocally('authToken', userDetailModel!.data!.auth!.token);

      storeDataLocally('role', userDetailModel!.data!.auth!.role);

      if (userDetailModel!.data!.auth!.role == 'lab_owner') {
        storeDataLocally('lab_id', userDetailModel!.data!.id);
        if (userDetailModel!.data!.isVerified == 1) {
          print('approveddddddddddddd');
          storageBox!.write('labApproved', 'true');
        }
        if (userDetailModel!.data!.contactName == null) {
          storeDataLocally('labProfileComplete', 'false');
          Get.find<LoaderController>().updateFormController(false);
          Get.offAll(LabProfileWizard());
        } else {
          storeDataLocally('labProfileComplete', 'true');
          Get.find<LoaderController>().updateFormController(false);
          Get.offAll(AllLabOrders(
            tabIndex: 0,
          ));
        }
      } else {
        storeDataLocally('pharmacy_id', userDetailModel!.data!.id);
        if (userDetailModel!.data!.isVerified == 1) {
          print('approveddddddddddddd');
          storageBox!.write('pharmacyApproved', 'true');
        }
        if (userDetailModel!.data!.contactName == null) {
          Get.find<LoaderController>().updateFormController(false);
          Get.offAll(PharmacyProfileWizard());
          storeDataLocally('pharmacyProfileComplete', 'false');
        } else {
          Get.find<LoaderController>().updateFormController(false);
          storeDataLocally('pharmacyProfileComplete', 'true');
          Get.offAll(RecentOrders(
            tabIndex: 0,
          ));
        }
      }
    } else {
      Get.find<LoaderController>().updateFormController(false);
      log('data ' + response.toString());
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomDialogBox(
              title: 'FAILED!',
              titleColor: customDialogErrorColor,
              descriptions: userDetailModel!.message,
              text: 'Ok',
              functionCall: () {
                Navigator.pop(context);
              },
              img: 'assets/dialog_error.svg',
            );
          });
    }
  } else if (!responseCheck && response == null) {
    Get.find<LoaderController>().updateFormController(false);

    print('Exception................................. ' + response.toString());
  }
}
