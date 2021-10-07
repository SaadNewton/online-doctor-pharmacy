import 'package:get_storage/get_storage.dart';

GetStorage? storageBox = GetStorage();

storeDataLocally(String key, dynamic value) {
  storageBox!.write(key, value);
}
