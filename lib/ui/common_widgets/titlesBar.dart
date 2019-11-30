import 'package:flutter/material.dart';

class TitlesBar extends StatelessWidget {
  final String h1;
  final String h2;

  TitlesBar({this.h1, this.h2});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(style: DefaultTextStyle.of(context).style, children: [
        TextSpan(
            text: '$h1\n',
            style: TextStyle(
                color: Colors.black,
                fontSize: 32.0,
                fontWeight: FontWeight.bold)),
        TextSpan(
            text: '$h2',
            style: TextStyle(
                color: Colors.black,
                fontSize: 32.0,
                fontWeight: FontWeight.w300))
      ]),
    );
  }
}
