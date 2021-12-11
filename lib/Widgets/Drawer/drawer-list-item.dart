import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final textStyle = TextStyle(
    color: Colors.purpleAccent,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  final String title;
  final Widget leading;
  final Function onTap;

  DrawerItem({
    this.leading,
    this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        minVerticalPadding: 25,
        leading: Container(
          height: 50,
          width: 50,
          child: leading,
        ),
        title: Text(
          title,
          style: textStyle,
        ),
        onTap: onTap,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[300],
          ),
        ),
      ),
    );
  }
}
