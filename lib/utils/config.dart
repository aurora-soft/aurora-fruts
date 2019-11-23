import 'package:flutter/widgets.dart';
import 'dart:io';

Future<bool> checkInternet() async {
  try {
    final res = await InternetAddress.lookup('google.com');
    if (res.isNotEmpty && res[0].rawAddress.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  } on SocketException catch(_) {
    return false;
  }
}

Color convertColor(String x) {
  return Color(int.parse(x.substring(1, 7), radix: 16) + 0xFF000000);
}