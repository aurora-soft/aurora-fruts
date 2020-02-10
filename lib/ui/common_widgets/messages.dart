import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final String message;
  Message({this.message = 'no existen unidades'});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: Center(
        child: Text(
          "${message[0].toUpperCase()}${message.substring(1)}",
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .display1
              .copyWith(color: Colors.grey[600]),
        ),
      ),
    );
    ;
  }
}
