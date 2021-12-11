import 'package:flutter/material.dart';

class NotificationContainer extends StatelessWidget {
  final String title;
  final String message;

  NotificationContainer({
    this.message,
    this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          
          title: Text(
            title,
            style: TextStyle(
                color: Colors.purple[300],
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            message,
            maxLines: 2,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.blueGrey[300],
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
          trailing: Icon(
            Icons.fiber_manual_record,
            color: Colors.green,
            size: 15,
          ),
          isThreeLine: true,
          onTap: () {},
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
        ),
        Divider(
          height: 0,
          thickness: 1,
          color: Colors.black26,
        )
      ],
    );
  }
}
