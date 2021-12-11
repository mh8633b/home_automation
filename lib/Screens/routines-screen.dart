import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:home_automation/Screens/notifications-screen.dart';
import 'package:home_automation/Widgets/notification-view.dart';
import 'package:http/http.dart' as http;

// class RoutinesScreen extends StatelessWidget {
//   static const routeName = "RoutinesScreen";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//     );
//   }
// }

class RoutinesScreen extends StatefulWidget {
  static const routeName = "RoutinesScreen";

  @override
  _RoutinesScreenState createState() => _RoutinesScreenState();
}

class _RoutinesScreenState extends State<RoutinesScreen> {
  bool newStatus = false;

  void toggleSwitch(
    switchStatus,
  ) {
    var client = http.Client();
    try {
      var url = Uri.parse('http://192.168.100.127:3000/prediction');
      client.post(url,
          body: json.encode({
            'status': newStatus,
          }),
          headers: {'Content-type': 'application/json'}).then((response) {
        print('status: ${newStatus.toString()}');
        setState(() {
          notifications.add(NotificationContainer(
            title: 'Pridictions',
            message:
                "${"Pridictions have been " + (newStatus ? "turned on" : "turned off")}",
          ));
        });
      });
    } finally {
      client.close();
    }
    setState(() {
      newStatus = !newStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("On / Off"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /*Container(

                    child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            HomeScreen.routeName,
                            arguments: {
                              "title": "Curtains",
                              "image": "assets/curtains.png",
                            },
                          );

                        },
                        padding: EdgeInsets.all(0.0),
                        icon: Icon(Icons.mic),)),*/

            Text(
              'Turn the Prediction ${newStatus != true ? 'on' : 'off   '}',
              style: TextStyle(fontSize: 32),
            ),
            Transform.scale(
              scale: 3.0,
              child: new Switch(onChanged: toggleSwitch, value: newStatus),
            ),
          ],
        ),
      ),
    );
  }
}
