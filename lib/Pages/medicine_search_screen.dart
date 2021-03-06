//@dart=2.9

import 'dart:developer';

import 'package:doctoworld_seller/Controllers/loading_controller.dart';
import 'package:doctoworld_seller/Data/global_data.dart';
import 'package:doctoworld_seller/Models/get_medicine_from_search_model.dart';
import 'package:doctoworld_seller/Pages/customOrderScreen.dart';
import 'package:doctoworld_seller/Repositories/get_medicine_from_search_repo.dart';
import 'package:doctoworld_seller/services/get_method_call.dart';
import 'package:doctoworld_seller/services/service_urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

TextEditingController editNameControllerEdit = TextEditingController();
int editItemsProductId;

TextEditingController editPriceControllerEdit = TextEditingController();
TextEditingController editQuantityControllerEdit = TextEditingController();

class MedicineSearchScreen extends StatefulWidget {
  final fromEditOrder;

  const MedicineSearchScreen({Key key, this.fromEditOrder}) : super(key: key);

  @override
  _MedicineSearchScreenState createState() => _MedicineSearchScreenState();
}

class _MedicineSearchScreenState extends State<MedicineSearchScreen> {
  TextEditingController searchController = TextEditingController();

  bool show = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isItemTypeAvailable = '0';
    itemTypes = [];
    itemTypePrice = [];
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
      child: GetBuilder<LoaderController>(
        init: LoaderController(),
        builder: (loaderController) => Scaffold(
          body: SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back,
                            size: 25,
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: TextFormField(
                              autofocus: true,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                              controller: searchController,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                hintText: 'Search Through 1000\'s Of Products',
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 13),
                                isDense: true,
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.1),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                  size: 20,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(
                                      color: Colors.black.withOpacity(0.2)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(
                                      color: Colors.black.withOpacity(0.2)),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(
                                      color: Colors.black.withOpacity(0.2)),
                                ),
                              ),
                              onChanged: (value) {
                                if (value.isEmpty) {
                                  medicineSearchModel =
                                      new GetMedicineFromSearchModel();
                                } else {}
                              },
                              onFieldSubmitted: (value) {
                                Get.find<LoaderController>()
                                    .updateDataController(true);
                                getMethod(
                                    context,
                                    medicineSearchService,
                                    {'name': searchController.text},
                                    true,
                                    getMedicineFromSearchRepo);
                              },
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Field Required';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  loaderController.dataLoader
                      ? Center(child: CircularProgressIndicator())
                      : medicineSearchModel.data == null
                          ? SizedBox()
                          : Expanded(
                              child: ListView(
                                children: List.generate(
                                    medicineSearchModel.data.length, (index) {
                                  return Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        15, 15, 15, 0),
                                    child: InkWell(
                                      onTap: () {
                                        if (widget.fromEditOrder) {
                                          medicineSearchModel
                                                      .data[index].isItemType ==
                                                  '1'
                                              ? isItemTypeAvailable = '1'
                                              : isItemTypeAvailable = '0';

                                          editItemsProductId =
                                              medicineSearchModel
                                                  .data[index].id;
                                          medicineSearchDetailData =
                                              medicineSearchModel.data[index];
                                          editPriceControllerEdit.text =
                                              medicineSearchModel
                                                  .data[index].salePrice;
                                          log(medicineSearchModel
                                              .data[index].salePrice
                                              .toString());
                                          editNameControllerEdit.text =
                                              medicineSearchModel
                                                  .data[index].name;
                                          editQuantityControllerEdit.text = '1';

                                          medicineSearchModel
                                                      .data[index].isItemType ==
                                                  '1'
                                              ? List.generate(
                                                  medicineSearchModel
                                                      .data[index]
                                                      .itemPrice
                                                      .length, (innerIndex) {
                                                  itemTypes.add(
                                                      medicineSearchModel
                                                          .data[index]
                                                          .itemPrice[innerIndex]
                                                          .type);
                                                })
                                              : isItemTypeAvailable = '0';

                                          medicineSearchModel
                                                      .data[index].isItemType ==
                                                  '1'
                                              ? List.generate(
                                                  medicineSearchModel
                                                      .data[index]
                                                      .itemPrice
                                                      .length, (innerIndex) {
                                                  itemTypePrice.add(
                                                      medicineSearchModel
                                                          .data[index]
                                                          .itemPrice[innerIndex]
                                                          .price);
                                                })
                                              : isItemTypeAvailable = '0';

                                          medicineSearchModel
                                                      .data[index].isItemType ==
                                                  '1'
                                              ? editPriceControllerEdit.text =
                                                  itemTypePrice[2]
                                              : isItemTypeAvailable = '0';
                                        } else {
                                          medicineSearchModel
                                                      .data[index].isItemType ==
                                                  '1'
                                              ? isItemTypeAvailable = '1'
                                              : isItemTypeAvailable = '0';

                                          editProductId = medicineSearchModel
                                              .data[index].id;
                                          medicineSearchDetailData =
                                              medicineSearchModel.data[index];
                                          priceControllerEdit.text =
                                              medicineSearchModel
                                                  .data[index].salePrice;
                                          log(medicineSearchModel
                                              .data[index].salePrice
                                              .toString());
                                          productNameControllerEdit.text =
                                              medicineSearchModel
                                                  .data[index].name;
                                          quantityControllerEdit.text = '1';

                                          medicineSearchModel
                                                      .data[index].isItemType ==
                                                  '1'
                                              ? List.generate(
                                                  medicineSearchModel
                                                      .data[index]
                                                      .itemPrice
                                                      .length, (innerIndex) {
                                                  itemTypes.add(
                                                      medicineSearchModel
                                                          .data[index]
                                                          .itemPrice[innerIndex]
                                                          .type);
                                                })
                                              : isItemTypeAvailable = '0';

                                          medicineSearchModel
                                                      .data[index].isItemType ==
                                                  '1'
                                              ? List.generate(
                                                  medicineSearchModel
                                                      .data[index]
                                                      .itemPrice
                                                      .length, (innerIndex) {
                                                  itemTypePrice.add(
                                                      medicineSearchModel
                                                          .data[index]
                                                          .itemPrice[innerIndex]
                                                          .price);
                                                })
                                              : isItemTypeAvailable = '0';

                                          medicineSearchModel
                                                      .data[index].isItemType ==
                                                  '1'
                                              ? priceControllerEdit.text =
                                                  itemTypePrice[2]
                                              : isItemTypeAvailable = '0';
                                        }

                                        Get.back();
                                      },
                                      child: Container(
                                        height: 80,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.1),
                                                  blurRadius: 9,
                                                  spreadRadius: 3,
                                                  offset: Offset(0, 4))
                                            ]),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              15, 0, 15, 0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 52,
                                                height: 52,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    border: Border.all(
                                                        color: Colors.grey
                                                            .withOpacity(0.5),
                                                        width: 0.8),
                                                    image: DecorationImage(
                                                        image: medicineSearchModel
                                                                    .data[index]
                                                                    .imagePath !=
                                                                null
                                                            ? NetworkImage(
                                                                '$imageBaseUrl${medicineSearchModel.data[index].imagePath}')
                                                            : AssetImage(
                                                                'assets/FooterIcons/ic_medicine.png',
                                                              ))),
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: 2,
                                                    ),
                                                    Text(
                                                      '${medicineSearchModel.data[index].name}',
                                                      softWrap: true,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black),
                                                    ),
                                                    SizedBox(
                                                      height: 4,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Icon(
                                                Icons.arrow_forward,
                                                color: Colors.black,
                                                size: 30,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
