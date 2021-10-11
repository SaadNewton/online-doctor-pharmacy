import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:doctoworld_seller/Components/custom_button.dart';
import 'package:doctoworld_seller/Controllers/loading_controller.dart';
import 'package:doctoworld_seller/Controllers/model_controllers.dart';
import 'package:doctoworld_seller/Locale/locale.dart';
import 'package:doctoworld_seller/Models/lab_all_orders_model.dart';
import 'package:doctoworld_seller/Repositories/change_lab_order_Status_repo.dart';
import 'package:doctoworld_seller/Repositories/get_notify_token_repo.dart';
import 'package:doctoworld_seller/Repositories/lab_all_orders_repo.dart';
import 'package:doctoworld_seller/Services/get_method_call.dart';
import 'package:doctoworld_seller/Services/post_method_call.dart';
import 'package:doctoworld_seller/Services/service_urls.dart';
import 'package:doctoworld_seller/Storage/local_Storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

String? orderStatusChanger;

class LabPendingOrderDetail extends StatefulWidget {
  final LabOrderDetail? labOrderDetail;
  LabPendingOrderDetail({this.labOrderDetail});
  @override
  _LabPendingOrderDetailState createState() => _LabPendingOrderDetailState();
}

class _LabPendingOrderDetailState extends State<LabPendingOrderDetail> {
  orderDetailList(context, modelController) {
    return List.generate(
        widget.labOrderDetail!.orderProduct!.length,
        (index) => Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: ListTile(
                leading: FadedScaleAnimation(
                  widget.labOrderDetail!.orderProduct![index].imagePath == null
                      ? Image.asset(
                          'assets/labTest.png',
                          height: 40,
                          width: 40,
                        )
                      : Image.network(
                          '$imageBaseUrl${widget.labOrderDetail!.orderProduct![index].imagePath}',
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                        ),
                  durationInMilliseconds: 400,
                ),
                title: Row(
                  children: [
                    Text(
                      '${widget.labOrderDetail!.orderProduct![index].name}',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                    Spacer(),
                  ],
                ),
                subtitle: Row(
                  children: [
                    Text(
                      '${DateFormat('dd MMM yy hh:mm a').format(DateTime.parse(widget.labOrderDetail!.createdAt!))}',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    Spacer(),
                    Text(
                      'Amount ${widget.labOrderDetail!.orderProduct![index].salePrice}',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(fontSize: 13),
                    ),
                  ],
                ),
              ),
            ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Get.find<LoaderController>().updateDataController(true);
    });
    getMethod(
        context,
        getNotifyTokenService,
        {'user_id': widget.labOrderDetail!.customerId, 'role': 'customer'},
        false,
        getNotifyTokenRepo);
    getMethod(context, labAllOrdersService,
        {'lab_id': storageBox!.read('lab_id')}, true, getLabAllOrders);
  }

  String? buttonText(context, modelController) {
    if (widget.labOrderDetail!.status == 'pending') {
      return 'Change to Sample Collected';
    } else if (widget.labOrderDetail!.status == 'sample_collected') {
      return 'Change to In Progress';
    } else if (widget.labOrderDetail!.status == 'in_progress') {
      return 'Change to Delivered ';
    } else {
      return 'Nothing to do';
    }
  }

  String? statusReference(context) {
    if (widget.labOrderDetail!.status == 'pending') {
      orderStatusChanger = 'sample_collected';
      return 'sample_collected';
    } else if (widget.labOrderDetail!.status == 'sample_collected') {
      orderStatusChanger = 'in_progress';
      return 'in_progress';
    } else if (widget.labOrderDetail!.status == 'in_progress') {
      orderStatusChanger = 'delivered';
      return 'delivered';
    } else {}
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
              title: Text('Order Number ${widget.labOrderDetail!.id}'),
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
                          ...orderDetailList(context, modelController),

                          Divider(
                            color: Theme.of(context).backgroundColor,
                            thickness: 8.0,
                          ),
                          buildBottomListTile(context, 'Sub Total',
                              '${widget.labOrderDetail!.subTotal}'),
                          buildBottomListTile(context, 'Shipping Price',
                              '${widget.labOrderDetail!.shippingPrice}'),
                          buildBottomListTile(context, 'Total Amount',
                              '${widget.labOrderDetail!.totalPrice}'),
                          buildBottomListTile(context, 'Payment Method',
                              '${widget.labOrderDetail!.paymentMethod}'),
                          SizedBox(
                            height: 20,
                          ),
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
                                  'Customer Name',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${widget.labOrderDetail!.orderShipping!.name}'
                                      .capitalize!,
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
                                Text(
                                  '${widget.labOrderDetail!.orderShipping!.address}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
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
                                  '${widget.labOrderDetail!.orderShipping!.phoneNumber}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(),
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
                                    widget.labOrderDetail!.status ==
                                                'sample_collected' ||
                                            widget.labOrderDetail!.status ==
                                                'in_progress' ||
                                            widget.labOrderDetail!.status ==
                                                'delivered'
                                        ? Icon(
                                            Icons.check_circle,
                                            color:
                                                Theme.of(context).primaryColor,
                                          )
                                        : Icon(
                                            Icons.check_circle,
                                            color: Colors.grey,
                                          ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('Sample Collected')
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    widget.labOrderDetail!.status ==
                                                'in_progress' ||
                                            widget.labOrderDetail!.status ==
                                                'delivered'
                                        ? Icon(
                                            Icons.check_circle,
                                            color:
                                                Theme.of(context).primaryColor,
                                          )
                                        : Icon(
                                            Icons.check_circle,
                                            color: Colors.grey,
                                          ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('In Progress')
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    widget.labOrderDetail!.status == 'delivered'
                                        ? Icon(
                                            Icons.check_circle,
                                            color:
                                                Theme.of(context).primaryColor,
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
                          ), //Row
                          widget.labOrderDetail!.status == 'delivered'
                              ? SizedBox()
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 80.0, vertical: 8.0),
                                  child: CustomButton(
                                    label: buttonText(context, modelController),
                                    onTap: () {
                                      loaderController
                                          .updateFormController(true);
                                      postMethod(
                                          context,
                                          changeOrderStatusService,
                                          {
                                            'order_id':
                                                '${widget.labOrderDetail!.id}',
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
