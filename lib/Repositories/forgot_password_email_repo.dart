import 'dart:developer';

import 'package:doctoworld_seller/Components/custom_dialog.dart';
import 'package:doctoworld_seller/Controllers/loading_controller.dart';
import 'package:doctoworld_seller/Models/forget_password_email_model.dart';
import 'package:doctoworld_seller/Theme/colors.dart';
import 'package:doctoworld_seller/UI/forgot-password-email-verify_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///-------- Approve Appointments by doctor
forgotPasswordEmailRepo(
    bool responseCheck, Map<String, dynamic> response, BuildContext context) {
  if (responseCheck) {
    Get.find<LoaderController>().updateFormController(false);
    var forgetPasswordEmailModel;
    forgetPasswordEmailModel = ForgetPasswordEmailModel.fromJson(response);
    if (forgetPasswordEmailModel.status == true) {
      Get.to(ForgotPasswordEmailVerify());
      // storeDataLocally('user_detail', response);
      // storeDataLocally('session', 'active');
      // storeDataLocally('authToken', userDetailModel.data!.auth!.token);
      // Get.offAll(BottomNavigation());
      print(
          'Password Email Message------>> ${forgetPasswordEmailModel.message}');
    } else {
      log('data ' + response.toString());
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomDialogBox(
              title: 'FAILED!',
              titleColor: customDialogErrorColor,
              descriptions: forgetPasswordEmailModel.message,
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
