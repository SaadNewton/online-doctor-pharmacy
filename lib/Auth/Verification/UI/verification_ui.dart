import 'dart:async';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:doctoworld_seller/Components/custom_button.dart';
import 'package:doctoworld_seller/Components/entry_field.dart';
import 'package:doctoworld_seller/Controllers/loading_controller.dart';
import 'package:doctoworld_seller/Controllers/model_controllers.dart';
import 'package:doctoworld_seller/Locale/locale.dart';
import 'package:doctoworld_seller/Services/opt_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class VerificationUI extends StatefulWidget {
  final getPhone;

  VerificationUI({this.getPhone});

  @override
  _VerificationUIState createState() => _VerificationUIState();
}

class _VerificationUIState extends State<VerificationUI> {
  final TextEditingController _controller = TextEditingController();
  int _counter = 20;
  late Timer _timer;

  _startTimer() {
    _counter = 20; //time counter
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _counter > 0 ? _counter-- : _timer.cancel();
      });
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Get.find<LoaderController>().updateFormController(false);
    });
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return GetBuilder<LoaderController>(
      builder: (loaderController) => GetBuilder<ModelControllers>(
        builder: (modelController) => ModalProgressHUD(
          inAsyncCall: loaderController.formLoader,
          child: Scaffold(
            appBar: AppBar(
              title: Text(locale.phoneVerification!),
              textTheme: Theme.of(context).textTheme,
              centerTitle: true,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_outlined,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: FadedSlideAnimation(
              SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Spacer(),
                      Text(
                        locale.weveSentAnOTP!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Theme.of(context).disabledColor),
                        textAlign: TextAlign.center,
                      ),
                      Spacer(flex: 2),
                      EntryField(
                        controller: _controller,
                        hint: 'Enter 6 digit OTP',
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20.0),
                      CustomButton(
                        onTap: () {
                          loaderController.updateFormController(true);
                          verifyOTP(context, _controller.text);
                        },
                        label: locale.submit,
                      ),
                      SizedBox(height: 30.0),
                      Row(
                        children: <Widget>[
                          Text(
                            '$_counter' + locale.secLeft!,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          Spacer(
                            flex: 2,
                          ),
                          Expanded(
                            child: CustomButton(
                                label: locale.resend,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                textColor: Theme.of(context).hintColor,
                                padding: 0.0,
                                onTap: _counter < 1
                                    ? () {
                                        _startTimer();
                                        otpFunction(widget.getPhone.toString(),
                                            context);
                                      }
                                    : null),
                          ),
                        ],
                      ),
                      Spacer(flex: 12),
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
      ),
    );
  }
}
