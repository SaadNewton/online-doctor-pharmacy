import 'dart:developer';

import 'package:doctoworld_seller/Data/global_data.dart';
import 'package:doctoworld_seller/Repositories/singup_repo.dart';
import 'package:doctoworld_seller/Services/post_method_call.dart';
import 'package:doctoworld_seller/Services/service_urls.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

String? verificationIDForVerify;
otpFunction(String? phone, BuildContext? context) async {
  print('otpFunction');
  FirebaseAuth _auth = FirebaseAuth.instance;
  _auth.verifyPhoneNumber(
    phoneNumber: phone!,
    timeout: Duration(seconds: 55),
    verificationCompleted: (AuthCredential credential) async {
      print('Credential from verificationCompleted ---->> ${credential}');
    },
    verificationFailed: (FirebaseAuthException exception) {
      print('Exception ->>> ${exception.message}');
    },
    codeSent: (String? verificationId, [int? forceResendingToken]) {
      verificationIDForVerify = verificationId;
      log('verificationId -->> ${verificationId}');
    },
    codeAutoRetrievalTimeout: (String verificationId) {},
  );
}

verifyOTP(
  BuildContext context,
  var otp,
) async {
  print('verify');
  try {
    AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationIDForVerify!,
      smsCode: otp,
    );

    User? user =
        (await FirebaseAuth.instance.signInWithCredential(credential)).user;
    if (user != null) {
      postMethod(
          context,
          customerSignUpService,
          {
            'phone': phoneController.text,
            'email': emailController.text,
            'password': passController.text,
            'owner_name': nameController.text,
            'confirm_password': confirmPassController.text,
            'lat': signUplatitude,
            'long': signUplongitude,
            'address': locationController.text,
            'role': signUpSelectedRole,
          },
          false,
          getSignupData);
      print('user added by otp');
    } else {
      Get.snackbar('Error', 'Something went wrong.',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
      print("Error");
    }
    print('Credential ---->> ${credential}');
  } catch (e) {
    print('Exception ->> $e');
    Get.snackbar('Try Again', 'Verification code is wrong',
        snackPosition: SnackPosition.BOTTOM);
  }
}
