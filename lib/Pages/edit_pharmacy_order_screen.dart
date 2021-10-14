// @dart=2.9

import 'dart:developer';

import 'package:doctoworld_seller/Components/entry_field.dart';
import 'package:doctoworld_seller/Controllers/loading_controller.dart';
import 'package:doctoworld_seller/Data/global_data.dart';
import 'package:doctoworld_seller/Models/accepted_orders_model.dart';
import 'package:doctoworld_seller/Pages/medicine_search_screen.dart';
import 'package:doctoworld_seller/Repositories/edit_order_repo.dart';
import 'package:doctoworld_seller/Services/post_method_call.dart';
import 'package:doctoworld_seller/Services/service_urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class EditPharmacyOrderScreen extends StatefulWidget {
  final AcceptedOrderDetailData orderDetailData;
  final bool fromSearchList;
  EditPharmacyOrderScreen({this.fromSearchList, this.orderDetailData});
  @override
  _EditPharmacyOrderScreenState createState() =>
      _EditPharmacyOrderScreenState();
}

class _EditPharmacyOrderScreenState extends State<EditPharmacyOrderScreen> {
  List<String> category = <String>['A', 'B', 'C'];

  GlobalKey<FormState> customOrderFormKey = GlobalKey();

  int editedIndex;
  List<Order_product> medicineList = [];
  @override
  void initState() {
    isItemTypeAvailable = '0';
    itemTypes = [];
    editedIndex = null;
    editNameControllerEdit.clear();
    editPriceControllerEdit.clear();
    editQuantityControllerEdit.clear();
    // TODO: implement initState
    medicineList = widget.orderDetailData.orderProduct;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Edit Order',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: GetBuilder<LoaderController>(
          init: LoaderController(),
          builder: (_) => ModalProgressHUD(
            inAsyncCall: _.formLoader,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * .4,
                    decoration:
                        BoxDecoration(color: Theme.of(context).backgroundColor),
                  ),
                  SafeArea(
                    child: Column(
                      children: [
                        Container(
                          height: 20,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(30)),
                                  color: Colors.white),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 30, 16, 30),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20, bottom: 16),
                                      child: Text(
                                        'MAKE OFFER',
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 9,
                                              spreadRadius: 2,
                                            )
                                          ]),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 35, 15, 35),
                                        child: Form(
                                          key: customOrderFormKey,
                                          child: Column(
                                            children: [
                                              EntryField(
                                                onTap: () =>
                                                    Get.to(MedicineSearchScreen(
                                                  fromEditOrder: true,
                                                )),
                                                controller:
                                                    editNameControllerEdit,
                                                hint: 'Medicine Name',
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 12, 0, 0),
                                                child: EntryField(
                                                  controller:
                                                      editQuantityControllerEdit,
                                                  textInputType:
                                                      TextInputType.number,
                                                  hint: 'Quantity',
                                                  validator: (String value) {
                                                    if (value.isEmpty) {
                                                      return 'Field Required';
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 12, 0, 0),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                        child: EntryField(
                                                      controller:
                                                          editPriceControllerEdit,
                                                      hint: 'Price',
                                                    )),
                                                    InkWell(
                                                      onTap: () {
                                                        if (customOrderFormKey
                                                            .currentState
                                                            .validate()) {
                                                          setState(() {
                                                            if (editedIndex ==
                                                                null) {
                                                              medicineList.add(Order_product(
                                                                  qty:
                                                                      editQuantityControllerEdit
                                                                          .text,
                                                                  name:
                                                                      editNameControllerEdit
                                                                          .text,
                                                                  salePrice:
                                                                      editPriceControllerEdit
                                                                          .text));
                                                              editNameControllerEdit
                                                                  .clear();

                                                              editPriceControllerEdit
                                                                  .clear();
                                                              editQuantityControllerEdit
                                                                  .clear();
                                                            }
                                                            medicineList[
                                                                        editedIndex]
                                                                    .qty =
                                                                editQuantityControllerEdit
                                                                    .text;
                                                            medicineList[
                                                                        editedIndex]
                                                                    .salePrice =
                                                                editPriceControllerEdit
                                                                    .text;
                                                            editedIndex = null;
                                                            editNameControllerEdit
                                                                .clear();

                                                            editPriceControllerEdit
                                                                .clear();
                                                            editQuantityControllerEdit
                                                                .clear();
                                                          });
                                                        }
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                16, 0, 0, 0),
                                                        child: Container(
                                                          height: 40,
                                                          width: 100,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor),
                                                          child: Center(
                                                            child: Text(
                                                              'Add Product',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    medicineList.length == 0
                                        ? Container()
                                        : Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 30, bottom: 16),
                                                child: Text(
                                                  'Your Cart (${medicineList.length})',
                                                ),
                                              ),
                                              Wrap(
                                                children: List.generate(
                                                    medicineList.length,
                                                    (index) {
                                                  return Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 0, 0, 10),
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color:
                                                                  Colors.grey,
                                                              blurRadius: 9,
                                                              spreadRadius: 2,
                                                            )
                                                          ]),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              '${index + 1}.',
                                                            ),
                                                            SizedBox(
                                                              width: 16,
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                setState(() {
                                                                  editedIndex =
                                                                      index;
                                                                  editNameControllerEdit
                                                                          .text =
                                                                      medicineList[
                                                                              index]
                                                                          .name;
                                                                  editQuantityControllerEdit
                                                                          .text =
                                                                      medicineList[
                                                                              index]
                                                                          .qty;
                                                                  editPriceControllerEdit
                                                                      .text = medicineList[
                                                                          index]
                                                                      .salePrice;
                                                                });
                                                              },
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                        '${medicineList[index].name}',
                                                                      ),
                                                                      Text(
                                                                        ' x ${medicineList[index].qty}',
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Text(
                                                                    '${medicineList[index].salePrice}',
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Align(
                                                                alignment: Alignment
                                                                    .centerRight,
                                                                child: InkWell(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      medicineList
                                                                          .removeAt(
                                                                              index);
                                                                    });
                                                                  },
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .delete,
                                                                      color: Colors
                                                                          .red,
                                                                      size: 25,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 15, 0, 0),
                                                child: InkWell(
                                                  onTap: () {
                                                    print(medicineList.length
                                                        .toString());
                                                    int shippingCharges = 0;
                                                    double orderTotal = 0.0;
                                                    double subTotal = 0.0;
                                                    for (int i = 0;
                                                        i < medicineList.length;
                                                        i++) {
                                                      subTotal +=
                                                          double.tryParse(
                                                              medicineList[i]
                                                                  .salePrice);
                                                      orderTotal = subTotal;
                                                    }
                                                    if (subTotal < 500) {
                                                      shippingCharges = 50;
                                                      orderTotal =
                                                          shippingCharges +
                                                              subTotal;
                                                    }
                                                    log('total ' +
                                                        orderTotal.toString());
                                                    if (medicineList.length >=
                                                        1) {
                                                      Get.find<
                                                              LoaderController>()
                                                          .updateFormController(
                                                              true);
                                                      postMethod(
                                                          context,
                                                          editOrderService,
                                                          {
                                                            'order_total':
                                                                orderTotal,
                                                            'order_id': widget
                                                                .orderDetailData
                                                                .id,
                                                            'products':
                                                                medicineList,
                                                            'status':
                                                                'in_review',
                                                            'sub_total':
                                                                subTotal,
                                                            'total_price':
                                                                orderTotal,
                                                            'shipping_price':
                                                                shippingCharges,
                                                            'tax': '0',
                                                            'discount': '0'
                                                          },
                                                          true,
                                                          editOrderRepo);
                                                    }
                                                  },
                                                  child: Container(
                                                    height: 50,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color: Theme.of(context)
                                                            .primaryColor),
                                                    child: Center(
                                                      child: Text(
                                                        'Continue',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                    SizedBox(
                                      height: 50,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
