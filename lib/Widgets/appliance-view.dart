import 'package:flutter/material.dart';
import 'package:home_automation/Models/ApplianceCategory.dart';

class ApplianceContianer extends StatelessWidget {
  final ApplianceCategory category;
  ApplianceContianer(this.category);
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey,
      elevation: 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 100,
            child: Center(
              child: Image.asset(
                category.icon,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            category.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "${category.numberOfDevices} devices",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
