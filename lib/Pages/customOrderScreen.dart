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
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

TextEditingController productNameControllerEdit = TextEditingController();
int editProductId;

TextEditingController priceControllerEdit = TextEditingController();
TextEditingController quantityControllerEdit = TextEditingController();
List items = [];

class CustomOrderScreen extends StatefulWidget {
  final AcceptedOrderDetailData orderDetailData;
  final bool fromSearchList;
  CustomOrderScreen({this.fromSearchList, this.orderDetailData});
  // final GetMedicineFromSearchModel medicineFromSearchModel;
  @override
  _CustomOrderScreenState createState() => _CustomOrderScreenState();
}

class _CustomOrderScreenState extends State<CustomOrderScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isItemTypeAvailable = '0';
    itemTypes = [];
    items = [];
    productNameControllerEdit.clear();
    priceControllerEdit.clear();
    quantityControllerEdit.clear();
  }

  GlobalKey<FormState> customOrderFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    String defaultItemTypeSelected;
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
            'Send Quotation',
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
                                              isItemTypeAvailable == '1'
                                                  ?
                                                  // DropDown

                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5.0),
                                                      child: Material(
                                                        child:
                                                            DropdownButtonFormField<
                                                                String>(
                                                          validator: (v) {
                                                            if (v == null) {
                                                              return 'Please select item type';
                                                            }
                                                            return null;
                                                          },
                                                          decoration: InputDecoration(
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              5),
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                              fillColor:
                                                                  Colors.white,
                                                              filled: true),
                                                          items: itemTypes.map(
                                                              (String
                                                                  dropDownItem) {
                                                            return DropdownMenuItem<
                                                                    String>(
                                                                value:
                                                                    dropDownItem,
                                                                child: Text(
                                                                    dropDownItem));
                                                          }).toList(),
                                                          value:
                                                              defaultItemTypeSelected =
                                                                  itemTypes[2],
                                                          onChanged: (value) {
                                                            setState(() {
                                                              if (value ==
                                                                  itemTypes[
                                                                      0]) {
                                                                defaultItemTypeSelected =
                                                                    itemTypes[
                                                                        0];
                                                                priceControllerEdit
                                                                        .text =
                                                                    itemTypePrice[
                                                                        0];
                                                              } else if (value ==
                                                                  itemTypes[
                                                                      1]) {
                                                                defaultItemTypeSelected =
                                                                    itemTypes[
                                                                        1];
                                                                priceControllerEdit
                                                                        .text =
                                                                    itemTypePrice[
                                                                        1];
                                                              } else {
                                                                defaultItemTypeSelected =
                                                                    itemTypes[
                                                                        2];
                                                                priceControllerEdit
                                                                        .text =
                                                                    itemTypePrice[
                                                                        2];
                                                              }
                                                            });
                                                          },
                                                        ),
                                                      ))
                                                  : SizedBox(),

                                              // DropDown End
                                              EntryField(
                                                onTap: () =>
                                                    Get.to(MedicineSearchScreen(
                                                  fromEditOrder: false,
                                                )),
                                                controller:
                                                    productNameControllerEdit,
                                                hint: 'Medicine Name',
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 12, 0, 0),
                                                child: EntryField(
                                                  controller:
                                                      quantityControllerEdit,
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
                                                          priceControllerEdit,
                                                      hint: 'Price',
                                                    )),
                                                    InkWell(
                                                      onTap: () {
                                                        if (customOrderFormKey
                                                            .currentState
                                                            .validate()) {
                                                          setState(() {
                                                            items.add({
                                                              'id':
                                                                  editProductId,
                                                              'sale_price': double
                                                                      .tryParse(
                                                                          priceControllerEdit
                                                                              .text) *
                                                                  int.tryParse(
                                                                      quantityControllerEdit
                                                                          .text),
                                                              'name':
                                                                  productNameControllerEdit
                                                                      .text,
                                                              'retail_price': double
                                                                      .tryParse(
                                                                          priceControllerEdit
                                                                              .text) *
                                                                  int.tryParse(
                                                                      quantityControllerEdit
                                                                          .text),
                                                              'qty':
                                                                  quantityControllerEdit
                                                                      .text
                                                            });
                                                            isItemTypeAvailable =
                                                                '0';
                                                            itemTypes = [];
                                                            itemTypePrice = [];
                                                          });
                                                          productNameControllerEdit
                                                              .clear();

                                                          priceControllerEdit
                                                              .clear();
                                                          quantityControllerEdit
                                                              .clear();
                                                          print(
                                                              '${items[items.length - 1]}');
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
                                    items.length == 0
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
                                                  'Your Cart (${items.length})',
                                                ),
                                              ),
                                              Wrap(
                                                children: List.generate(
                                                    items.length, (index) {
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
                                                            Column(
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
                                                                      '${items[index]['name']}',
                                                                    ),
                                                                    Text(
                                                                      ' x ${items[index]['qty']}',
                                                                    ),
                                                                  ],
                                                                ),
                                                                Text(
                                                                  '${items[index]['retail_price']}',
                                                                ),
                                                              ],
                                                            ),
                                                            Expanded(
                                                              child: Align(
                                                                alignment: Alignment
                                                                    .centerRight,
                                                                child: InkWell(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      items.removeAt(
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
                                                    int shippingCharges = 0;
                                                    double orderTotal = 0.0;
                                                    double subTotal = 0.0;
                                                    for (int i = 0;
                                                        i < items.length;
                                                        i++) {
                                                      subTotal += items[i]
                                                          ['retail_price'];
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
                                                    if (items.length >= 1) {
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
                                                            'products': items,
                                                            'status': 'review',
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
                                                        'Continue To Checkout',
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
