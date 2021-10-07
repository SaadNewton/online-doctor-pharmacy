import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:doctoworld_seller/CheckoutOrder/order_details.dart';
import 'package:doctoworld_seller/Controllers/loading_controller.dart';
import 'package:doctoworld_seller/Data/global_data.dart';
import 'package:doctoworld_seller/DrawerItems/recent_orders.dart';
import 'package:doctoworld_seller/Repositories/order_requests_repo.dart';
import 'package:doctoworld_seller/Services/get_method_call.dart';
import 'package:doctoworld_seller/Services/service_urls.dart';
import 'package:doctoworld_seller/Storage/local_Storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NewOrders extends StatefulWidget {
  @override
  _NewOrdersState createState() => _NewOrdersState();
}

class _NewOrdersState extends State<NewOrders> {
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Get.find<LoaderController>().updateDataController(true);
    });
    getMethod(
        context,
        getRecentOrderRequestsService,
        {'pharmacy_owner_id': storageBox!.read('pharmacy_id')},
        true,
        getOrderRequestData);
    super.initState();
  }

  Future<bool> _willPopCallback() async {
    Get.off(RecentOrders(
      tabIndex: 0,
    ));
    return true; // return true if the route to be popped
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
          body: GetBuilder<LoaderController>(
        init: LoaderController(),
        builder: (_) => _.dataLoader
            ? Center(
                child: CircularProgressIndicator(),
              )
            : orderRequestsModel.status == false
                ? Center(child: Text('No Record Found'))
                : ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: orderRequestsModel.data!.data!.length,
                    itemBuilder: (context, outerIndex) {
                      return InkWell(
                        onTap: () => Get.to(OrderInfo(
                          orderDetailData:
                              orderRequestsModel.data!.data![outerIndex],
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
                                  'assets/test image.png',
                                  height: 40,
                                  width: 40,
                                ),
                                durationInMilliseconds: 400,
                              ),
                              title: Row(
                                children: [
                                  Text(
                                    '${orderRequestsModel.data!.data![outerIndex].customer!.name}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(fontWeight: FontWeight.w700),
                                  ),
                                  Spacer(),
                                  orderRequestsModel.data!.data![outerIndex]
                                              .isPrescription ==
                                          1
                                      ? SizedBox()
                                      : Text(
                                          'Amount ${orderRequestsModel.data!.data![outerIndex].order!.totalPrice}',
                                          style: TextStyle(
                                            fontSize: 12.0,
                                          ),
                                        ),
                                ],
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '${DateFormat('dd MMM yy \, hh:mm a').format(DateTime.parse(orderRequestsModel.data!.data![outerIndex].order!.createdAt!))}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2,
                                      ),
                                      Spacer(),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            '${orderRequestsModel.data!.data![outerIndex].order!.paymentMethod}',
                                            style: TextStyle(
                                              fontSize: 12.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
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
      )),
    );
  }
}
