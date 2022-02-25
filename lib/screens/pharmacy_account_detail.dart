import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:doctoworld_seller/Components/custom_button.dart';
import 'package:doctoworld_seller/Components/entry_field.dart';
import 'package:doctoworld_seller/Controllers/loading_controller.dart';
import 'package:doctoworld_seller/DrawerItems/recent_orders.dart';
import 'package:doctoworld_seller/Locale/locale.dart';
import 'package:doctoworld_seller/Storage/local_Storage.dart';
import 'package:doctoworld_seller/screens/pharmacr_profile_wizard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class PharmacyAccountDetail extends StatefulWidget {
  final Function? changeView;
  PharmacyAccountDetail({this.changeView});

  @override
  _PharmacyAccountDetailState createState() => _PharmacyAccountDetailState();
}

class _PharmacyAccountDetailState extends State<PharmacyAccountDetail> {
  String dropdownValue = 'Bank Account';
  GlobalKey<FormState> _accountKey = GlobalKey();
  final TextEditingController _accountController = TextEditingController();
  List<String> items = ['Bank Account', 'Easy Paisa', 'Jazz Cash'];
  bool bank = true;
  bool easy = false;
  bool jazz = false;

  final slidableController = SlidableController();
  final _scrollController = ScrollController();
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return GetBuilder<LoaderController>(
      init: LoaderController(),
      builder: (loaderController) => ModalProgressHUD(
        inAsyncCall: loaderController.formLoader,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: FadedSlideAnimation(
            Container(
              height: MediaQuery.of(context).size.height,
              child: Form(
                key: _accountKey,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                          child: Column(
                            children: [
                              SizedBox(height: 20.0),

                              ///......................
                              DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 17.0, horizontal: 10.0),
                                  fillColor: Colors.grey.withOpacity(0.2),
                                  filled: true,
                                  hintStyle: TextStyle(
                                      color: Colors.black, fontSize: 17),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4))),
                                ),
                                value: dropdownValue,
                                icon: const Icon(Icons.arrow_drop_down),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValue = newValue!;

                                    if (dropdownValue == 'Bank Account') {
                                      setState(() {
                                        bank = true;
                                        easy = false;
                                        jazz = false;
                                      });
                                    } else if (dropdownValue == 'Easy Paisa') {
                                      setState(() {
                                        bank = false;
                                        easy = true;
                                        jazz = false;
                                      });
                                    } else if (dropdownValue == 'Jazz Cash') {
                                      setState(() {
                                        bank = false;
                                        easy = false;
                                        jazz = true;
                                      });
                                    } else {}
                                  });
                                },
                                items: items.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                validator: (String? value) {
                                  if (value == null) {
                                    return 'Field is Required';
                                  } else {
                                    return null;
                                  }
                                },
                              ),

                              ///..................
                              bank
                                  ? Column(
                                      children: [
                                        SizedBox(height: 20),

                                        ///...........Bank Name....................///
                                        EntryField(
                                          color: Colors.grey.withOpacity(0.2),
                                          hint: 'Bank',
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Field is Required';
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                        SizedBox(height: 20.0),

                                        ///...............Account Number................///
                                        EntryField(
                                          color: Colors.grey.withOpacity(0.2),
                                          hint: 'Account Number',
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Field is Required';
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),

                                        ///..........Cash................///

                                        SizedBox(height: 20.0),
                                      ],
                                    )
                                  : SizedBox(),
                              easy
                                  ? Column(
                                      children: [
                                        SizedBox(height: 20),

                                        ///...............Account Number................///
                                        EntryField(
                                          textInputFormatter:
                                              LengthLimitingTextInputFormatter(
                                                  11),
                                          color: Colors.grey.withOpacity(0.2),
                                          hint: 'Account Number',
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Field is Required';
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                        SizedBox(height: 20.0),
                                      ],
                                    )
                                  : SizedBox(),
                              jazz
                                  ? Column(
                                      children: [
                                        SizedBox(height: 20),

                                        ///...............................///
                                        EntryField(
                                          textInputFormatter:
                                              LengthLimitingTextInputFormatter(
                                                  11),
                                          color: Colors.grey.withOpacity(0.2),
                                          hint: 'Account Number',
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Field is Required';
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),

                                        SizedBox(height: 20.0),
                                      ],
                                    )
                                  : SizedBox(),
                              SizedBox(height: 20.0),
                              CustomButton(
                                label: 'Submit',
                                onTap: () {
                                  if (_accountKey.currentState!.validate()) {
                                    _accountController.clear();
                                    if (isProfileIsCompleted) {
                                      Get.offAll(RecentOrders(
                                        tabIndex: 0,
                                      ));
                                      storeDataLocally(
                                          'pharmacyProfileComplete', 'true');
                                      isProfileIsCompleted = false;
                                    }
                                  }
                                },
                              ),
                              SizedBox(height: 20.0),
                            ],
                          ),
                        ),
                        SizedBox(height: 80.0),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            beginOffset: Offset(0, 0.3),
            endOffset: Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
          ),
        ),
      ),
    );
  }
}
