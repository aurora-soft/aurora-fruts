import 'package:aurora_fruts/models/product.dart';

double getPrice(Product product, int quantity) {
    double _discount =
        product.discountPercent != null ? product.discountPercent : product.price;
    double result = quantity * _discount;
    return result;
  }