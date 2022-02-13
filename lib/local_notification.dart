import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNoification extends StatefulWidget {
  const LocalNoification({Key? key}) : super(key: key);

  @override
  State<LocalNoification> createState() => _LocalNoificationState();
}

// Create a channel for Android and IOS devices to show notifications in the notification center
class _LocalNoificationState extends State<LocalNoification> {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  // TO initialize the plugin
  void initState() {
    super.initState();
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var android = AndroidInitializationSettings('@mipmap/ic_launcher');
    var ios = IOSInitializationSettings();
    var initSetttings = InitializationSettings(android: android, iOS: ios);
    flutterLocalNotificationsPlugin.initialize(initSetttings,
        onSelectNotification: onSelectNotification);
  }

// To show a notification
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local Notification',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Local Notification'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  showNotification();
                },
                child: const Text('Send noification'),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  showNotificationAfter5Sec();
                },
                child: const Text('Send Notification After 5 seconds')),
          ],
        ),
      ),
    );
  }

// Our Functions to show a notification
  showNotification() {
    var android = const AndroidNotificationDetails('channel id', 'channel NAME',
        priority: Priority.high, importance: Importance.max);
    var ios = IOSNotificationDetails();
    var platform = NotificationDetails(android: android, iOS: ios);
    flutterLocalNotificationsPlugin.show(
        0, 'New Vedio Out', 'This is the title of notification', platform,
        payload: 'Custom_Sound');
  }

  showNotificationAfter5Sec() {
    var android = const AndroidNotificationDetails('channel id', 'channel NAME',
        priority: Priority.high, importance: Importance.max);
    var ios = IOSNotificationDetails();
    var platform = NotificationDetails(android: android, iOS: ios);

    flutterLocalNotificationsPlugin.schedule(
        0,
        'New Vedio Out',
        'This is the title of notification',
        DateTime.now().add(Duration(seconds: 5)),
        platform,
        payload: 'Custom_Sound');

    // flutterLocalNotificationsPlugin.zonedSchedule(
    //     0, 'New Vedio Out', 'This is the title of notification',
    //     DateTime.now().add(Duration(seconds: 5)), platform,
    //     payload: 'Custom_Sound');
  }

  void onSelectNotification(String? payload) {
    showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        title: Text("Payload"),
        content: Text("Payload : $payload"),
      ),
    );
  }
}
// End of the class
