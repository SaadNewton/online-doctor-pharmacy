import 'package:doctoworld_seller/Auth/Verification/UI/verification_interator.dart';
import 'package:doctoworld_seller/Auth/Verification/UI/verification_ui.dart';
import 'package:flutter/material.dart';

class VerificationPage extends StatefulWidget {
  final VoidCallback onVerificationDone;

  VerificationPage(this.onVerificationDone);

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage>
    implements VerificationInteractor {
  @override
  Widget build(BuildContext context) {
    return VerificationUI();
  }

  @override
  void verificationDone() {
    widget.onVerificationDone();
  }

  @override
  void verifyNumber() {}
}
