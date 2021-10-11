import 'dart:async';
import 'dart:ui';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:doctoworld_seller/Controllers/loading_controller.dart';
import 'package:doctoworld_seller/Controllers/model_controllers.dart';
import 'package:doctoworld_seller/Data/global_data.dart';
import 'package:doctoworld_seller/Locale/locale.dart';
import 'package:doctoworld_seller/Repositories/create_notify_repo.dart';
import 'package:doctoworld_seller/Repositories/lab_all_orders_repo.dart';
import 'package:doctoworld_seller/Repositories/lab_approval_repo.dart';
import 'package:doctoworld_seller/Services/get_method_call.dart';
import 'package:doctoworld_seller/Services/post_method_call.dart';
import 'package:doctoworld_seller/Services/service_urls.dart';
import 'package:doctoworld_seller/Storage/local_Storage.dart';
import 'package:doctoworld_seller/UI/change_password.dart';
import 'package:doctoworld_seller/UI/contact_us_ui.dart';
import 'package:doctoworld_seller/UI/edit_profile_ui.dart';
import 'package:doctoworld_seller/UI/login_ui.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../show_all_test_categories.dart';
import 'lab_pending_order_detail.dart';

class AllLabOrders extends StatefulWidget {
  final tabIndex;
  AllLabOrders({this.tabIndex});
  @override
  _AllLabOrdersState createState() => _AllLabOrdersState();
}

class _AllLabOrdersState extends State<AllLabOrders>
    with SingleTickerProviderStateMixin {
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
          'role': 'lab_owner',
          'user_id': storageBox!.read('lab_id'),
          'token': fcmToken
        },
        false,
        createNotifyRepo);
  }

  TabController? tabController;
  List<dynamic> drawerDetail = [
    {'leading': Icons.home, 'title': 'Dashboard', 'go': AllLabOrders()},
    {
      'leading': Icons.edit,
      'title': 'Edit Profile',
      'go': EditDetails(
        editLabDetails: true,
      )
    },
    {
      'leading': Icons.format_list_bulleted_rounded,
      'title': 'All Test Categories',
      'go': ShowAllTestCategories()
    },
    {
      'leading': Icons.lock,
      'title': 'Reset Password',
    },
    {
      'leading': Icons.message,
      'title': 'Contact Us',
    },
    {'leading': Icons.logout, 'title': 'Logout', 'go': LoginUI()},
  ];
  viewChangeOfDrawer(int index) {
    switch (index) {
      case 0:
        return {Navigator.pop(context)};
        break;
      case 1:
        return {
          Get.to(() => EditDetails(
                editLabDetails: true,
              ))
        };

        break;
      case 2:
        return {Get.to(() => ShowAllTestCategories())};

        break;
      case 3:
        return {
          Get.to(() => ChangePassword(
                userId: storageBox!.read('lab_id'),
              )),
        };
      case 4:
        return {
          Get.to(() => ContactUs()),
        };
      case 5:
        return {
          storageBox!.erase(),
          Get.offAll(LoginUI()),
        };
        break;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = new TabController(length: 4, vsync: this);
    tabController!.index = widget.tabIndex;
    updateToken();
    if (!storageBox!.hasData('labApproved')) {
      print('bilal here');
      Timer.periodic(Duration(seconds: 2), (Timer t) {
        checkLabApprovalStatus();
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
  }

  checkLabApprovalStatus() {
    if (Get.find<LoaderController>().pharmacyStatusLoader == false) {
      print('aaa ${storageBox!.read('lab_id')}');
      getMethod(context, labApprovalCheckService,
          {'lab_id': storageBox!.read('lab_id')}, true, labApprovalRepo);
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
                length: 4,
                child: Scaffold(
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
                  appBar: AppBar(
                    title: Text('Orders'),
                    textTheme: Theme.of(context).textTheme,
                    centerTitle: true,
                    bottom: TabBar(
                        controller: tabController,
                        isScrollable: true,
                        indicatorColor: Colors.transparent,
                        unselectedLabelColor: Theme.of(context).disabledColor,
                        labelColor: Theme.of(context).primaryColor,
                        labelStyle: Theme.of(context).textTheme.bodyText1,
                        unselectedLabelStyle:
                            Theme.of(context).textTheme.bodyText1,
                        tabs: [
                          Tab(text: 'Pending'),
                          Tab(
                            text: 'Sample Collected',
                          ),
                          Tab(text: 'In Progress'),
                          Tab(text: 'Completed'),
                        ]),
                  ),
                  body: TabBarView(controller: tabController, children: [
                    FadedSlideAnimation(
                      AllOrders(),
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
                    FadedSlideAnimation(
                      InProgressOrders(),
                      beginOffset: Offset(0, 0.3),
                      endOffset: Offset(0, 0),
                      slideCurve: Curves.linearToEaseOut,
                    ),
                    FadedSlideAnimation(
                      CompletedOrders(),
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

class AllOrders extends StatefulWidget {
  @override
  _AllOrdersState createState() => _AllOrdersState();
}

class _AllOrdersState extends State<AllOrders> {
  @override
  void initState() {
    // TODO: implement initState

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Get.find<LoaderController>().updateDataController(true);
    });
    getMethod(context, labAllOrdersService,
        {'lab_id': storageBox!.read('lab_id')}, true, getLabAllOrders);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<LoaderController>(
      init: LoaderController(),
      builder: (_) => _.dataLoader
          ? Center(
              child: CircularProgressIndicator(),
            )
          : labAllOrdersModel.status == false
              ? Center(child: Text('No Record Found'))
              : ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: labAllOrdersModel.data!.length,
                  itemBuilder: (context, outerIndex) {
                    return labAllOrdersModel.data![outerIndex].status !=
                            'pending'
                        ? SizedBox()
                        : InkWell(
                            onTap: () => Get.to(LabPendingOrderDetail(
                              labOrderDetail:
                                  labAllOrdersModel.data![outerIndex],
                            )),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Divider(
                                  thickness: 6,
                                  color: Theme.of(context).backgroundColor,
                                ),
                                ListTile(
                                  leading: FadedScaleAnimation(
                                    Image.asset(
                                      'assets/labTest.png',
                                      height: 40,
                                      width: 40,
                                    ),
                                    durationInMilliseconds: 400,
                                  ),
                                  title: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            '${labAllOrdersModel.data![outerIndex].orderShipping!.name}'
                                                .capitalize!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1!
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w700),
                                          ),
                                          Spacer(),
                                          Text(
                                            '${labAllOrdersModel.data![outerIndex].status}'
                                                .capitalize!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    letterSpacing: 0.5,
                                                    fontSize: 14),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      )
                                    ],
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                              '${DateFormat('dd MMM yyyy').format(DateTime.parse(labAllOrdersModel.data![outerIndex].createdAt!))}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2!
                                                  .copyWith(fontSize: 12)),
                                          Spacer(),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '\> Tap to See Details',
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.grey),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                  }),
    ));
  }
}

/// Second Tab sample collected Starts Here

class AcceptedOrders extends StatefulWidget {
  @override
  _AcceptedOrdersState createState() => _AcceptedOrdersState();
}

class _AcceptedOrdersState extends State<AcceptedOrders> {
  @override
  void initState() {
    // TODO: implement initState
    print('bilal');
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Get.find<LoaderController>().updateDataController(true);
    });
    getMethod(context, labAllOrdersService,
        {'lab_id': storageBox!.read('lab_id')}, true, getLabAllOrders);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<LoaderController>(
      init: LoaderController(),
      builder: (_) => _.dataLoader
          ? Center(
              child: CircularProgressIndicator(),
            )
          : labAllOrdersModel.status == false
              ? Center(child: Text('No Record Found'))
              : ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: labAllOrdersModel.data!.length,
                  itemBuilder: (context, outerIndex) {
                    return labAllOrdersModel.data![outerIndex].status !=
                            'sample_collected'
                        ? SizedBox()
                        : InkWell(
                            onTap: () => Get.to(LabPendingOrderDetail(
                              labOrderDetail:
                                  labAllOrdersModel.data![outerIndex],
                            )),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Divider(
                                  thickness: 6,
                                  color: Theme.of(context).backgroundColor,
                                ),
                                ListTile(
                                  leading: FadedScaleAnimation(
                                    labAllOrdersModel.data![outerIndex]
                                                .orderProduct![0].imagePath ==
                                            null
                                        ? Image.asset(
                                            'assets/labTest.png',
                                            height: 40,
                                            width: 40,
                                          )
                                        : Image.network(
                                            '$imageBaseUrl${labAllOrdersModel.data![outerIndex].orderProduct![0].imagePath}',
                                            height: 40,
                                            width: 40,
                                            fit: BoxFit.cover,
                                          ),
                                    durationInMilliseconds: 400,
                                  ),
                                  title: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            '${labAllOrdersModel.data![outerIndex].orderProduct![0].name}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1!
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w700),
                                          ),
                                          Spacer(),
                                          Text(
                                            '${labAllOrdersModel.data![outerIndex].status!.replaceAll('_', ' ').capitalize!}'
                                                .capitalize!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    letterSpacing: 0.5,
                                                    fontSize: 14),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      )
                                    ],
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                              '${DateFormat('dd MMM yyyy').format(DateTime.parse(labAllOrdersModel.data![outerIndex].createdAt!))}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2!
                                                  .copyWith(fontSize: 12)),
                                          Spacer(),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '\> Tap to See Details',
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.grey),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                  }),
    ));
  }
}

/// 3rd tab in progress
class InProgressOrders extends StatefulWidget {
  @override
  _InProgressOrdersState createState() => _InProgressOrdersState();
}

class _InProgressOrdersState extends State<InProgressOrders> {
  @override
  void initState() {
    // TODO: implement initState
    print('bilal');
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Get.find<LoaderController>().updateDataController(true);
    });
    getMethod(context, labAllOrdersService,
        {'lab_id': storageBox!.read('lab_id')}, true, getLabAllOrders);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<LoaderController>(
      init: LoaderController(),
      builder: (_) => _.dataLoader
          ? Center(
              child: CircularProgressIndicator(),
            )
          : labAllOrdersModel.status == false
              ? Center(child: Text('No Record Found'))
              : ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: labAllOrdersModel.data!.length,
                  itemBuilder: (context, outerIndex) {
                    return labAllOrdersModel.data![outerIndex].status !=
                            'in_progress'
                        ? SizedBox()
                        : InkWell(
                            onTap: () => Get.to(LabPendingOrderDetail(
                                labOrderDetail:
                                    labAllOrdersModel.data![outerIndex])),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Divider(
                                  thickness: 6,
                                  color: Theme.of(context).backgroundColor,
                                ),
                                ListTile(
                                  leading: FadedScaleAnimation(
                                    labAllOrdersModel.data![outerIndex]
                                                .orderProduct![0].imagePath ==
                                            null
                                        ? Image.asset(
                                            'assets/labTest.png',
                                            height: 40,
                                            width: 40,
                                          )
                                        : Image.network(
                                            '$imageBaseUrl${labAllOrdersModel.data![outerIndex].orderProduct![0].imagePath}',
                                            height: 40,
                                            width: 40,
                                            fit: BoxFit.cover,
                                          ),
                                    durationInMilliseconds: 400,
                                  ),
                                  title: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            '${labAllOrdersModel.data![outerIndex].orderProduct![0].name}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1!
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w700),
                                          ),
                                          Spacer(),
                                          Text(
                                            '${labAllOrdersModel.data![outerIndex].status!.replaceAll('_', ' ').capitalize!}'
                                                .capitalize!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    letterSpacing: 0.5,
                                                    fontSize: 14),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      )
                                    ],
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                              '${DateFormat('dd MMM yyyy').format(DateTime.parse(labAllOrdersModel.data![outerIndex].createdAt!))}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2!
                                                  .copyWith(fontSize: 12)),
                                          Spacer(),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '\> Tap to See Details',
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.grey),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                  }),
    ));
  }
}

/// 4th completed
///
class CompletedOrders extends StatefulWidget {
  @override
  _CompletedOrdersState createState() => _CompletedOrdersState();
}

class _CompletedOrdersState extends State<CompletedOrders> {
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Get.find<LoaderController>().updateDataController(true);
    });
    getMethod(context, labAllOrdersService,
        {'lab_id': storageBox!.read('lab_id')}, true, getLabAllOrders);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<LoaderController>(
      init: LoaderController(),
      builder: (_) => _.dataLoader
          ? Center(
              child: CircularProgressIndicator(),
            )
          : labAllOrdersModel.status == false
              ? Center(child: Text('No Record Found'))
              : ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: labAllOrdersModel.data!.length,
                  itemBuilder: (context, outerIndex) {
                    return labAllOrdersModel.data![outerIndex].status !=
                            'delivered'
                        ? SizedBox()
                        : InkWell(
                            onTap: () => Get.to(LabPendingOrderDetail(
                                labOrderDetail:
                                    labAllOrdersModel.data![outerIndex])),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Divider(
                                  thickness: 6,
                                  color: Theme.of(context).backgroundColor,
                                ),
                                ListTile(
                                  leading: FadedScaleAnimation(
                                    labAllOrdersModel.data![outerIndex]
                                                .orderProduct![0].imagePath ==
                                            null
                                        ? Image.asset(
                                            'assets/labTest.png',
                                            height: 40,
                                            width: 40,
                                          )
                                        : Image.network(
                                            '$imageBaseUrl${labAllOrdersModel.data![outerIndex].orderProduct![0].imagePath}',
                                            height: 40,
                                            width: 40,
                                            fit: BoxFit.cover,
                                          ),
                                    durationInMilliseconds: 400,
                                  ),
                                  title: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            '${labAllOrdersModel.data![outerIndex].orderProduct![0].name}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1!
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w700),
                                          ),
                                          Spacer(),
                                          Text(
                                            '${labAllOrdersModel.data![outerIndex].status!.replaceAll('_', '')}'
                                                .capitalize!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    letterSpacing: 0.5,
                                                    fontSize: 14),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      )
                                    ],
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                              '${DateFormat('dd MMM yyyy').format(DateTime.parse(labAllOrdersModel.data![outerIndex].createdAt!))}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2!
                                                  .copyWith(fontSize: 12)),
                                          Spacer(),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '\> Tap to See Details',
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.grey),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                  }),
    ));
  }
}
