// @dart=2.9
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:doctoworld_seller/Components/custom_button.dart';
import 'package:doctoworld_seller/Components/entry_field.dart';
import 'package:doctoworld_seller/Controllers/loading_controller.dart';
import 'package:doctoworld_seller/Services/service_urls.dart';
import 'package:doctoworld_seller/Storage/local_Storage.dart';
import 'package:doctoworld_seller/repositories/change_password_repo.dart';
import 'package:doctoworld_seller/services/post_method_call.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class ChangePassword extends StatefulWidget {
  final userId;
  ChangePassword({this.userId});
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  GlobalKey<FormState> _changePasswordKey = GlobalKey();
  TextEditingController _currentPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  final _scrollController = ScrollController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoaderController>(
      init: LoaderController(),
      builder: (loaderController) => ModalProgressHUD(
        inAsyncCall: loaderController.formLoader,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Reset Password',
              style: TextStyle(color: Colors.black),
            ),
            iconTheme: IconThemeData(color: Colors.black),
            centerTitle: true,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_outlined,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          resizeToAvoidBottomInset: false,
          body: FadedSlideAnimation(
            Container(
              height: MediaQuery.of(context).size.height,
              child: Form(
                key: _changePasswordKey,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: Column(
                            children: [
                              SizedBox(height: 20),

                              ///...........Current Password....................///
                              EntryField(
                                controller: _currentPasswordController,
                                obSecure: true,
                                prefixIcon: Icons.lock,
                                suffixIcon: Icons.remove_red_eye_outlined,
                                hint: 'Current Password',
                                color: Colors.grey.withOpacity(0.2),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Field is Required';
                                  } else {
                                    return null;
                                  }
                                },
                              ),

                              SizedBox(height: 20),

                              ///...........New Password....................///
                              EntryField(
                                controller: _newPasswordController,
                                obSecure: true,
                                prefixIcon: Icons.lock,
                                suffixIcon: Icons.remove_red_eye_outlined,
                                hint: 'New Password',
                                color: Colors.grey.withOpacity(0.2),
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

                              ///..........Confirm Password................///

                              EntryField(
                                controller: _confirmPasswordController,
                                obSecure: true,
                                prefixIcon: Icons.lock,
                                suffixIcon: Icons.remove_red_eye_outlined,
                                hint: 'Confirm Password',
                                color: Colors.grey.withOpacity(0.2),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Field is Required';
                                  } else if (_newPasswordController.text !=
                                      _confirmPasswordController.text) {
                                    return 'Password not match';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              SizedBox(height: 20.0),
                              CustomButton(
                                label: 'Submit',
                                onTap: () {
                                  FocusScopeNode currentFocus =
                                      FocusScope.of(context);
                                  if (!currentFocus.hasPrimaryFocus) {
                                    currentFocus.unfocus();
                                  }
                                  if (_changePasswordKey.currentState
                                      .validate()) {
                                    Get.find<LoaderController>()
                                        .updateFormController(true);
                                    postMethod(
                                      context,
                                      changePasswordService,
                                      {
                                        'user_id': widget.userId,
                                        'role': storageBox.read('role'),
                                        'curent_password':
                                            _currentPasswordController.text,
                                        'password': _newPasswordController.text,
                                        'confirm_password':
                                            _confirmPasswordController.text,
                                      },
                                      true,
                                      changePasswordRepo,
                                    );
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
            beginOffset: Offset(0, 0.3),
            endOffset: Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
          ),
        ),
      ),
    );
  }
}
