import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:doctoworld_seller/Components/custom_button.dart';
import 'package:doctoworld_seller/Components/entry_field.dart';
import 'package:doctoworld_seller/Controllers/loading_controller.dart';
import 'package:doctoworld_seller/Locale/locale.dart';
import 'package:doctoworld_seller/Repositories/add_new_test_category_repo.dart';
import 'package:doctoworld_seller/Repositories/edit_test_category_repo.dart';
import 'package:doctoworld_seller/Services/post_method_call.dart';
import 'package:doctoworld_seller/Services/service_urls.dart';
import 'package:doctoworld_seller/Storage/local_Storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class AddNewTestCategory extends StatefulWidget {
  bool? addNew;
  String? testName;
  String? testDescription;
  String? testID;
  String? labID;

  AddNewTestCategory([
    this.addNew,
    this.testName,
    this.testDescription,
    this.testID,
    this.labID,
  ]);

  @override
  _AddNewTestCategoryState createState() => _AddNewTestCategoryState();
}

class _AddNewTestCategoryState extends State<AddNewTestCategory> {
  GlobalKey<FormState> addKey = GlobalKey();

  final TextEditingController testNameController = TextEditingController();
  final TextEditingController testDescriptionController =
      TextEditingController();

  @override
  void dispose() {
    super.dispose();
    // Clean up the controller when the widget is disposed.
    testNameController.dispose();
    testDescriptionController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Get.find<LoaderController>().updateFormController(false);
    });

    if (widget.addNew == false) {
      testNameController.text = widget.testName!;
      testDescriptionController.text = widget.testDescription!;
    }
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return GetBuilder<LoaderController>(
      init: LoaderController(),
      builder: (_) => ModalProgressHUD(
        inAsyncCall: _.formLoader,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text('Add Test Category'),
            textTheme: Theme.of(context).textTheme,
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_outlined,
                color: Colors.black,
              ),
            ),
          ),
          body: FadedSlideAnimation(
            Container(
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.all(20.0),
              child: Form(
                key: addKey,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Column(
                      children: [
                        Center(
                            child: Image.asset(
                          'assets/labTest.png',
                          width: 100,
                          height: 100,
                        )),

                        // Center(
                        //   child: GestureDetector(
                        //     onTap: () {
                        //       _showPicker(context);
                        //     },
                        //     child: Container(
                        //       color: Colors.grey[200],
                        //       child: _image != null
                        //           ? ClipRRect(
                        //               child: Image.file(
                        //                 _image!,
                        //                 width: 100,
                        //                 height: 100,
                        //                 fit: BoxFit.cover,
                        //               ),
                        //             )
                        //           : Container(
                        //               decoration: BoxDecoration(
                        //                 color: Colors.grey[200],
                        //                 borderRadius: BorderRadius.circular(50),
                        //               ),
                        //               width: 100,
                        //               height: 100,
                        //               child: Icon(
                        //                 Icons.camera_alt,
                        //                 color: Colors.grey[800],
                        //               ),
                        //             ),
                        //     ),
                        //   ),
                        // ),

                        SizedBox(height: 30),

                        /// Test Name
                        EntryField(
                          controller: testNameController,
                          prefixIcon: Icons.volunteer_activism,
                          hint: 'Test Name',
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Field is Required';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 20.0),

                        /// Description

                        EntryField(
                          controller: testDescriptionController,
                          prefixIcon: Icons.note,
                          hint: 'Description',
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Field is Required';
                            } else {
                              return null;
                            }
                          },
                        ),

                        SizedBox(height: 20.0),

                        CustomButton(
                          label: 'Add',
                          onTap: () {
                            if (addKey.currentState!.validate()) {
                              _.updateFormController(true);

                              if (widget.addNew!) {
                                postMethod(
                                    context,
                                    addNewTestCategory,
                                    {
                                      'name': testNameController.text,
                                      'discription':
                                          testDescriptionController.text,
                                      'lab_id':
                                          storageBox!.read('lab_id').toString(),
                                    },
                                    true,
                                    addLabTestCategoryRepo);
                              } else {
                                postMethod(
                                    context,
                                    editTestCategoryService,
                                    {
                                      'update_id': widget.testID,
                                      'discription':
                                          testDescriptionController.text,
                                      'lab_id': storageBox!.read('lab_id'),
                                      'name': testNameController.text,
                                    },
                                    true,
                                    editTestCategoryRepo);
                              }
                            }
                          },
                        ),
                        SizedBox(height: 10.0),
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
