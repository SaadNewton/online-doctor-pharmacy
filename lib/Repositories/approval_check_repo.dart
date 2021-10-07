import 'package:doctoworld_seller/Controllers/loading_controller.dart';
import 'package:doctoworld_seller/Storage/local_Storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///-------- Approve  doctor
pharmacyApprovalRepo(
    bool responseCheck, Map<String, dynamic> response, BuildContext context) {
  if (responseCheck) {
    print('aaaaaaaaaaaaaaaaaaaaaaaaaa');
    if (response['status']) {
      storageBox!.write('pharmacyApproved', 'true');
      Get.find<LoaderController>().checkPharmacyStatusLoader(true);
      Get.find<LoaderController>().updateDataController(false);
    }
  } else if (!responseCheck && response == null) {
    print('Doctor not Accept');
    Get.find<LoaderController>().updateFormController(false);

    print('Exception........................ ' + response.toString());
  }
}
