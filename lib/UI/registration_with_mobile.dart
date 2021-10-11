import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:doctoworld_seller/Auth/Verification/UI/verification_ui.dart';
import 'package:doctoworld_seller/Components/custom_button.dart';
import 'package:doctoworld_seller/Components/entry_field.dart';
import 'package:doctoworld_seller/Controllers/loading_controller.dart';
import 'package:doctoworld_seller/Locale/locale.dart';
import 'package:doctoworld_seller/Services/opt_service.dart';
import 'package:doctoworld_seller/UI/login_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RegistrationUIWithMobile extends StatefulWidget {
  @override
  _RegistrationUIWithMobileState createState() =>
      _RegistrationUIWithMobileState();
}

class _RegistrationUIWithMobileState extends State<RegistrationUIWithMobile> {
  GlobalKey<FormState> numberKey = GlobalKey();
  final TextEditingController numberController = TextEditingController();

  @override
  void dispose() {
    numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: FadedSlideAnimation(
        SingleChildScrollView(
          child: Container(
            height: size.height,
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
                    key: numberKey,
                    child: Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.45),
                        EntryField(
                          hint: locale.enterMobileNumber,
                          prefixIcon: Icons.phone_iphone,
                          color: theme.scaffoldBackgroundColor,
                          controller: numberController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field is Required';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 20.0),
                        CustomButton(onTap: () {
                          if (numberKey.currentState!.validate()) {
                            if (numberController.text.contains('+92')) {
                              print('NUMBER--->>${numberController.text}');
                              otpFunction(numberController.text, context);
                              Get.find<LoaderController>()
                                  .updateFormController(false);
                              Get.to(VerificationUI(
                                getPhone: numberController.text,
                              ));
                            } else {
                              if (numberController.text.startsWith('0'))
                                numberController.text = numberController.text
                                    .replaceFirst('0', '+92');
                              print('NUMBER--->>${numberController.text}');

                              otpFunction(numberController.text, context);
                              Get.find<LoaderController>()
                                  .updateFormController(false);
                              Get.to(VerificationUI(
                                getPhone: numberController.text,
                                // registerTheUser: true,
                              ));
                            }
                          }
                        }),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            Text('OR'),
                            SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () => Get.to(LoginUI()),
                              child: Text(
                                'Try Another Way',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    decoration: TextDecoration.underline),
                              ),
                            )
                          ],
                        )
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
    );
  }
}
