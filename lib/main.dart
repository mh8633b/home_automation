import 'package:flutter/material.dart';
import 'package:home_automation/Screens/Auth/register-screen.dart';
import 'package:home_automation/Screens/home-screen.dart';
import 'package:home_automation/Screens/appliance-overview-screen.dart';
import 'package:home_automation/Screens/location-information-screen.dart';
import 'package:home_automation/Screens/notifications-screen.dart';
import 'package:home_automation/Screens/routines-screen.dart';

import 'Screens/Auth/login-screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'Models/Auth.dart';
import 'ServerPostRequest/http.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(HomeAutomation());
}

class HomeAutomation extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Authentication(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Home Automation',
          theme: ThemeData(
            primarySwatch: Colors.purple,
          ),
          home: LoginScreen(),
          routes: {
            RegisterScreen.routeName: (context) => RegisterScreen(),
            HomeScreen.routeName: (context) => HomeScreen(),
            ApplicanceOverviewScreen.routeName: (context) =>
                ApplicanceOverviewScreen(),
            RoutinesScreen.routeName: (context) => RoutinesScreen(),
            LocationInformationScreen.routeName: (context) =>
                LocationInformationScreen(),
            NotificationsScreen.routeName: (context) => NotificationsScreen(),
            LoginScreen.routeName: (context) => LoginScreen(),
            Led.routeName: (context) => Led(),
            Fan.routeName: (context) => Fan(),
            AC.routeName: (context) => AC()
          },
        ));
  }
}
