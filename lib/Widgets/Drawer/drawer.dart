import 'package:flutter/material.dart';
import 'package:home_automation/Screens/Auth/login-screen.dart';
import 'package:home_automation/Screens/location-information-screen.dart';
import 'package:home_automation/Screens/notifications-screen.dart';
import 'package:home_automation/Screens/routines-screen.dart';
import 'package:home_automation/Widgets/Drawer/drawer-list-item.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        margin: EdgeInsets.only(top: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        child: Image.asset(
                          "assets/homeAutomation.png",
                          color: Colors.purple,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Home Automation",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            fontSize: 18),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  thickness: 1,
                  color: Colors.purple[200],
                ),
                DrawerItem(
                  title: "Notifications",
                  leading: Image.asset("assets/notifications.png"),
                  onTap: () {
                    navigateToNotificationScreen(context);
                  },
                ),
                DrawerItem(
                  title: "Routine",
                  leading: Image.asset("assets/routine.png"),
                  onTap: () {
                    navigateToRoutinesScreen(context);
                  },
                ),
                DrawerItem(
                  title: "Location Information",
                  leading: Image.asset("assets/location.png"),
                  onTap: () {
                    navigateToLocationInformationScreen(context);
                  },
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: DrawerItem(
                leading: Icon(
                  Icons.exit_to_app,
                  color: Colors.purple,
                  size: 40,
                ),
                title: "Sign out",
                onTap: () {
                  while (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                  Navigator.pushReplacementNamed(
                      context, LoginScreen.routeName);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToNotificationScreen(BuildContext context) {
    Navigator.pushNamed(context, NotificationsScreen.routeName);
  }

  void navigateToRoutinesScreen(BuildContext context) {
    Navigator.pushNamed(context, RoutinesScreen.routeName);
  }

  void navigateToLocationInformationScreen(BuildContext context) {
    Navigator.pushNamed(context, LocationInformationScreen.routeName);
  }
}
