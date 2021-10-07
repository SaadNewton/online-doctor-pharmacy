import 'dart:async';
import 'dart:ui';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:doctoworld_seller/Account/account_page.dart';
import 'package:doctoworld_seller/Controllers/loading_controller.dart';
import 'package:doctoworld_seller/Controllers/model_controllers.dart';
import 'package:doctoworld_seller/Locale/locale.dart';
import 'package:doctoworld_seller/Pages/accepted_orders.dart';
import 'package:doctoworld_seller/Pages/order_requests_pharmacy.dart';
import 'package:doctoworld_seller/Repositories/approval_check_repo.dart';
import 'package:doctoworld_seller/Repositories/create_notify_repo.dart';
import 'package:doctoworld_seller/Services/get_method_call.dart';
import 'package:doctoworld_seller/Services/post_method_call.dart';
import 'package:doctoworld_seller/Services/service_urls.dart';
import 'package:doctoworld_seller/Storage/local_Storage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentOrders extends StatefulWidget {
  final tabIndex;
  RecentOrders({this.tabIndex});
  @override
  _RecentOrdersState createState() => _RecentOrdersState();
}

class _RecentOrdersState extends State<RecentOrders>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  String? fcmToken;
  updateToken() async {
    await FirebaseMessaging.instance.getToken().then((value) {
      fcmToken = value;
      storageBox!.write('fcmToken', fcmToken);
    });
    postMethod(
        context,
        createNotifyUserService,
        {
          'role': 'pharmacy_owner',
          'user_id': storageBox!.read('pharmacy_id'),
          'token': fcmToken
        },
        false,
        createNotifyRepo);
  }

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController!.index = widget.tabIndex;
    updateToken();
    // TODO: implement initState
    super.initState();
    if (!storageBox!.hasData('pharmacyApproved')) {
      print('bilal here');
      Timer.periodic(Duration(seconds: 2), (Timer t) {
        checkPharmacyApprovalStatus();
      });
    } else {
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        Get.find<LoaderController>().checkPharmacyStatusLoader(true);
      });
    }

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Get.find<LoaderController>().updateDataController(true);
    });

    // get order requests

    // get accepted orders
  }

  checkPharmacyApprovalStatus() {
    if (Get.find<LoaderController>().pharmacyStatusLoader == false) {
      getMethod(
          context,
          pharmacyApprovalCheckService,
          {'pharmacy_id': storageBox!.read('pharmacy_id')},
          true,
          pharmacyApprovalRepo);
    }
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    return GetBuilder<LoaderController>(
      builder: (loaderController) => !loaderController.pharmacyStatusLoader
          ? Scaffold(
              backgroundColor: Theme.of(context).backgroundColor,
              body: SafeArea(
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/doctor_logo.png',
                      width: MediaQuery.of(context).size.width * .4,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor,
                        radius: 150,
                        child: Text(
                          'Please wait\n Your request has been sent for approval.',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                  ],
                )),
              ))
          : GetBuilder<ModelControllers>(
              builder: (modelController) => DefaultTabController(
                length: 2,
                child: Scaffold(
                  appBar: AppBar(
                    title: Text('Orders'),
                    textTheme: Theme.of(context).textTheme,
                    centerTitle: true,
                    leading: IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () {
                        // Navigator.
                        // pushNamed(context, PageRoutes.accountPage);
                        Get.to(AccountPage());
                      },
                    ),
                    bottom: TabBar(
                        controller: tabController,
                        indicatorColor: Colors.transparent,
                        unselectedLabelColor: Theme.of(context).disabledColor,
                        labelColor: Theme.of(context).primaryColor,
                        labelStyle: Theme.of(context).textTheme.bodyText1,
                        unselectedLabelStyle:
                            Theme.of(context).textTheme.bodyText1,
                        tabs: [
                          Tab(text: 'Requests'),
                          Tab(text: 'Accepted'),
                        ]),
                  ),
                  body: TabBarView(controller: tabController, children: [
                    FadedSlideAnimation(
                      NewOrders(),
                      beginOffset: Offset(0.3, 0.3),
                      endOffset: Offset(0, 0),
                      slideCurve: Curves.linearToEaseOut,
                    ),
                    FadedSlideAnimation(
                      AcceptedOrders(),
                      beginOffset: Offset(0, 0.3),
                      endOffset: Offset(0, 0),
                      slideCurve: Curves.linearToEaseOut,
                    ),
                  ]),
                ),
              ),
            ),
    );
  }
}
