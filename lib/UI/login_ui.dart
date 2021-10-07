import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:doctoworld_seller/Components/custom_button.dart';
import 'package:doctoworld_seller/Components/entry_field.dart';
import 'package:doctoworld_seller/Controllers/loading_controller.dart';
import 'package:doctoworld_seller/Locale/locale.dart';
import 'package:doctoworld_seller/Repositories/login_repo.dart';
import 'package:doctoworld_seller/Services/post_method_call.dart';
import 'package:doctoworld_seller/Services/service_urls.dart';
import 'package:doctoworld_seller/UI/registration_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'customer_password_email_ui.dart';

class LoginUI extends StatefulWidget {
  @override
  _LoginUIState createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Get.find<LoaderController>().updateFormController(false);
    });
  }

  GlobalKey<FormState> loginKey = GlobalKey();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  String? selectedRole;

  List<String> roleList = [
    'Pharmacy',
    'Lab',
  ];

  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var locale = AppLocalizations.of(context)!;
    return GetBuilder<LoaderController>(
      init: LoaderController(),
      builder: (_) => ModalProgressHUD(
        inAsyncCall: _.formLoader,
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: FadedSlideAnimation(
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.5,
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                'assets/login-bg.png',
                              ),
                              fit: BoxFit.fill)),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Form(
                        key: loginKey,
                        child: Column(
                          children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.45),

                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: EntryField(
                                textInputType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (GetUtils.isEmail(value)) {
                                    return null;
                                  } else {
                                    return 'Please enter valid email';
                                  }
                                },
                                hint: 'Email',
                                prefixIcon: Icons.email,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                controller: _emailController,
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: EntryField(
                                suffixIcon: Icons.remove_red_eye_outlined,
                                obSecure: true,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter valid password';
                                  }
                                  return null;
                                },
                                hint: 'Password',
                                prefixIcon: Icons.remove_red_eye_outlined,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                controller: _passController,
                              ),
                            ),
                            SizedBox(height: 10.0),
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
                                      contentPadding: EdgeInsets.only(left: 12),
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
                                  items: List.generate((roleList.length), (a) {
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
                            SizedBox(height: 30.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Forgot Password?',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1!
                                              .copyWith(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  decoration:
                                                      TextDecoration.underline),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          PasswordEmail()));
                                              print('forgot password clicked');
                                            },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 30.0),
                            CustomButton(onTap: () {
                              if (loginKey.currentState!.validate()) {
                                //    .loginWithEmail('', _emailController.text);
                                _.updateFormController(true);
                                postMethod(
                                    context,
                                    loginService,
                                    {
                                      'email': _emailController.text,
                                      'password': _passController.text,
                                      'login_type': 'login_email',
                                      'role': selectedRole
                                    },
                                    false,
                                    getLoginData);
                              }
                            }),
                            SizedBox(height: 30.0),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Don\'t Have an Account?  ',
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                  TextSpan(
                                    text: 'Create new one',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(
                                            color:
                                                Theme.of(context).primaryColor,
                                            decoration:
                                                TextDecoration.underline),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RegistrationUI_signUp()));
                                        print('CREATE ACCOUNT');
                                      },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 30.0),

                            // Spacer(),
                            // Row(
                            //   children: [
                            //     Expanded(
                            //       child: CustomButton(
                            //         icon: Image.asset('assets/Icons/ic_fb.png',
                            //             scale: 2),
                            //         color: Color(0xff3b45c1),
                            //         label: locale.facebook,
                            //         onTap: () =>
                            //             widget.loginInteractor.loginWithFacebook(),
                            //       ),
                            //     ),
                            //     SizedBox(width: 20.0),
                            //     Expanded(
                            //       child: CustomButton(
                            //         label: locale.gmail,
                            //         icon: Image.asset('assets/Icons/ic_ggl.png',
                            //             scale: 3),
                            //         color: Theme.of(context).scaffoldBackgroundColor,
                            //         textColor: Theme.of(context).hintColor,
                            //         onTap: () =>
                            //             widget.loginInteractor.loginWithGoogle(),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ],
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
