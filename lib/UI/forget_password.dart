// @dart=2.9
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:doctoworld_seller/Components/custom_button.dart';
import 'package:doctoworld_seller/Components/entry_field.dart';
import 'package:doctoworld_seller/Controllers/loading_controller.dart';
import 'package:doctoworld_seller/Data/global_data.dart';
import 'package:doctoworld_seller/Repositories/forget_password_repo.dart';
import 'package:doctoworld_seller/services/post_method_call.dart';
import 'package:doctoworld_seller/services/service_urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  GlobalKey<FormState> _forgetPasswordKey = GlobalKey();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmNewPasswordController = TextEditingController();

  final _scrollController = ScrollController();

  @override
  void dispose() {
    // _nameController.dispose();
    // _emailController.dispose();
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
              'Forget Password',
              style: TextStyle(color: Colors.black),
            ),
            iconTheme: IconThemeData(color: Colors.black),
            centerTitle: true,
          ),
          resizeToAvoidBottomInset: false,
          body: FadedSlideAnimation(
            Container(
              height: MediaQuery.of(context).size.height,
              child: Form(
                key: _forgetPasswordKey,
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
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              SizedBox(height: 20.0),

                              ///..........Confirm Password................///

                              EntryField(
                                controller: _confirmNewPasswordController,
                                obSecure: true,
                                prefixIcon: Icons.lock,
                                suffixIcon: Icons.remove_red_eye_outlined,
                                hint: 'Confirm Password',
                                color: Colors.grey.withOpacity(0.2),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Field is Required';
                                  } else if (_newPasswordController.text !=
                                      _confirmNewPasswordController.text) {
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
                                  if (_forgetPasswordKey.currentState
                                      .validate()) {
                                    Get.find<LoaderController>()
                                        .updateFormController(true);
                                    postMethod(
                                        context,
                                        resetPasswordService,
                                        {
                                          'password':
                                              _newPasswordController.text,
                                          'role': selectedRole,
                                          'confirm_password':
                                              _confirmNewPasswordController
                                                  .text,
                                          'email': forgetEmailController.text
                                        },
                                        true,
                                        forgotPasswordRepo);
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
