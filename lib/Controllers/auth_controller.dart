import 'package:get/get.dart';

class AuthController extends GetxController {
  bool signUpChecker = true;
  changeSignUpCheckerState(bool value) {
    signUpChecker = value;
    update();
  }
}
