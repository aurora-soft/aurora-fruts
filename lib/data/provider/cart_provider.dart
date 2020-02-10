import 'package:aurora_fruts/models/cart.dart';
import 'package:flutter/widgets.dart';

class CartProvider with ChangeNotifier {
  Cart _cart = Cart(productList: {});

  Cart get cart => _cart;
  set cart(Cart newCart) {
    _cart = newCart;
    notifyListeners();
  }
}
