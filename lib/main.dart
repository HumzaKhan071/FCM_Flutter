import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: NotificationApp(),
    );
  }
}

class NotificationApp extends StatefulWidget {
  const NotificationApp({Key? key}) : super(key: key);

  @override
  _NotificationAppState createState() => _NotificationAppState();
}

class _NotificationAppState extends State<NotificationApp> {
  FlutterLocalNotificationsPlugin? localNotification;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var androidIntialize = new AndroidInitializationSettings('ic_launcher');
    var intializationSettings =
        new InitializationSettings(android: androidIntialize);
    localNotification = new FlutterLocalNotificationsPlugin();
    localNotification?.initialize(intializationSettings);
  }

  Future _ShowNotification() async {
    var androidDetails = new AndroidNotificationDetails(
        "channelId", "Local Notification",
        importance: Importance.high);

    var generalNotificationDetails =
        new NotificationDetails(android: androidDetails);

    await localNotification?.show(0, "Title", "The body of the Notifications",
        generalNotificationDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Click the button to receive a notification"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.notifications),
        onPressed: _ShowNotification,
      ),
    );
  }
}
