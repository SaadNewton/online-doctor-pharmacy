import 'dart:developer';

import 'package:doctoworld_seller/Auth/Verification/UI/verification_ui.dart';
import 'package:doctoworld_seller/Components/custom_dialog.dart';
import 'package:doctoworld_seller/Controllers/loading_controller.dart';
import 'package:doctoworld_seller/Data/global_data.dart';
import 'package:doctoworld_seller/Services/opt_service.dart';
import 'package:doctoworld_seller/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///-------- get-login-data-API-call
phoneEmailCheckRepo(
    bool responseCheck, Map<String, dynamic> response, BuildContext context) {
  if (responseCheck) {
    LoaderController c = Get.put(LoaderController());
    var emailPhoneValidModel;
    log('data ' + response.toString());
    if (response['email'] || response['phone']) {
      Get.find<LoaderController>().updateFormController(false);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomDialogBox(
              title: 'Sorry',
              titleColor: customDialogErrorColor,
              descriptions: 'Email or Phone Number Already Exist',
              text: 'Ok',
              functionCall: () {
                Navigator.pop(context);
              },
              img: 'assets/dialog_error.svg',
            );
          });
    } else {
      if (phoneController.text.contains('+92')) {
        print('NUMBER--->>${phoneController.text}');
        otpFunction(phoneController.text, context);
        Get.find<LoaderController>().updateFormController(false);
        Get.to(VerificationUI(
          getPhone: phoneController.text,
        ));
      } else {
        if (phoneController.text.startsWith('0'))
          phoneController.text = phoneController.text.replaceFirst('0', '+92');
        print('NUMBER--->>${phoneController.text}');

        otpFunction(phoneController.text, context);
        Get.find<LoaderController>().updateFormController(false);
        Get.to(VerificationUI(
          getPhone: phoneController.text,
        ));
      }
    }
  } else if (!responseCheck && response == null) {
    Get.find<LoaderController>().updateFormController(false);

    print('Exception........................' + response.toString());
  }
}
