import 'package:aurora_fruts/models/product.dart';

double getPrice(Product product, int quantity) {
    double _discount =
        product.discountPercent != null ? product.discountPercent : product.price;
    double result = quantity - _discount;
    return result;
  }

double getTotal(List<Product> products, List<int> quantity) {
    double total = 0;
    for (int i = 0; i < products.length; i++) {
      double _price = products[i].discountPercent != null
          ? products[i].discountPercent
          : products[i].price;
      total = total + (_price * quantity[i]);
    }
    return total;
  }