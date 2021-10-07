import 'dart:async';

import 'package:doctoworld_seller/DrawerItems/recent_orders.dart';
import 'package:doctoworld_seller/Storage/local_Storage.dart';
import 'package:doctoworld_seller/Theme/colors.dart';
import 'package:doctoworld_seller/UI/login_ui.dart';
import 'package:doctoworld_seller/lab_owner/Orders/all_lab_orders.dart';
import 'package:doctoworld_seller/lab_owner/profile_wizard/lab_profile_wizard.dart';
import 'package:doctoworld_seller/screens/pharmacr_profile_wizard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    delayScreen();

    //LoginNavigator
  }

  delayScreen() async {
    var duration = new Duration(seconds: 2);
    return new Timer(duration, route);
  }

  route() {
    // Navigator.pushReplacement(context,
    //     MaterialPageRoute(builder: (context) => ForgotPasswordEmailVerify()));
    storageBox!.read('authToken') != null
        ? storageBox!.read('role') == 'lab_owner'
            ? storageBox!.read('labProfileComplete') == 'true'
                ? Get.offAll(AllLabOrders(
                    tabIndex: 0,
                  ))
                : Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LabProfileWizard()))
            : storageBox!.read('pharmacyProfileComplete') == 'true'
                ? Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RecentOrders(
                              tabIndex: 0,
                            )))
                : Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PharmacyProfileWizard()))
        : Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginUI()));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ///background image
        Image.asset(
          'assets/splash-background.png',
          fit: BoxFit.fill,
          height: double.infinity,
          width: double.infinity,
        ),

        ///Gradient container 4
        Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              customGradientLightBlue.withOpacity(0.3),
              Theme.of(context).primaryColor
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: Center(
              child: Image.asset('assets/splash-logo.png'),
            )),
      ],
    );
  }
}
