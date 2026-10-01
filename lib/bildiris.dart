import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class BildirisServisi {
  static final FlutterLocalNotificationsPlugin _plugin = FlutterLocalNotificationsPlugin();

  static Future<void> baslat() async {
    const android = AndroidInitializationSettings('@mipmap/launcher_icon');
    const ios = DarwinInitializationSettings();
    const init = InitializationSettings(android: android, iOS: ios);
    await _plugin.initialize(init);
    await _plugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();
  }

  static Future<void> gunlukBildiris() async {
    const android = AndroidNotificationDetails(
      'gunluk', 'Gunluk Bildiris',
      channelDescription: 'Her gun mistik xatirlatma',
      importance: Importance.high, priority: Priority.high,
    );
    const ios = DarwinNotificationDetails();
    const det = NotificationDetails(android: android, iOS: ios);
    await _plugin.periodicallyShow(
      0, 'Sungur Mistik', 'Bugunun kartini gormek ucun tetbiqe qayidin!',
      RepeatInterval.daily, det, androidAllowWhileIdle: true,
    );
  }

  static Future<void> legvEt() async {
    await _plugin.cancelAll();
  }
}
