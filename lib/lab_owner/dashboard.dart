//@dart=2.9
import 'dart:async';

import 'package:doctoworld_seller/Controllers/loading_controller.dart';
import 'package:doctoworld_seller/Repositories/lab_approval_repo.dart';
import 'package:doctoworld_seller/Services/get_method_call.dart';
import 'package:doctoworld_seller/Services/service_urls.dart';
import 'package:doctoworld_seller/UI/change_password.dart';
import 'package:doctoworld_seller/UI/login_ui.dart';
import 'package:doctoworld_seller/lab_owner/show_all_test_categories.dart';
import 'package:doctoworld_seller/storage/local_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<dynamic> dashboard = [
    {
      'text1': '',
      'text2': 'New Order',
      'image': 'assets/orange.png',
      'icon': Icons.group_rounded
    },
    {
      'text1': '',
      'text2': 'Test Done',
      'image': 'assets/blue.png',
      'icon': Icons.check_circle_outline
    }
  ];

// final List<Color> colors = <Color>[customOrangeColor, primaryColor, Colors.red, Colors.green];
  final List<Color> color1 = <Color>[
    Color(0xff8E54E9),
    Color(0xff3A7BD5),
    Color(0xff2948FF),
    Color(0xff38EF7D)
  ];
  final List<Color> color2 = <Color>[
    Color(0xff4776E6),
    Color(0xff00D2FF),
    Color(0xff396AFC),
    Color(0xff11998E)
  ];

  List<dynamic> drawerDetail = [
    {'leading': Icons.home, 'title': 'Dashboard', 'go': Dashboard()},
    {
      'leading': Icons.format_list_bulleted_rounded,
      'title': 'All Test Categories',
      'go': ShowAllTestCategories()
    },
    {
      'leading': Icons.lock,
      'title': 'Reset Password',
    },
    {'leading': Icons.logout, 'title': 'Logout', 'go': LoginUI()},
  ];

  viewChangeOfDrawer(int index) {
    switch (index) {
      case 0:
        return {Navigator.pop(context)};
        break;
      case 1:
        return {Get.to(() => ShowAllTestCategories())};

        break;
      case 2:
        return {
          Get.to(() => ChangePassword(
                userId: storageBox.read('lab_id'),
              )),
        };
        break;
      case 3:
        return {
          storageBox.remove('session'),
          Get.offAll(LoginUI()),
        };
        break;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    if (!storageBox.hasData('labApproved')) {
      print('bilal here');
      Timer.periodic(Duration(seconds: 2), (Timer t) {
        checkLabApprovalStatus();
      });
    } else {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Get.find<LoaderController>().checkPharmacyStatusLoader(true);
      });
    }

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<LoaderController>().updateDataController(true);
    });

    // get order requests

    // get accepted orders

    super.initState();
  }

  checkLabApprovalStatus() {
    if (Get.find<LoaderController>().pharmacyStatusLoader == false) {
      print('aaa ${storageBox.read('lab_id')}');
      getMethod(context, labApprovalCheckService,
          {'lab_id': storageBox.read('lab_id')}, true, labApprovalRepo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LoaderController(),
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
          : Scaffold(
              appBar: AppBar(
                iconTheme: IconThemeData(
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  'Dashboard',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                centerTitle: true,
                backgroundColor: Colors.transparent,
              ),
              drawer: Drawer(
                child: Container(
                  width: 250,
                  child: Column(
                    children: [
                      Container(
                        height: 160,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color(0xff8E54E9),
                              Color(0xff4776E6),
                            ],
                          ),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50)),
                        ),
                        child: Image.asset('assets/splash-logo.png'),
                      ),
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: drawerDetail.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Icon(drawerDetail[index]['leading']),
                            title: InkWell(
                              child: Text(drawerDetail[index]['title']),
                              onTap: () {
                                viewChangeOfDrawer(index);
                              },
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(
                          thickness: 1.0,
                          color: Colors.black.withOpacity(0.2),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              body: Container(
                color: Color(0xffF4F7F8),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: Container(
                  child: ListView.builder(
                    itemCount: dashboard.length,
                    itemBuilder: (BuildContext context, index) {
                      return InkWell(
                        onTap: () {},
                        child: Container(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: SizedBox(
                              height: 159,
                              child: Column(children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.2),
                                                spreadRadius: 2,
                                                blurRadius: 5)
                                          ]),
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        height: double.infinity,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    dashboard[index]['image']),
                                                fit: BoxFit.fill),
                                            //  color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.2),
                                                  spreadRadius: 2,
                                                  blurRadius: 5)
                                            ],
                                            gradient: LinearGradient(
                                              begin: Alignment.topRight,
                                              end: Alignment.bottomLeft,
                                              colors: [
                                                color1[index],
                                                color2[index],
                                              ],
                                            )),
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              //   SvgPicture.asset('assets/doctor icon.svg',
                                              // height: 40,),
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Icon(
                                                      dashboard[index]['icon'],
                                                      color: Colors.white38,
                                                      size: 65,
                                                    ),
                                                  ]),

                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    dashboard[index]['text2'],
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    dashboard[index]['text1'],
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
    );
  }
}
