import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:doctoworld_seller/CheckoutOrder/accepted_order_details.dart';
import 'package:doctoworld_seller/Controllers/loading_controller.dart';
import 'package:doctoworld_seller/Data/global_data.dart';
import 'package:doctoworld_seller/Repositories/show_all_orders_repo.dart';
import 'package:doctoworld_seller/Services/get_method_call.dart';
import 'package:doctoworld_seller/Services/service_urls.dart';
import 'package:doctoworld_seller/Storage/local_Storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AcceptedOrders extends StatefulWidget {
  @override
  _AcceptedOrdersState createState() => _AcceptedOrdersState();
}

class _AcceptedOrdersState extends State<AcceptedOrders> {
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Get.find<LoaderController>().updateDataController(true);
    });
    getMethod(context, getAllAcceptedOrdersService,
        {'pharmacy_id': storageBox!.read('pharmacy_id')}, true, showAllOrders);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoaderController>(
      init: LoaderController(),
      builder: (_) => _.dataLoader
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              body: acceptedOrdersModel.status == false
                  ? Center(child: Text('No Record Found'))
                  : ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: acceptedOrdersModel.data!.length,
                      itemBuilder: (context, outerIndex) {
                        return InkWell(
                          onTap: () => Get.to(AcceptedOrderInfo(
                            acceptedOrderDetail:
                                acceptedOrdersModel.data![outerIndex],
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
                                    'assets/medicine-icon.png',
                                    height: 40,
                                    width: 40,
                                  ),
                                  durationInMilliseconds: 400,
                                ),
                                title: Row(
                                  children: [
                                    Text(
                                      acceptedOrdersModel.data![outerIndex]
                                                  .customer!.name ==
                                              null
                                          ? 'UnKnown'
                                          : '${acceptedOrdersModel.data![outerIndex].customer!.name}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1!
                                          .copyWith(
                                              fontWeight: FontWeight.w700),
                                    ),
                                    Spacer(),
                                    Text(
                                      '${acceptedOrdersModel.data![outerIndex].status!.replaceAll('_', ' ').capitalize!}'
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
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '${DateFormat('dd MMM yy \, hh:mm a').format(DateTime.parse(acceptedOrdersModel.data![outerIndex].createdAt!))}',
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
                                              '${acceptedOrdersModel.data![outerIndex].totalPrice}',
                                              style: TextStyle(
                                                fontSize: 12.0,
                                              ),
                                            ),
                                            Text(
                                              //payment method
                                              '${acceptedOrdersModel.data![outerIndex].paymentMethod}',
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
            ),
    );
  }
}
