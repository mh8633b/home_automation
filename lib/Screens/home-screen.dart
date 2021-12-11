import 'package:flutter/material.dart';

import 'package:home_automation/Screens/appliance-overview-screen.dart';
import 'package:home_automation/Widgets/Drawer/drawer.dart';
import 'package:home_automation/Widgets/HomeScreen/rounded-button.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "HomeScreen";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isUp = true;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("My Home"),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 0,
              child: Container(
                height: mediaQuery.size.height,
                width: mediaQuery.size.width,
                child: centerPicture(mediaQuery.size),
              ),
            ),
            Stack(
              children: [

                Container(
                  padding: EdgeInsets.all(10),
                  width: mediaQuery.size.width,
                  height: mediaQuery.size.height / 1.8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedButton(
                            title: "Bedroom",
                            child: Image.asset("assets/bedroom.png"),
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                ApplicanceOverviewScreen.routeName,
                                arguments: {
                                  "title": "Bedroom",
                                  "image": "assets/bedroom.png",
                                },
                              );
                            },
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RoundedButton(
                              title: "Bathroom",
                              child: Image.asset(
                                "assets/bathroom.png",
                              ),
                              onTap: () {
                                Navigator.pushNamed(
                                    context, ApplicanceOverviewScreen.routeName,
                                    arguments: {
                                      "title": "Bathroom",
                                      "image": "assets/bathroom.png",
                                    });
                              },
                            ),
                            RoundedButton(
                              title: "Kitchen",
                              child: Image.asset(
                                "assets/kitchen.png",
                              ),
                              onTap: () {
                                Navigator.pushNamed(
                                    context, ApplicanceOverviewScreen.routeName,
                                    arguments: {
                                      "title": "Kitchen",
                                      "image": "assets/kitchen.png",
                                    });
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

               
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget centerPicture(size) {
    return Center(
      child: Container(
        height: size.height * 0.3,
        width: size.height * 0.3,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size.height * 0.3 / 2),
            color: Colors.grey[300]),
        child: Image.asset(
          "assets/home.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
