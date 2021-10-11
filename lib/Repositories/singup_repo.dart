import 'dart:developer';

import 'package:doctoworld_seller/Components/custom_dialog.dart';
import 'package:doctoworld_seller/Controllers/loading_controller.dart';
import 'package:doctoworld_seller/Data/global_data.dart';
import 'package:doctoworld_seller/Models/signup_userdata_model.dart';
import 'package:doctoworld_seller/Storage/local_Storage.dart';
import 'package:doctoworld_seller/Theme/colors.dart';
import 'package:doctoworld_seller/lab_owner/profile_wizard/lab_profile_wizard.dart';
import 'package:doctoworld_seller/screens/pharmacr_profile_wizard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///-------- get-login-data-API-call
getSignupData(
    bool responseCheck, Map<String, dynamic> response, BuildContext context) {
  log('sign up data ' + response.toString());
  LoaderController c = Get.put(LoaderController());
  if (responseCheck) {
    Get.find<LoaderController>().updateFormController(false);
    signupUserdataModel = SignupUserdataModel.fromJson(response);
    if (signupUserdataModel!.status == true) {
      storeDataLocally('session', 'active');
      storeDataLocally('authToken', signupUserdataModel!.data!.auth!.token);
      if (signupUserdataModel!.data!.auth!.role == 'lab_owner') {
        storeDataLocally('lab_id', signupUserdataModel!.data!.id);
        storeDataLocally('role', signupUserdataModel!.data!.auth!.role);
        storeDataLocally('labProfileComplete', 'false');
        Get.offAll(LabProfileWizard());
      } else {
        storeDataLocally('pharmacy_id', signupUserdataModel!.data!.id);
        storeDataLocally('role', signupUserdataModel!.data!.auth!.role);
        Get.offAll(PharmacyProfileWizard());
        storeDataLocally('pharmacyProfileComplete', 'false');
      }
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomDialogBox(
              title: 'FAILED!',
              titleColor: customDialogErrorColor,
              descriptions: signupUserdataModel!.message,
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

    print('Exception........................' + response.toString());
  }
}
