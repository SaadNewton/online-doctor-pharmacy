import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:dio/dio.dart' as dio_instance;
import 'package:doctoworld_seller/Components/custom_button.dart';
import 'package:doctoworld_seller/Components/entry_field.dart';
import 'package:doctoworld_seller/Controllers/loading_controller.dart';
import 'package:doctoworld_seller/Controllers/model_controllers.dart';
import 'package:doctoworld_seller/Data/global_data.dart';
import 'package:doctoworld_seller/Repositories/get_user_detail_info.dart';
import 'package:doctoworld_seller/Services/service_urls.dart';
import 'package:doctoworld_seller/Storage/local_Storage.dart';
import 'package:doctoworld_seller/UI/login_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class EditDetails extends StatefulWidget {
  bool editLabDetails;

  EditDetails({required this.editLabDetails});

  @override
  _EditDetailsState createState() => _EditDetailsState();
}

class _EditDetailsState extends State<EditDetails> {
  TextEditingController pharmacyNameController = TextEditingController();
  TextEditingController ownerNameController = TextEditingController();
  TextEditingController ownerPhoneController = TextEditingController();
  TextEditingController contactNameController = TextEditingController();
  TextEditingController contactPhoneController = TextEditingController();
  TextEditingController cityNameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController countryNameController = TextEditingController();

  var currentPosition;
  var latitude;
  var longitude;
  var currentAddress;

  @override
  void initState() {
    // TODO: implement initState

    getUserDetailRepo();
    if (userDetailModel != null) {
      pharmacyNameController.text = userDetailModel!.data!.name;
      ownerNameController.text = userDetailModel!.data!.ownerName!;
      ownerPhoneController.text = userDetailModel!.data!.ownerPhone!;
      contactNameController.text = userDetailModel!.data!.contactName!;
      contactPhoneController.text = userDetailModel!.data!.contactPhone!;
      cityNameController.text = userDetailModel!.data!.city!;
      locationController.text = userDetailModel!.data!.address!;
      latitude = userDetailModel!.data!.lat!;
      longitude = userDetailModel!.data!.long!;
    }

    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Get.find<LoaderController>().updateFormController(false);
    });
  }

  GlobalKey<FormState> detailKey = GlobalKey();

  final ImagePicker _picker = ImagePicker();
  File? _image;
  bool _imageChecker = false;

  Future getImage() async {
    final photo = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (photo != null) {
        _image = File(photo.path);
      } else {
        print('No image selected.');
      }
    });
  }

  final slidableController = SlidableController();
  final _scrollController = ScrollController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoaderController>(
      builder: (loaderController) => GetBuilder<ModelControllers>(
        builder: (modelController) => Scaffold(
          resizeToAvoidBottomInset: false,
          body: FadedSlideAnimation(
            ModalProgressHUD(
              inAsyncCall: loaderController.formLoader,
              child: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: Text(
                    'Edit Profile',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                body: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Form(
                    key: detailKey,
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                              child: Column(
                                children: [
                                  ///............. image.............///
                                  _image == null || userDetailModel != null
                                      ? InkWell(
                                          onTap: () {
                                            getImage();
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.grey
                                                    .withOpacity(0.2),
                                                shape: BoxShape.rectangle),
                                            height: 150,
                                            width: 150,
                                            child: ClipRRect(
                                              child: Image.network(
                                                '$imageBaseUrl${userDetailModel!.data!.imagePath}',
                                                width: 100,
                                                height: 100,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        )
                                      : InkWell(
                                          onTap: () {
                                            getImage();
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.grey
                                                    .withOpacity(0.2),
                                                shape: BoxShape.rectangle),
                                            height: 150,
                                            width: 150,
                                            child: ClipRRect(
                                                // ,
                                                child: Image.file(
                                              _image!,
                                              fit: BoxFit.cover,
                                            )),
                                          ),
                                        ),
                                  _imageChecker
                                      ? Text(
                                          'Image Required',
                                          style: TextStyle(
                                              fontSize: 11, color: Colors.red),
                                        )
                                      : SizedBox(),
                                  SizedBox(height: 20),

                                  ///...........Pharmacy Name....................///
                                  EntryField(
                                    textInputFormatter:
                                        FilteringTextInputFormatter.allow(
                                            RegExp("[a-zA-Z ]")),
                                    controller: pharmacyNameController,
                                    color: Colors.grey.withOpacity(0.2),
                                    hint: 'Pharmacy Name',
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Field is Required';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  SizedBox(height: 20.0),

                                  ///...............Owner Name................///
                                  EntryField(
                                    textInputFormatter:
                                        FilteringTextInputFormatter.allow(
                                            RegExp("[a-zA-Z ]")),
                                    controller: ownerNameController,
                                    color: Colors.grey.withOpacity(0.2),
                                    hint: 'Owner Name',
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Field is Required';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  SizedBox(height: 20.0),

                                  ///..........Owner Phone................///

                                  EntryField(
                                    textInputFormatter:
                                        LengthLimitingTextInputFormatter(11),
                                    textInputType: TextInputType.phone,
                                    controller: ownerPhoneController,
                                    color: Colors.grey.withOpacity(0.2),
                                    hint: 'Owner Phone',
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Field is Required';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  SizedBox(height: 20.0),

                                  ///..........Contact Name................///

                                  EntryField(
                                    textInputFormatter:
                                        FilteringTextInputFormatter.allow(
                                            RegExp("[a-zA-Z ]")),
                                    controller: contactNameController,
                                    color: Colors.grey.withOpacity(0.2),
                                    hint: 'Delivery Boy Name',
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Field is Required';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  SizedBox(height: 20.0),

                                  ///..........Contact Phone................///

                                  EntryField(
                                    textInputFormatter:
                                        LengthLimitingTextInputFormatter(11),
                                    textInputType: TextInputType.phone,
                                    controller: contactPhoneController,
                                    color: Colors.grey.withOpacity(0.2),
                                    hint: 'Delivery Boy Phone',
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Field is Required';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  SizedBox(height: 20.0),

                                  ///..........City................///

                                  EntryField(
                                    controller: cityNameController,
                                    color: Colors.grey.withOpacity(0.2),
                                    hint: 'City',
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Field is Required';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  SizedBox(height: 20.0),

                                  ///.........Location...............///
                                  TextFormField(
                                    controller: locationController,
                                    decoration: InputDecoration(
                                      suffixIcon: InkWell(
                                        child: Icon(
                                          Icons.add_location,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        onTap: () {
                                          getCurrentLocation(context);
                                        },
                                      ),
                                      hintText: 'Location',
                                      filled: true,
                                      fillColor: Colors.grey.withOpacity(0.2),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Field is Required';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  SizedBox(height: 20.0),
                                  CustomButton(
                                    label: 'Submit',
                                    onTap: () {
                                      if (detailKey.currentState!.validate()) {
                                        loaderController
                                            .updateFormController(true);

                                        if (widget.editLabDetails) {
                                          editLabDetails();
                                        } else {
                                          editPharmacyDetails();
                                        }
                                      }
                                    },
                                  ),
                                  SizedBox(height: 20.0),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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

  getCurrentLocation(BuildContext context) {
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        currentPosition = position;
        longitude = currentPosition.longitude;
        latitude = currentPosition.latitude;

        print("longitude : $longitude");
        print("latitude : $latitude");
        print("address : $currentPosition");
      });

      getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  getAddressFromLatLng() async {
    try {
      // var currentPosition;
      List<Placemark> p = await GeocodingPlatform.instance
          .placemarkFromCoordinates(
              currentPosition.latitude, currentPosition.longitude);
      Placemark place = p[0];
      setState(() {
        currentAddress =
            '${place.name}, ${place.subAdministrativeArea}, ${place.administrativeArea}, ${place.country}';

        print(currentAddress + ' yes');
        print(place.administrativeArea.toString());
        print(place.subAdministrativeArea.toString());
        print(place.thoroughfare.toString());
        print(place.toJson().toString());
        locationController.text = place.name.toString();
      });
    } catch (e) {
      print(e);
    }
  }

  editPharmacyDetails([File? file]) async {
    print(storageBox!.read('pharmacy_id'));
    dio_instance.FormData formData =
        dio_instance.FormData.fromMap(<String, dynamic>{
      'update_id': storageBox!.read('pharmacy_id'),
      'name': pharmacyNameController.text,
      'owner_name': ownerNameController.text,
      'owner_phone': ownerPhoneController.text,
      'contact_name': contactNameController.text,
      'contact_phone': contactPhoneController.text,
      'country': 'Pakistan',
      'city': cityNameController.text,
      'address': locationController.text,
      'lat': latitude,
      'long': longitude,
    });
    dio_instance.Dio dio = dio_instance.Dio();
    dio_instance.Response<dynamic> response;
    try {
      response =
          await dio.post(pharmacyProfileUpdateWizardService, data: formData);
      log('postStatusCode---->> ${response.statusCode}');
      log('postResponse---->> ${response.data}');
      if (response.statusCode == 200) {
        Get.find<LoaderController>().updateFormController(false);
      }
      if (response.data['status']) {
        Get.snackbar('Submitted', 'Thank you For Cooperating with us.',
            snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
        storageBox!.erase();
        Get.offAll(LoginUI());

        _image = null;
      }
    } on dio_instance.DioError catch (e) {
      Get.find<LoaderController>().updateFormController(false);
      log('put ResponseError---->> ${e.message}');
    }
  }

  editLabDetails([File? file]) async {
    print(storageBox!.read('pharmacy_id'));
    dio_instance.FormData formData =
        dio_instance.FormData.fromMap(<String, dynamic>{
      'update_id': storageBox!.read('lab_id'),
      'name': pharmacyNameController.text,
      'owner_name': ownerNameController.text,
      'owner_phone': ownerPhoneController.text,
      'contact_name': contactNameController.text,
      'contact_phone': contactPhoneController.text,
      'country': 'Pakistan',
      'city': cityNameController.text,
      'address': locationController.text,
      'lat': latitude,
      'long': longitude,
    });
    dio_instance.Dio dio = dio_instance.Dio();
    dio_instance.Response<dynamic> response;
    try {
      response = await dio.post(labProfileUpdateWizardService, data: formData);
      log('postStatusCode---->> ${response.statusCode}');
      log('postResponse---->> ${response.data}');
      if (response.statusCode == 200) {
        Get.find<LoaderController>().updateFormController(false);
      }
      if (response.data['status']) {
        Get.snackbar('Submitted', 'Thank you For Cooperating with us.',
            snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
        storageBox!.erase();
        Get.offAll(LoginUI());

        _image = null;
      }
    } on dio_instance.DioError catch (e) {
      Get.find<LoaderController>().updateFormController(false);
      log('put ResponseError---->> ${e.response}');
    }
  }
}
