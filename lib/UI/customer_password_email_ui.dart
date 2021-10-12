import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:doctoworld_seller/Controllers/loading_controller.dart';
import 'package:doctoworld_seller/Data/global_data.dart';
import 'package:doctoworld_seller/Services/service_urls.dart';
import 'package:doctoworld_seller/components/custom_button.dart';
import 'package:doctoworld_seller/components/entry_field.dart';
import 'package:doctoworld_seller/repositories/forgot_password_email_repo.dart';
import 'package:doctoworld_seller/services/post_method_call.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class PasswordEmail extends StatefulWidget {
  @override
  _PasswordEmailState createState() => _PasswordEmailState();
}

class _PasswordEmailState extends State<PasswordEmail> {
  GlobalKey<FormState> _passwordEmailKey = GlobalKey();

  final _scrollController = ScrollController();

  List<String> roleList = [
    'Pharmacy',
    'Lab',
  ];

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
              'Send Email',
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
                key: _passwordEmailKey,
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
                                        contentPadding:
                                            EdgeInsets.only(left: 12),
                                        border: InputBorder.none,
                                        fillColor: Colors.white,
                                        filled: true),
                                    hint: Padding(
                                      padding: const EdgeInsets.only(left: 0),
                                      child: Text(
                                        'Select Role',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    items:
                                        List.generate((roleList.length), (a) {
                                      return DropdownMenuItem(
                                        child: Text(roleList[a]),
                                        value: roleList[a],
                                      );
                                    }),
                                    onChanged: (value) {
                                      setState(() {
                                        if (value == 'Pharmacy') {
                                          selectedRole = 'pharmacy_owner';
                                        } else {
                                          selectedRole = 'lab_owner';
                                        }
                                      });
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.0),

                              ///...........Email....................///
                              EntryField(
                                hint: 'Email',
                                prefixIcon: Icons.email,
                                color: Colors.grey.withOpacity(0.2),
                                controller: forgetEmailController,
                                validator: (value) {
                                  if (GetUtils.isEmail(
                                      forgetEmailController.text)) {
                                    return null;
                                  } else {
                                    return 'Please enter valid email';
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
                                  if (_passwordEmailKey.currentState!
                                      .validate()) {
                                    Get.find<LoaderController>()
                                        .updateFormController(true);
                                    postMethod(
                                      context,
                                      passwordEmailService,
                                      {
                                        'email': forgetEmailController.text,
                                        'role': selectedRole,
                                      },
                                      true,
                                      forgotPasswordEmailRepo,
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
