import 'package:aurora_fruts/models/product.dart';
import 'package:flutter/widgets.dart';

class SnackProvider with ChangeNotifier {
  Product _product = Product();

  Product get product => _product;
  set product(Product newProduct) {
    _product = newProduct;
    notifyListeners();
  }
}
