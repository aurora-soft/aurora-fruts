import 'package:aurora_fruts/models/order.dart';
import 'package:flutter/widgets.dart';

class OrderProvider with ChangeNotifier{
  Order _order = Order();

  Order get order=> _order;
  set order(Order newOrder){
    _order = newOrder;
    notifyListeners();
  }
}