import 'dart:developer';

import 'package:doctoworld_seller/Components/custom_dialog.dart';
import 'package:doctoworld_seller/Controllers/loading_controller.dart';
import 'package:doctoworld_seller/Models/forget_password_email_verify_model.dart';
import 'package:doctoworld_seller/Theme/colors.dart';
import 'package:doctoworld_seller/UI/forget_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///-------- Approve Appointments by doctor
forgotPasswordEmailVerifyRepo(
    bool responseCheck, Map<String, dynamic> response, BuildContext context) {
  if (responseCheck) {
    Get.find<LoaderController>().updateFormController(false);
    var forgetPasswordEmailVerifyModel;
    forgetPasswordEmailVerifyModel =
        ForgetPasswordEmailVerifyModel.fromJson(response);
    if (forgetPasswordEmailVerifyModel.status == true) {
      Get.to(ForgetPassword());
      print(
          'Password Email verify Message------>> ${forgetPasswordEmailVerifyModel.message}');
    } else {
      log('data ' + response.toString());
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomDialogBox(
              title: 'FAILED!',
              titleColor: customDialogErrorColor,
              descriptions: forgetPasswordEmailVerifyModel.message,
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
  }
}
