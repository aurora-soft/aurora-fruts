import 'package:flutter/material.dart';

class _ContentSnackBar extends StatelessWidget {
  final Color color;
  final String text;

  _ContentSnackBar({this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.0),
      height: 40.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: color ?? Theme.of(context).accentColor),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

void showSnackBar({BuildContext context, String title, Color color}) {
  Scaffold.of(context).showSnackBar(SnackBar(
    elevation: 0.0,
    backgroundColor: Colors.transparent,
    content: _ContentSnackBar(text: title, color: color),
  ));
}
