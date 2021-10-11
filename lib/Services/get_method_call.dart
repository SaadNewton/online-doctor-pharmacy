import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart' as dio_instance;
import 'package:doctoworld_seller/Controllers/app_controller.dart';
import 'package:doctoworld_seller/Services/headers.dart';
import 'package:doctoworld_seller/Storage/local_Storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

getMethod(
    BuildContext context,
    String apiUrl,
    dynamic queryData,
    bool addAuthHeader,
    Function executionMethod // for performing functionalities
    ) async {
  dio_instance.Response response;
  dio_instance.Dio dio = new dio_instance.Dio();

  dio.options.receiveTimeout = 6000;

  if (addAuthHeader && storageBox!.hasData('authToken')) {
    setCustomHeader(dio, 'token', '${storageBox!.read('authToken')}');
    setCustomHeader(dio, 'role', '${storageBox!.read('role')}');
  }

  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print('Internet Connected');

      try {
        response = await dio.get(apiUrl, queryParameters: queryData);

        if (response.statusCode == 200) {
          log('StatusCode------>> ${response.statusCode}');
          log('Response $apiUrl------>> ${response.data}');
          executionMethod(true, response.data, context);
        } else {
          executionMethod(false, null, context);
        }
      } on dio_instance.DioError catch (e) {
        executionMethod(false, null, context);
        if (e.response != null) {
          print('Dio Error From Get $apiUrl -->> ${e.response!.data}');
        } else {
          print('Dio Error From Get $apiUrl -->> ${e}');
        }
      }
    }
  } on SocketException catch (_) {
    Get.find<AppController>().changeInternetCheckerState(false);
    print('Internet Not Connected');
  }
}
