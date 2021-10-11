import 'dart:developer';

import 'package:doctoworld_seller/Components/custom_dialog.dart';
import 'package:doctoworld_seller/Controllers/loading_controller.dart';
import 'package:doctoworld_seller/Models/change_password_model.dart';
import 'package:doctoworld_seller/Storage/local_Storage.dart';
import 'package:doctoworld_seller/Theme/colors.dart';
import 'package:doctoworld_seller/UI/login_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///-------- Approve Appointments by doctor
changePasswordRepo(
    bool responseCheck, Map<String, dynamic> response, BuildContext context) {
  if (responseCheck) {
    var changePasswordModel;
    Get.find<LoaderController>().updateFormController(false);
    changePasswordModel = ChangePasswordModel.fromJson(response);
    if (changePasswordModel.status == true) {
      Get.snackbar('Done', 'Password Changed Successfully.',
          backgroundColor: Colors.white, snackPosition: SnackPosition.BOTTOM);
      print('Change Password Message------>> ${changePasswordModel.message}');
      storageBox!.erase();
      Get.offAll(LoginUI());
    } else {
      log('data ' + response.toString());
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomDialogBox(
              title: 'FAILED!',
              titleColor: customDialogErrorColor,
              descriptions: changePasswordModel.message,
              text: 'Ok',
              functionCall: () {
                Navigator.pop(context);
              },
              img: 'assets/dialog_error.svg',
            );
          });
    }
  } else if (!responseCheck && response == null) {
    print('Password Not Change');
    Get.find<LoaderController>().updateFormController(false);

    print('Exception........................ ' + response.toString());
  }
}
