import 'package:doctoworld_seller/Models/agora_model.dart';
import 'package:get/get.dart';

class LoaderController extends GetxController {
  bool formLoader = false;
  updateFormController(bool value) {
    formLoader = value;
    update();
  }

  bool dataLoader = true;
  updateDataController(bool value) {
    dataLoader = value;
    update();
  }

  bool timeOutLoader = true;
  updateTimeOutController(bool value) {
    timeOutLoader = value;
    update();
  }

  bool pharmacyStatusLoader = false;
  checkPharmacyStatusLoader(bool value) {
    pharmacyStatusLoader = value;
    update();
  }

  AgoraModel agoraModel = AgoraModel();
  AgoraModel agoraModelDefault = AgoraModel();

  updateAgoraModel(AgoraModel newAgoraModel) {
    agoraModel = newAgoraModel;
    update();
  }

  updateAgoraModelDefault(AgoraModel newAgoraModel) {
    agoraModelDefault = newAgoraModel;
    update();
  }

  String? otherRoleToken;
  updateOtherRoleToken(String newToken) {
    newToken = otherRoleToken!;
    update();
  }
}
