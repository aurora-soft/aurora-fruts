import 'package:flutter/material.dart';

class ButtonBase extends StatelessWidget {

  final Function onTap;
  final String title;

  ButtonBase({this.onTap,this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.0,
        width: MediaQuery.of(context).size.width - 32,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Theme.of(context).accentColor.withOpacity(0.9),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[400], blurRadius: 5.0, spreadRadius: 2.0)
            ]),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}
