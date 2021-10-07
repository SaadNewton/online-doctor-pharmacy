import 'package:doctoworld_seller/Controllers/loading_controller.dart';
import 'package:doctoworld_seller/Data/global_data.dart';
import 'package:doctoworld_seller/Models/get_medicine_from_search_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

getMedicineFromSearchRepo(
    bool responseCheck, Map<String, dynamic> response, BuildContext context) {
  if (responseCheck) {
    Get.find<LoaderController>().updateDataController(false);
    medicineSearchModel = GetMedicineFromSearchModel.fromJson(response);
    if (medicineSearchModel!.status == true) {
      print(
          'getMedicineFromSearchRepo ------>> ${medicineSearchModel!.message}');
    } else {}
  } else if (!responseCheck && response == null) {
    Get.find<LoaderController>().updateDataController(false);

    print('Exception........................');
    // Get.find<AppController>().changeServerErrorCheck(true);
  }
}
