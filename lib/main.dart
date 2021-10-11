import 'package:doctoworld_seller/Controllers/app_controller.dart';
import 'package:doctoworld_seller/Controllers/loading_controller.dart';
import 'package:doctoworld_seller/Controllers/model_controllers.dart';
import 'package:doctoworld_seller/DrawerItems/recent_orders.dart';
import 'package:doctoworld_seller/Services/local_notification_service.dart';
import 'package:doctoworld_seller/Splash/splash.dart';
import 'package:doctoworld_seller/Theme/style.dart';
import 'package:doctoworld_seller/lab_owner/Orders/all_lab_orders.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'Locale/locale.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  String route, channelName, channelToken;
  if (message.data['channel'] != null) {
    channelName = message.data['channel'];
    channelToken = message.data['channel_token'];
    Get.find<LoaderController>().agoraModelDefault.channelName =
        message.data['channel'];
    Get.find<LoaderController>().agoraModelDefault.token =
        message.data['channel_token'];
    Get.find<LoaderController>().updateAgoraModelDefault(
        Get.find<LoaderController>().agoraModelDefault);
  }
  if (message.data['routeApp'] != null) {
    route = message.data['routeApp'];
    Get.toNamed(route);
  }

  LocalNotificationService.display(message);
}

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(LoaderController());
  Get.put(AppController());
  Get.put(ModelControllers());
  runApp(Phoenix(child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    LocalNotificationService.initialize(context);
    // TODO: implement initState
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      String route, channelName, channelToken;
      if (message!.data['channel'] != null) {
        channelName = message.data['channel'];
        channelToken = message.data['channel_token'];
        Get.find<LoaderController>().agoraModelDefault.channelName =
            message.data['channel'];
        Get.find<LoaderController>().agoraModelDefault.token =
            message.data['channel_token'];
        Get.find<LoaderController>().updateAgoraModelDefault(
            Get.find<LoaderController>().agoraModelDefault);
      }
      if (message.data['routeApp'] != null) {
        route = message.data['routeApp'];
        Get.toNamed(route);
      }
    });

    ///forground messages
    FirebaseMessaging.onMessage.listen((message) {
      print('foreground messages----->>');
      print(message.notification.toString());

      if (message.notification != null) {
        print(message.notification!.body.toString());
        print(message.notification!.title);
      }
      String route, channelName, channelToken;
      if (message.data['channel'] != null) {
        channelName = message.data['channel'];
        channelToken = message.data['channel_token'];
        Get.find<LoaderController>().agoraModelDefault.channelName =
            message.data['channel'];
        Get.find<LoaderController>().agoraModelDefault.token =
            message.data['channel_token'];
        Get.find<LoaderController>().updateAgoraModelDefault(
            Get.find<LoaderController>().agoraModelDefault);
      }
      if (message.data['routeApp'] != null) {
        route = message.data['routeApp'];
        Get.toNamed(route);
      }
      LocalNotificationService.display(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      String route, channelName, channelToken;
      if (message.data['channel'] != null) {
        channelName = message.data['channel'];
        channelToken = message.data['channel_token'];
        Get.find<LoaderController>().agoraModelDefault.channelName =
            message.data['channel'];
        Get.find<LoaderController>().agoraModelDefault.token =
            message.data['channel_token'];
        Get.find<LoaderController>().updateAgoraModelDefault(
            Get.find<LoaderController>().agoraModelDefault);
      }
      if (message.data['routeApp'] != null) {
        route = message.data['routeApp'];
        Get.toNamed(route);
      }

      LocalNotificationService.display(message);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('ar'),
        const Locale('pt'),
        const Locale('fr'),
        const Locale('id'),
        const Locale('es'),
        const Locale('tr'),
        const Locale('it'),
        const Locale('sw'),
      ],
      theme: appTheme,
      home: SplashScreen(),
      routes: {
        '/recentOrders': (context) => RecentOrders(
              tabIndex: 0,
            ),
        '/labOrders': (context) => AllLabOrders(
              tabIndex: 0,
            )
      },
    );
  }
}
