import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

//Objects
Future<dynamic> readObject({@required String key}) async {
  final prefs = await SharedPreferences.getInstance();
  if (!prefs.containsKey(key)) {
    await saveObject(key: key, json: null);
  }
  return jsonDecode(prefs.getString(key)) ?? null;
}

Future<void> saveObject({@required String key, @required json}) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(key, json.encode(json));
}

//String
Future<String> readString({@required String key}) async {
  final prefs = await SharedPreferences.getInstance();
  if (!prefs.containsKey(key)) {
    await saveString(key: key, value: null);
  }
  return prefs.getString(key) ?? null;
}

Future<void> saveString({@required String key, @required String value}) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}

//int
Future<int> readInt({@required String key}) async {
  final prefs = await SharedPreferences.getInstance();
  if (!prefs.containsKey(key)) {
    await saveInt(key: key, value: 0);
  }
  return prefs.getInt(key) ?? 0;
}

Future<void> saveInt({@required String key, @required int value}) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt(key, value);
}

//int
Future<bool> readBool({@required String key}) async {
  final prefs = await SharedPreferences.getInstance();
  if (!prefs.containsKey(key)) {
    await saveBool(key: key, value: false);
  }
  return prefs.getBool(key) ?? false;
}

Future<void> saveBool({@required String key, @required bool value}) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool(key, value);
}

//double
Future<double> readDouble({@required String key}) async {
  final prefs = await SharedPreferences.getInstance();
  if (!prefs.containsKey(key)) {
    await saveDouble(key: key, value: 0.0);
  }
  return prefs.getDouble(key) ?? 0.0;
}

Future<void> saveDouble({@required String key, @required double value}) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setDouble(key, value);
}
