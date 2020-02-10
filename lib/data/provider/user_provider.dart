import 'package:aurora_fruts/models/user.dart';
import 'package:flutter/widgets.dart';

class UserProvider with ChangeNotifier {
  User _user = User();

  User get user => _user;
  set user(User newUser) {
    _user = newUser;
    notifyListeners();
  }
}
