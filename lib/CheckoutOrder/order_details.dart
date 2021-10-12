import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:doctoworld_seller/Components/image_viewer.dart';
import 'package:doctoworld_seller/Controllers/loading_controller.dart';
import 'package:doctoworld_seller/Controllers/model_controllers.dart';
import 'package:doctoworld_seller/Locale/locale.dart';
import 'package:doctoworld_seller/Models/order_requests_model.dart';
import 'package:doctoworld_seller/Repositories/accept_order_request_repo.dart';
import 'package:doctoworld_seller/Repositories/get_notify_token_repo.dart';
import 'package:doctoworld_seller/Services/get_method_call.dart';
import 'package:doctoworld_seller/Services/post_method_call.dart';
import 'package:doctoworld_seller/Services/service_urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class OrderInfo extends StatefulWidget {
  final OrderDetailData? orderDetailData;
  OrderInfo({this.orderDetailData});
  @override
  _OrderInfoState createState() => _OrderInfoState();
}

class _OrderInfoState extends State<OrderInfo> {
  orderDetailList(context) {
    return List.generate(
        widget.orderDetailData!.product!.length,
        (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: ListTile(
              leading: Container(
                child: FadedScaleAnimation(
                  widget.orderDetailData!.product![index].imagePath == null
                      ? Image.asset(
                          'assets/test image.png',
                          height: 40,
                          width: 40,
                        )
                      : Image.network(
                          "$imageBaseUrl${widget.orderDetailData!.product![index].imagePath}",
                          height: 40,
                          width: 40,
                        ),
                  durationInMilliseconds: 400,
                ),
              ),
              title: Text(
                "${widget.orderDetailData!.product![index].name}",
              ),
              trailing: Column(
                children: [
                  Text('Qty: ${widget.orderDetailData!.product![index].qty}'),
                  Text(
                      'Price: ${widget.orderDetailData!.product![index].salePrice}'),
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
        {'user_id': widget.orderDetailData!.customer!.id, 'role': 'customer'},
        false,
        getNotifyTokenRepo);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return GetBuilder<LoaderController>(
      builder: (loaderController) => GetBuilder<ModelControllers>(
        builder: (modelController) => ModalProgressHUD(
          inAsyncCall: loaderController.formLoader,
          child: Scaffold(
            appBar: AppBar(
              title: Text('Order Number ${widget.orderDetailData!.orderId}'),
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
            body: loaderController.dataLoader
                ? Center(child: CircularProgressIndicator())
                : FadedSlideAnimation(
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
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
                                  '${widget.orderDetailData!.customer!.name}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(fontWeight: FontWeight.w700),
                                ),
                                Spacer(),
                                Text(
                                  '${widget.orderDetailData!.order!.status}'
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
                                  '${DateFormat('dd MMM yy hh:mm a').format(DateTime.parse(widget.orderDetailData!.order!.createdAt!))}',
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                                Spacer(),
                                Text(
                                  'Amount ${widget.orderDetailData!.order!.totalPrice}',
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
                          widget.orderDetailData!.isPrescription == 1
                              ? SizedBox()
                              : Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15.0, vertical: 8),
                                  child: Text(locale.orderedItems!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .disabledColor,
                                              fontSize: 14)),
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                          ...orderDetailList(context),
                          Divider(
                            color: Theme.of(context).backgroundColor,
                            thickness: 8.0,
                          ),
                          widget.orderDetailData!.imagePath1 != null
                              ? ListTile(
                                  onTap: () {
                                    print('bilal');
                                    Get.to(ImageViewScreen(
                                      networkImage:
                                          widget.orderDetailData!.imagePath1,
                                    ));
                                  },
                                  leading: FadedScaleAnimation(
                                    Image.network(
                                      '$imageBaseUrl${widget.orderDetailData!.imagePath1}',
                                      height: 25,
                                      width: 25,
                                    ),
                                    durationInMilliseconds: 600,
                                  ),
                                  title: Text(
                                    'Front Page',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
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
                          widget.orderDetailData!.imagePath2 != null
                              ? ListTile(
                                  onTap: () {
                                    Get.to(ImageViewScreen(
                                      networkImage:
                                          widget.orderDetailData!.imagePath2,
                                    ));
                                  },
                                  leading: FadedScaleAnimation(
                                    Image.network(
                                      '$imageBaseUrl${widget.orderDetailData!.imagePath2}',
                                      height: 25,
                                      width: 25,
                                    ),
                                    durationInMilliseconds: 600,
                                  ),
                                  title: Text(
                                    'Back Page',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
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
                              widget.orderDetailData!.order!.subTotal == null
                                  ? '0.00'
                                  : '${widget.orderDetailData!.order!.subTotal}'),
                          buildBottomListTile(
                              context,
                              'Shipping Price',
                              widget.orderDetailData!.order!.shippingPrice ==
                                      null
                                  ? '0.00'
                                  : '${widget.orderDetailData!.order!.shippingPrice}'),
                          buildBottomListTile(
                              context,
                              'Total Amount',
                              widget.orderDetailData!.order!.totalPrice == null
                                  ? '0.00'
                                  : '${widget.orderDetailData!.order!.totalPrice}'),
                          buildBottomListTile(
                              context,
                              'Payment Method',
                              widget.orderDetailData!.order!.paymentMethod ==
                                      null
                                  ? '--'
                                  : '${widget.orderDetailData!.order!.paymentMethod}'),

                          // Shipping Address
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
                                  '${widget.orderDetailData!.order!.orderShipping!.phoneNumber}',
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
                                        '${widget.orderDetailData!.order!.orderShipping!.address} ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .copyWith(),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    widget.orderDetailData!.customer!.lat !=
                                                null &&
                                            widget.orderDetailData!.customer!
                                                    .long !=
                                                null
                                        ? IconButton(
                                            onPressed: () {
                                              MapsLauncher.launchCoordinates(
                                                  double.parse(widget
                                                      .orderDetailData!
                                                      .customer!
                                                      .lat!
                                                      .toString()),
                                                  double.parse(widget
                                                      .orderDetailData!
                                                      .customer!
                                                      .long!
                                                      .toString()),
                                                  'Check Location from Here');
                                            },
                                            icon: Icon(
                                              Icons.location_on,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ))
                                        : SizedBox()
                                  ],
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 80.0, vertical: 8),
                            child: OutlinedButton(
                              onPressed: () {
                                loaderController.updateFormController(true);
                                postMethod(
                                    context,
                                    acceptOrderRequestService,
                                    {
                                      'pharmacy_request_id':
                                          widget.orderDetailData!.id,
                                    },
                                    true,
                                    acceptOrderRequest);
                              },
                              child: Text(
                                "ACCEPT",
                              ),
                              style: OutlinedButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 15)),
                            ),
                          ),
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
