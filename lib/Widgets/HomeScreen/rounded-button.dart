import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Function onTap;
  final Widget child;
  final String title;
  RoundedButton({
    this.child,
    this.onTap,
    this.title = "",
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey[100],
          borderRadius: BorderRadius.circular(40),
        ),
        height: 80,
        width: 80,
        child: Center(
          child: Column(
            children: [
              Container(
                child: child,
                height: 60,
                width: 60,
              ),
              Text(
                title,
                style: TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
