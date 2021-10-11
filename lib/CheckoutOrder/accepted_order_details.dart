import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:doctoworld_seller/Components/custom_button.dart';
import 'package:doctoworld_seller/Components/image_viewer.dart';
import 'package:doctoworld_seller/Controllers/loading_controller.dart';
import 'package:doctoworld_seller/DrawerItems/recent_orders.dart';
import 'package:doctoworld_seller/Locale/locale.dart';
import 'package:doctoworld_seller/Models/accepted_orders_model.dart';
import 'package:doctoworld_seller/Pages/customOrderScreen.dart';
import 'package:doctoworld_seller/Pages/edit_pharmacy_order_screen.dart';
import 'package:doctoworld_seller/Repositories/change_lab_order_Status_repo.dart';
import 'package:doctoworld_seller/Repositories/get_notify_token_repo.dart';
import 'package:doctoworld_seller/Services/get_method_call.dart';
import 'package:doctoworld_seller/Services/post_method_call.dart';
import 'package:doctoworld_seller/Services/service_urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class AcceptedOrderInfo extends StatefulWidget {
  final AcceptedOrderDetailData? acceptedOrderDetail;
  AcceptedOrderInfo({
    this.acceptedOrderDetail,
  });
  @override
  _AcceptedOrderInfoState createState() => _AcceptedOrderInfoState();
}

class _AcceptedOrderInfoState extends State<AcceptedOrderInfo> {
  orderDetailList(
    context,
  ) {
    return List.generate(
        widget.acceptedOrderDetail!.orderProduct!.length,
        (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: ListTile(
              leading: FadedScaleAnimation(
                widget.acceptedOrderDetail!.orderProduct![index].imagePath ==
                        null
                    ? Image.asset(
                        'assets/test image.png',
                        height: 40,
                        width: 40,
                      )
                    : Image.network(
                        '$imageBaseUrl${widget.acceptedOrderDetail!.orderProduct!}',
                        height: 40,
                        width: 40,
                        fit: BoxFit.fill,
                      ),
                durationInMilliseconds: 400,
              ),
              title: Text(
                "${widget.acceptedOrderDetail!.orderProduct![index].name}",
              ),
              trailing: Column(
                children: [
                  Text(
                      'Qty: ${widget.acceptedOrderDetail!.orderProduct![index].qty}'),
                  Text(
                      'Price: ${widget.acceptedOrderDetail!.orderProduct![index].salePrice}'),
                ],
              ),
            )));
  }

  @override
  void initState() {
    // TODO: implement initState

    getMethod(
        context,
        getNotifyTokenService,
        {
          'user_id': widget.acceptedOrderDetail!.customer!.id,
          'role': 'customer'
        },
        false,
        getNotifyTokenRepo);
    super.initState();
  }

  String? buttonText(context) {
    if (widget.acceptedOrderDetail!.status == 'accepted') {
      return 'Change to Picked';
    } else if (widget.acceptedOrderDetail!.status == 'picked') {
      return 'Change to Delivered';
    } else {}
  }

  String? statusReference(context) {
    if (widget.acceptedOrderDetail!.status == 'accepted') {
      return 'picked';
    } else if (widget.acceptedOrderDetail!.status == 'picked') {
      return 'delivered';
    } else {}
  }

  Future<bool> _willPopCallback() async {
    Get.off(RecentOrders(
      tabIndex: 1,
    ));
    return true; // return true if the route to be popped
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return WillPopScope(
      onWillPop: () async {
        return _willPopCallback();
      },
      child: GetBuilder<LoaderController>(
        builder: (loaderController) => ModalProgressHUD(
          inAsyncCall: loaderController.formLoader,
          child: Scaffold(
            appBar: AppBar(
              title: Text('Order Number ${widget.acceptedOrderDetail!.id}'),
              textTheme: Theme.of(context).textTheme,
              centerTitle: true,
              actions: [
                IconButton(
                    icon: Icon(
                      Icons.more_vert,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {})
              ],
            ),
            body: FadedSlideAnimation(
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
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
                            widget.acceptedOrderDetail!.customer!.name == null
                                ? 'UnKnown'
                                : '${widget.acceptedOrderDetail!.customer!.name}',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          Spacer(),
                          Text(
                            "${widget.acceptedOrderDetail!.status!.replaceAll('_', ' ').capitalize!}"
                                .capitalize!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    color: Color(0xffD6AB33),
                                    letterSpacing: 0.5,
                                    fontSize: 14),
                          ),
                        ],
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            '${DateFormat('dd MMM yy hh:mm a').format(DateTime.parse(widget.acceptedOrderDetail!.createdAt!))}',
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          Spacer(),
                          widget.acceptedOrderDetail!.isPrescription == 1
                              ? SizedBox()
                              : Text(
                                  'Amount ${widget.acceptedOrderDetail!.totalPrice}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(fontSize: 13),
                                ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Theme.of(context).backgroundColor,
                      thickness: 8.0,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                      child: Text(locale.orderedItems!,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(
                                  color: Theme.of(context).disabledColor,
                                  fontSize: 14)),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    ...orderDetailList(
                      context,
                    ),
                    Divider(
                      color: Theme.of(context).backgroundColor,
                      thickness: 8.0,
                    ),
                    widget.acceptedOrderDetail!.imagePath1 != null
                        ? ListTile(
                            onTap: () {
                              print('bilal');
                              Get.to(ImageViewScreen(
                                networkImage:
                                    widget.acceptedOrderDetail!.imagePath1,
                              ));
                            },
                            leading: FadedScaleAnimation(
                              Image.network(
                                '$imageBaseUrl${widget.acceptedOrderDetail!.imagePath1}',
                                height: 25,
                                width: 25,
                              ),
                              durationInMilliseconds: 600,
                            ),
                            title: Text(
                              'Front Page',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            trailing: FadedScaleAnimation(
                              Icon(
                                Icons.remove_red_eye,
                                color: Theme.of(context).primaryColor,
                              ),
                              durationInMilliseconds: 600,
                            ),
                          )
                        : SizedBox(),
                    widget.acceptedOrderDetail!.imagePath2 != null
                        ? ListTile(
                            onTap: () {
                              Get.to(ImageViewScreen(
                                networkImage:
                                    widget.acceptedOrderDetail!.imagePath2,
                              ));
                            },
                            leading: FadedScaleAnimation(
                              Image.network(
                                '$imageBaseUrl${widget.acceptedOrderDetail!.imagePath2}',
                                height: 25,
                                width: 25,
                              ),
                              durationInMilliseconds: 600,
                            ),
                            title: Text(
                              'Back Page',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            trailing: FadedScaleAnimation(
                              Icon(
                                Icons.remove_red_eye,
                                color: Theme.of(context).primaryColor,
                              ),
                              durationInMilliseconds: 600,
                            ),
                          )
                        : SizedBox(),
                    buildBottomListTile(
                        context,
                        'Sub Total',
                        widget.acceptedOrderDetail!.subTotal == null
                            ? '0.00'
                            : '${widget.acceptedOrderDetail!.subTotal}'),
                    buildBottomListTile(
                        context,
                        'Shipping Price',
                        widget.acceptedOrderDetail!.shippingPrice == null
                            ? '0.00'
                            : '${widget.acceptedOrderDetail!.shippingPrice}'),
                    buildBottomListTile(
                        context,
                        'Total Amount',
                        widget.acceptedOrderDetail!.totalPrice == null
                            ? '0.00'
                            : '${widget.acceptedOrderDetail!.totalPrice}'),
                    buildBottomListTile(
                        context,
                        'Payment Method',
                        widget.acceptedOrderDetail!.paymentMethod == null
                            ? '--'
                            : '${widget.acceptedOrderDetail!.paymentMethod}'),
                    Divider(
                      color: Theme.of(context).backgroundColor,
                      thickness: 8.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16.0, top: 8, bottom: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Contact Number',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${widget.acceptedOrderDetail!.orderShipping!.phoneNumber}',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Shipping Address',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '${widget.acceptedOrderDetail!.orderShipping!.address}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              widget.acceptedOrderDetail!.customer!.lat !=
                                          null &&
                                      widget.acceptedOrderDetail!.customer!
                                              .long !=
                                          null
                                  ? IconButton(
                                      onPressed: () {
                                        MapsLauncher.launchCoordinates(
                                            double.parse(widget
                                                .acceptedOrderDetail!
                                                .customer!
                                                .lat!
                                                .toString()),
                                            double.parse(widget
                                                .acceptedOrderDetail!
                                                .customer!
                                                .long!
                                                .toString()),
                                            'Check Location from Here');
                                      },
                                      icon: Icon(
                                        Icons.location_on,
                                        color: Theme.of(context).primaryColor,
                                      ))
                                  : SizedBox()
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Current status of this Order',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              widget.acceptedOrderDetail!.status ==
                                          'accepted' ||
                                      widget.acceptedOrderDetail!.status ==
                                          'picked' ||
                                      widget.acceptedOrderDetail!.status ==
                                          'delivered'
                                  ? Icon(
                                      Icons.check_circle,
                                      color: Theme.of(context).primaryColor,
                                    )
                                  : Icon(
                                      Icons.check_circle,
                                      color: Colors.grey,
                                    ),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Accepted')
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              widget.acceptedOrderDetail!.status == 'picked' ||
                                      widget.acceptedOrderDetail!.status ==
                                          'delivered'
                                  ? Icon(
                                      Icons.check_circle,
                                      color: Theme.of(context).primaryColor,
                                    )
                                  : Icon(
                                      Icons.check_circle,
                                      color: Colors.grey,
                                    ),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Picked')
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              widget.acceptedOrderDetail!.status == 'delivered'
                                  ? Icon(
                                      Icons.check_circle,
                                      color: Theme.of(context).primaryColor,
                                    )
                                  : Icon(
                                      Icons.check_circle,
                                      color: Colors.grey,
                                    ),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Delivered')
                            ],
                          )
                        ], //<Widget>[]
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    widget.acceptedOrderDetail!.status == 'delivered' ||
                            widget.acceptedOrderDetail!.status == 'rejected'
                        ? SizedBox()
                        : Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 80.0, vertical: 8.0),
                            child: CustomButton(
                              label:
                                  widget.acceptedOrderDetail!.isPrescription ==
                                          1
                                      ? 'Send Quotation'
                                      : ' ✎  EDIT',
                              onTap: () {
                                widget.acceptedOrderDetail!.isPrescription == 1
                                    ? Get.to(CustomOrderScreen(
                                        orderDetailData:
                                            widget.acceptedOrderDetail!,
                                        fromSearchList: false,
                                      ))
                                    : Get.to(EditPharmacyOrderScreen(
                                        orderDetailData:
                                            widget.acceptedOrderDetail!,
                                        fromSearchList: false,
                                      ));
                              },
                            ),
                          ),
                    widget.acceptedOrderDetail!.status == 'delivered' ||
                            widget.acceptedOrderDetail!.status == 'in_review' ||
                            widget.acceptedOrderDetail!.status == 'rejected'
                        ? SizedBox()
                        : Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 80.0, vertical: 8.0),
                            child: CustomButton(
                              label: buttonText(context),
                              onTap: () {
                                loaderController.updateFormController(true);
                                postMethod(
                                    context,
                                    changeOrderStatusService,
                                    {
                                      'order_id':
                                          '${widget.acceptedOrderDetail!.id}',
                                      'status': statusReference(context),
                                      // 'status': statusReference(
                                      //     context, modelController),
                                    },
                                    true,
                                    changeOrderStatusRepo);
                              },
                            ),
                          ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
              beginOffset: Offset(0, 0.3),
              endOffset: Offset(0, 0),
              slideCurve: Curves.linearToEaseOut,
            ),
          ),
        ),
      ),
    );
  }

  Padding buildBottomListTile(BuildContext context, String text, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6),
      child: FadedSlideAnimation(
        Row(
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  fontWeight:
                      text != AppLocalizations.of(context)!.amountVia! + ' COD'
                          ? FontWeight.w400
                          : FontWeight.w500),
            ),
            Spacer(),
            Text(
              price,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  fontSize:
                      text != AppLocalizations.of(context)!.amountVia! + ' COD'
                          ? 16
                          : 18),
            ),
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
