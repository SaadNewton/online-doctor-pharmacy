import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  static void initialize(BuildContext context) {
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: AndroidInitializationSettings('@mipmap/ic_launcher'));
    _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? route) async {});
  }

  static void display(RemoteMessage message) {
    final NotificationDetails _details = NotificationDetails(
      android: AndroidNotificationDetails(
        "easyApproach",
        "easyApproach channel",
        "this is our channel",
        importance: Importance.max,
        priority: Priority.high,
      ),
    );
    final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    _flutterLocalNotificationsPlugin.show(
        id, message.notification!.title, message.notification!.body, _details,
        payload: message.data['route']);
  }
}
