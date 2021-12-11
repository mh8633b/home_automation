import 'package:flutter/material.dart';
import 'package:home_automation/Screens/notifications-screen.dart';
import 'package:home_automation/Widgets/notification-view.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Led extends StatefulWidget {
  static const routeName = "Led";

  @override
  _LedState createState() => _LedState();
}

class _LedState extends State<Led> {
  int _counter = 0;
  var room;

  bool newStatus = false;

  String roomSelector() {
    switch (room) {
      case "Bedroom":
        return "BedroomLight".toString();
      case "Bathroom":
        return "BathroomLight".toString();
      case "Kitchen":
        return "KitchenLight".toString();
        break;
      default:
        return "Light".toString();
    }
  }

  void toggleSwitch(
    switchStatus,
  ) {
    var client = http.Client();
    try {
      var url = Uri.parse('http://192.168.100.127:3000/nafees123');
      client.post(url,
          body: json.encode({'status': newStatus, "equipment": roomSelector()}),
          headers: {'Content-type': 'application/json'}).then((response) {
        print('status: ${newStatus.toString()}');
      });
      setState(() {
        notifications.add(NotificationContainer(
          title: 'Lights',
          message:
              "${roomSelector() + " have been " + (newStatus ? "turned on" : "turned off")}",
        ));
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
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    room = args["room"];

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
              'Turn the led ${newStatus != true ? 'on' : 'off   '}',
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

class Fan extends StatefulWidget {
  static const routeName = "Fan";

  @override
  _FanState createState() => _FanState();
}

class _FanState extends State<Fan> {
  int _counter = 0;

  var room;

  bool newStatus = false;

  String roomSelector() {
    switch (room) {
      case "Bedroom":
        return "BedroomFan".toString();
      case "Bathroom":
        return "BathroomFan".toString();
      case "Kitchen":
        return "KitchenFan".toString();
        break;
      default:
        return "Fan".toString();
    }
  }

  void toggleSwitch(
    switchStatus,
  ) {
    var client = http.Client();
    try {
      var url = Uri.parse('http://192.168.100.127:3000/nafees123');
      client.post(url,
          body: json.encode({'status': newStatus, "equipment": roomSelector()}),
          headers: {'Content-type': 'application/json'}).then((response) {
        print('status: ${newStatus.toString()}');
      });
      setState(() {
        notifications.add(NotificationContainer(
          title: 'Fan',
          message:
              "${roomSelector() + " have been " + (newStatus ? "turned on" : "turned off")}",
        ));
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
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    room = args["room"];
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
              'Turn the Fan ${newStatus != true ? 'on' : 'off   '}',
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

class AC extends StatefulWidget {
  static const routeName = "AC";

  @override
  _ACState createState() => _ACState();
}

class _ACState extends State<AC> {
  int _counter = 0;
  var room;

  bool newStatus = false;

  String roomSelector() {
    switch (room) {
      case "Bedroom":
        return "BedroomAC".toString();
      case "Bathroom":
        return "BathroomAC".toString();
      case "Kitchen":
        return "KitchenAC".toString();
        break;
      default:
        return "AC".toString();
    }
  }

  void toggleSwitch(
    switchStatus,
  ) {
    var client = http.Client();
    try {
      var url = Uri.parse('http://192.168.100.127:3000/nafees123');
      client.post(url,
          body: json.encode({'status': newStatus, "equipment": roomSelector()}),
          headers: {'Content-type': 'application/json'}).then((response) {
        print('status: ${newStatus.toString()}');
        setState(() {
          notifications.add(NotificationContainer(
            title: 'HVAC',
            message:
                "${roomSelector() + " have been " + (newStatus ? "turned on" : "turned off")}",
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
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    room = args["room"];
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
              'Turn the HVAC ${newStatus != true ? 'on' : 'off   '}',
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
