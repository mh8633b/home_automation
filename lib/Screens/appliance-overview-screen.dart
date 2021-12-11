import 'package:flutter/material.dart';
import 'package:home_automation/ServerPostRequest/http.dart';

class ApplicanceOverviewScreen extends StatelessWidget {
  static const routeName = "ApplianceOverviewScreen";
  final int totalDevices = 45;

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final title = arguments["title"];
    final image = arguments["image"];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 10,
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            SliverToBoxAdapter(
              child: Card(
                clipBehavior: Clip.antiAlias,
                elevation: 8,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Colors.purple[500],
                        Colors.purple[700].withOpacity(0.8),
                      ],
                    ),
                  ),
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 130,
                          width: 130,
                          child: Image.asset(image),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 50),
                          child: VerticalDivider(
                            color: Colors.grey[300].withOpacity(0.3),
                            thickness: 1,
                            width: 30,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "All Devices",
                              style: TextStyle(
                                  color: Colors.grey[200],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,

              /////////Grid////////////////////////////
              children: [
                Container(
                    child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                Led.routeName,
                                arguments: {
                                  "title": "Bedroom",
                                  "image": "assets/bedroom.png",
                                },
                              );
                            },
                            padding: EdgeInsets.all(0.0),
                            child: Image.asset("assets/bedroom.png")))),
                Container(
                    child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                Led.routeName,
                                arguments: {
                                  "room": title,
                                  "title": "Led",
                                  "image": "assets/led.png",
                                },
                              );
                            },
                            padding: EdgeInsets.all(0.0),
                            child: Image.asset("assets/led.png")))),
                Container(
                    child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                AC.routeName,
                                arguments: {
                                  "room": title,
                                  "title": "HVAC",
                                  "image": "assets/ac.png",
                                },
                              );
                            },
                            padding: EdgeInsets.all(0.0),
                            child: Image.asset("assets/ac.png")))),
                Container(
                    child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                Fan.routeName,
                                arguments: {
                                  "room": title,
                                  "title": "Fan",
                                  "image": "assets/fan.png",
                                },
                              );
                            },
                            padding: EdgeInsets.all(0.0),
                            child: Image.asset("assets/fan.png")))),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Voice Command',
        child: Icon(
          Icons.mic,
          size: 30,
        ),
        elevation: 3,
      ),
    );
  }
}
