import 'dart:developer';

import 'package:doctoworld_seller/Components/custom_dialog.dart';
import 'package:doctoworld_seller/Controllers/loading_controller.dart';
import 'package:doctoworld_seller/Models/forget_password_model.dart';
import 'package:doctoworld_seller/Theme/colors.dart';
import 'package:doctoworld_seller/UI/login_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

forgotPasswordRepo(
    bool responseCheck, Map<String, dynamic> response, BuildContext context) {
  if (responseCheck) {
    var forgetPasswordModel;
    forgetPasswordModel = ForgetPasswordModel.fromJson(response);
    if (forgetPasswordModel.status == true) {
      Get.find<LoaderController>().updateFormController(false);
      Get.snackbar('Done', 'Password Changed Successfully.',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
      Get.offAll(LoginUI());
      print('Password change Message------>> ${forgetPasswordModel.message}');
    } else {
      log('data ' + response.toString());
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomDialogBox(
              title: 'FAILED!',
              titleColor: customDialogErrorColor,
              descriptions: forgetPasswordModel.message,
              text: 'Ok',
              functionCall: () {
                Navigator.pop(context);
              },
              img: 'assets/dialog_error.svg',
            );
          });
    }
  } else if (!responseCheck && response == null) {
    Get.snackbar('Something went wrong.', 'Sorry, Password not changed',
        snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
    print('Password Not changed');
    Get.find<LoaderController>().updateFormController(false);

    print('Exception........................ ' + response.toString());
    // Get.find<AppController>().changeServerErrorCheck(true);
  }
}
