import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:doctoworld_seller/Components/custom_button.dart';
import 'package:doctoworld_seller/Components/entry_field.dart';
import 'package:doctoworld_seller/Controllers/loading_controller.dart';
import 'package:doctoworld_seller/Data/global_data.dart';
import 'package:doctoworld_seller/Locale/locale.dart';
import 'package:doctoworld_seller/Repositories/phone_email_repo.dart';
import 'package:doctoworld_seller/Services/post_method_call.dart';
import 'package:doctoworld_seller/Services/service_urls.dart';
import 'package:doctoworld_seller/UI/login_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationUI_signUp extends StatefulWidget {
  @override
  _RegistrationUI_signUpState createState() => _RegistrationUI_signUpState();
}

class _RegistrationUI_signUpState extends State<RegistrationUI_signUp> {
  GlobalKey<FormState> signKey = GlobalKey();

  var currentPosition;
  bool? obSecureText;

  List<String> roleList = [
    'Pharmacy',
    'Lab',
  ];

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
            title: Text(locale.registerNow!),
            textTheme: Theme.of(context).textTheme,
            centerTitle: true,
          ),
          body: FadedSlideAnimation(
            Container(
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.all(20.0),
              child: Form(
                key: signKey,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Column(
                      children: [
                        Center(
                            child: Image.asset(
                          'assets/ic_launcher.png',
                          width: 100,
                        )),

                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Material(
                            child: DropdownButtonFormField<String>(
                              validator: (v) {
                                if (v == null) {
                                  return 'Please Select Role';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  // contentPadding: EdgeInsets.only(left: 30),
                                  border: InputBorder.none,
                                  fillColor: Colors.white,
                                  filled: true),
                              hint: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  'Select Role',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              items: List.generate((roleList.length), (a) {
                                return DropdownMenuItem(
                                  child: Text(roleList[a]),
                                  value: roleList[a],
                                );
                              }),
                              onChanged: (value) {
                                setState(() {
                                  if (value == 'Pharmacy') {
                                    signUpSelectedRole = 'pharmacy_owner';
                                  } else {
                                    signUpSelectedRole = 'lab_owner';
                                  }
                                });
                                print(signUpSelectedRole);
                              },
                            ),
                          ),
                        ),

                        SizedBox(height: 10),

                        /// name
                        EntryField(
                          textInputFormatter: FilteringTextInputFormatter.allow(
                              RegExp("[a-zA-Z ]")),
                          controller: nameController,
                          prefixIcon: Icons.person,
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

                        /// user-name

                        // EntryField(
                        //   controller: _usernameController,
                        //   prefixIcon: Icons.person,
                        //   hint: 'User Name',
                        //   validator: (value) {
                        //     if (value.isEmpty) {
                        //       return 'Field is Required';
                        //     } else {
                        //       return null;
                        //     }
                        //   },
                        // ),
                        // SizedBox(height: 20.0),

                        /// Email
                        EntryField(
                          textInputType: TextInputType.emailAddress,
                          controller: emailController,
                          prefixIcon: Icons.mail,
                          hint: locale.emailAddress,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Field is Required';
                            } else if (!GetUtils.isEmail(value)) {
                              return 'Please Enter Valid Email';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 20.0),

                        /// phone
                        EntryField(
                          textInputFormatter:
                              LengthLimitingTextInputFormatter(11),
                          textInputType: TextInputType.phone,
                          controller: phoneController,
                          prefixIcon: Icons.phone_iphone,
                          hint: 'Phone',
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Field is Required';
                            } else if (value.length >= 20) {
                              return 'Enter Valid Number';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 20.0),

                        /// password

                        EntryField(
                          controller: passController,
                          obSecure: true,
                          prefixIcon: Icons.lock,
                          suffixIcon: Icons.remove_red_eye_outlined,
                          hint: 'Password',
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Field is Required';
                            } else if (value.toString().length < 8) {
                              return 'Password length must be greater than 8 characters';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 20.0),

                        /// confirm pass

                        EntryField(
                          controller: confirmPassController,
                          prefixIcon: Icons.lock,
                          obSecure: true,
                          suffixIcon: Icons.remove_red_eye_outlined,
                          hint: 'Confirm Password',
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Field is Required';
                            } else if (passController.text !=
                                confirmPassController.text) {
                              return 'Password not match';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 20.0),

                        ///  Location

                        // EntryField(
                        //   controller: _locationController,
                        //   suffixIcon: Icons.add_location,
                        //
                        //   hint: 'Location',
                        //   validator: (value){
                        //     if(value.isEmpty){
                        //       return 'Field is Required';
                        //     }else{
                        //       return null;
                        //     }
                        //   },
                        // ),
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
                            fillColor: Theme.of(context).backgroundColor,
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
                          onTap: () {
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);
                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
                            if (signKey.currentState!.validate()) {
                              Get.find<LoaderController>()
                                  .updateFormController(true);
                              postMethod(
                                  context,
                                  phoneEmailCheckService,
                                  {
                                    'phone': phoneController.text,
                                    'email': emailController.text,
                                    'role': signUpSelectedRole,
                                  },
                                  false,
                                  phoneEmailCheckRepo);
                            }
                            // otpFunction(_phoneController.text, context);
                            // Get.to(VerificationUI());
                          },
                        ),
                        SizedBox(height: 10.0),
                        CustomButton(
                            label: locale.backToSignIn,
                            color: Theme.of(context).scaffoldBackgroundColor,
                            textColor: Theme.of(context).hintColor,
                            onTap: () {
                              Get.to(LoginUI());
                            }),

                        SizedBox(height: 10.0),

                        // CustomButton(
                        //     color: Theme.of(context).scaffoldBackgroundColor,
                        //     onTap: () {
                        //       Get.to(VerificationUI(getPhone: phoneController.text,));
                        //     }),

                        Text(
                          locale.wellSendAnOTP!,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Theme.of(context).disabledColor),
                        ),
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

  getCurrentLocation(BuildContext context) {
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        currentPosition = position;
        signUplongitude = currentPosition!.longitude;
        signUplatitude = currentPosition!.latitude;

        print("longitude : $signUplongitude");
        print("latitude : $signUplatitude");
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
              currentPosition!.latitude, currentPosition!.longitude);
      Placemark place = p[0];
      setState(() {
        signUpCurrentAddress =
            '${place.name}, ${place.subAdministrativeArea}, ${place.administrativeArea}, ${place.country}';
        // var signUpAddressController;
        // if (signUpAddressController.text.isEmpty) {
        //   signUpAddressController.text = currentAddress;
        // }
        print(signUpCurrentAddress + ' yes');
        print(place.administrativeArea.toString());
        print(place.subAdministrativeArea.toString());
        print(place.thoroughfare.toString());
        print(place.toJson().toString());
        // FocusScope.of(context).unfocus();
        locationController.text = place.name.toString();
      });
    } catch (e) {
      print(e);
    }
  }
}
