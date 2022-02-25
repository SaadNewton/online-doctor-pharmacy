import 'dart:developer';
import 'dart:io';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:dio/dio.dart' as dio_instance;
import 'package:doctoworld_seller/Components/custom_button.dart';
import 'package:doctoworld_seller/Components/entry_field.dart';
import 'package:doctoworld_seller/Controllers/loading_controller.dart';
import 'package:doctoworld_seller/Locale/locale.dart';
import 'package:doctoworld_seller/Models/tests_under_test_category.dart';
import 'package:doctoworld_seller/Services/service_urls.dart';
import 'package:doctoworld_seller/Storage/local_Storage.dart';
import 'package:doctoworld_seller/lab_owner/tests_under_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddNewLabTest extends StatefulWidget {
  bool? addNew;
  TestsByTestCategoryModelData? model;
  String? testLabID;
  String? testCategoryID;
  String? testID;

  bool? imageUploadChecker = false;

  AddNewLabTest(
      {this.addNew,
      this.model,
      this.testCategoryID,
      this.testLabID,
      this.testID});

  @override
  _AddNewLabTestState createState() => _AddNewLabTestState();
}

class _AddNewLabTestState extends State<AddNewLabTest> {
  GlobalKey<FormState> addLabTestKey = GlobalKey();

  final TextEditingController nameTestController = TextEditingController();
  final TextEditingController priceTestController = TextEditingController();
  final TextEditingController estimateTimeController = TextEditingController();
  final TextEditingController descriptionTestController =
      TextEditingController();

  String? _chosenValue;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Get.find<LoaderController>().updateFormController(false);
    });

    if (widget.addNew == false) {
      nameTestController.text = widget.model!.name!;
      priceTestController.text = widget.model!.price!;
      estimateTimeController.text = widget.model!.estTime!;
      descriptionTestController.text = widget.model!.description!;
      _chosenValue = widget.model!.isAvailableForHome! == 1 ? 'Yes' : 'No';

      // _chosenValue = widget.availableForHome;
    }
  }

  File? _image;
  ImagePicker _imagePicker = ImagePicker();
  _imgFromCamera() async {
    final image = await _imagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = File(image!.path);
    });
  }

  _imgFromGallery() async {
    final image = await _imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = File(image!.path);
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return GetBuilder<LoaderController>(
        builder: (loaderController) => ModalProgressHUD(
              inAsyncCall: loaderController.formLoader,
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                appBar: AppBar(
                  title: Text(widget.addNew == false
                      ? 'Edit Lab Test'
                      : 'Add Lab Test'),
                  textTheme: Theme.of(context).textTheme,
                  centerTitle: true,
                ),
                body: FadedSlideAnimation(
                  Container(
                    height: MediaQuery.of(context).size.height,
                    padding: EdgeInsets.all(20.0),
                    child: Form(
                      key: addLabTestKey,
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Column(
                            children: [
                              Center(
                                child: GestureDetector(
                                  onTap: () {
                                    _showPicker(context);
                                  },
                                  child: Container(
                                    color: Colors.grey[200],
                                    child: widget.addNew == false
                                        ? ClipRRect(
                                            child: Image.network(
                                              '$imageBaseUrl${widget.model!.imagePath}',
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : _image != null
                                            ? ClipRRect(
                                                child: Image.file(
                                                  _image!,
                                                  width: 100,
                                                  height: 100,
                                                  fit: BoxFit.cover,
                                                ),
                                              )
                                            : Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.grey[200],
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                ),
                                                width: 100,
                                                height: 100,
                                                child: Icon(
                                                  Icons.camera_alt,
                                                  color: Colors.grey[800],
                                                ),
                                              ),
                                  ),
                                ),
                              ),
                              widget.imageUploadChecker!
                                  ? Text(
                                      'Image is Required',
                                      style: TextStyle(color: Colors.red),
                                    )
                                  : Container(),
                              SizedBox(height: 30),

                              /// Test Name
                              EntryField(
                                textInputType: TextInputType.text,
                                controller: nameTestController,
                                prefixIcon: Icons.merge_type_rounded,
                                hint: 'Name',
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Field is Required';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              SizedBox(height: 20.0),

                              /// Price
                              EntryField(
                                textInputType: TextInputType.number,
                                controller: priceTestController,
                                prefixIcon: Icons.price_change_outlined,
                                hint: 'Price',
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Field is Required';
                                  } else if (value.length >= 10) {
                                    return 'Enter Valid Number';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              SizedBox(height: 20.0),

                              /// Available for home Dropdown
                              ///
                              ///

                              Container(
                                color: Theme.of(context).backgroundColor,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 6),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            focusColor: Colors.white,
                                            isExpanded: true,
                                            elevation: 1,
                                            style: TextStyle(fontSize: 15),
                                            iconEnabledColor: Colors.black,
                                            items: <String>[
                                              'Yes',
                                              'No',
                                            ].map<DropdownMenuItem<String>>(
                                                (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(
                                                  value,
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              );
                                            }).toList(),
                                            hint: Text(
                                              "Is it available for Home",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                              ),
                                            ),
                                            value: _chosenValue,
                                            onChanged: (String? value) {
                                              setState(() {
                                                _chosenValue = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              SizedBox(height: 20.0),

                              /// Estimated Time

                              EntryField(
                                textInputType: TextInputType.number,
                                controller: estimateTimeController,
                                prefixIcon: Icons.access_time,
                                hint: 'Estimated Time In Hours',
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
                                textInputType: TextInputType.text,
                                controller: descriptionTestController,
                                prefixIcon: Icons.note_outlined,
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
                                  label: widget.addNew == false
                                      ? 'Update'
                                      : 'Submit',
                                  onTap: () {
                                    print('update button clicked');
                                    if (addLabTestKey.currentState!
                                        .validate()) {
                                      loaderController
                                          .updateFormController(true);
                                      // setState(() {
                                      //   // widget.imageUploadChecker = false;
                                      // });
                                      // false    _.updateFormController(true);
                                      //
                                      if (widget.addNew! && _image != null) {
                                        addNew(_image!);
                                      } else {
                                        if (_image != null) {
                                          updateTest(_image!);
                                        } else {
                                          updateTest(null);
                                        }
                                      }
                                    } else {}
                                  }),
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
            ));
  }

  addNew(File file) async {
    String fileName = file.path.split('/').last;
    dio_instance.FormData formData =
        dio_instance.FormData.fromMap(<String, dynamic>{
      'lab_id': storageBox!.read('lab_id'),
      'test_category_id': widget.testCategoryID,
      'name': nameTestController.text,
      'price': priceTestController.text,
      'est_time': estimateTimeController.text,
      'is_available_for_home': _chosenValue == 'Yes' ? '1' : '0',
      'description': descriptionTestController.text,
      'image': await dio_instance.MultipartFile.fromFile(
        file.path,
        filename: fileName,
        contentType: new MediaType('image', 'jpeg'), //important
      )
    });
    dio_instance.Dio dio = dio_instance.Dio();
    dio_instance.Response<dynamic> response;
    try {
      response =
          await dio.post(addNewTestUnderTestCategoryService, data: formData);
      log('postStatusCode---->> ${response.statusCode}');
      log('postResponse---->> ${response.data}');
      if (response.statusCode.toString() == '200') {
        Get.find<LoaderController>().updateFormController(false);
        Get.off(TestsUnderTestCategory(
          testCatID: widget.testCategoryID,
        ));
        _image = null;
      }
    } on dio_instance.DioError catch (e) {
      Get.find<LoaderController>().updateFormController(false);
      log('putResponseError---->> ${e}');
    }
  }

  updateTest(file) async {
    print('test is being updated');
    String? fileName;
    dio_instance.FormData? formData;
    if (file != null) {
      fileName = file.path.split('/').last;
      formData = dio_instance.FormData.fromMap(<String, dynamic>{
        'update_id': widget.model!.id,
        'lab_id': storageBox!.read('lab_id'),
        'test_category_id': widget.testCategoryID,
        'name': nameTestController.text,
        'price': priceTestController.text,
        'est_time': estimateTimeController.text,
        'is_available_for_home': _chosenValue == 'Yes' ? '1' : '0',
        'description': descriptionTestController.text,
        'image': await dio_instance.MultipartFile.fromFile(
          file.path,
          filename: fileName,
          contentType: new MediaType('image', 'jpeg'), //important
        )
      });
    }
    dio_instance.Dio dio = dio_instance.Dio();
    dio_instance.Response<dynamic> response;
    try {
      response = await dio.post(updateTestUnderTestCategoryService,
          data: file == null
              ? {
                  'update_id': widget.model!.id,
                  'lab_id': storageBox!.read('lab_id'),
                  'test_category_id': widget.testCategoryID,
                  'name': nameTestController.text,
                  'price': priceTestController.text,
                  'est_time': estimateTimeController.text,
                  'is_available_for_home': _chosenValue == 'Yes' ? '1' : '0',
                  'description': descriptionTestController.text
                }
              : formData);
      log('postStatusCode---->> ${response.statusCode}');
      log('postResponse---->> ${response.data}');
      if (response.statusCode.toString() == '200') {
        Get.off(TestsUnderTestCategory(
          testCatID: widget.testCategoryID,
        ));

        Get.find<LoaderController>().updateFormController(false);

        _image = null;
      }
    } on dio_instance.DioError catch (e) {
      Get.find<LoaderController>().updateFormController(false);
      log('putResponseError---->> ${e}');
    }
  }
}
