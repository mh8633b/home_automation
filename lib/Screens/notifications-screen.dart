import 'package:flutter/material.dart';
import 'package:home_automation/Widgets/notification-view.dart';

final List<NotificationContainer> notifications = [
  NotificationContainer(
    title: "Lights",
    message: "Lights have been turned off automatically.",
  ),
  NotificationContainer(
    title: "GEO LOCATION",
    message: "Do you wnat to turn on the location smartness",
  ),
];

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key key}) : super(key: key);
  static const routeName = "NotificationsScreen";

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return NotificationContainer(
            title: notifications[index].title,
            message: notifications[index].message,
          );
        },
      ),
    );
  }
}
