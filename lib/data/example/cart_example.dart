import 'package:aurora_fruts/models/cart.dart';
import 'package:aurora_fruts/data/example/products.dart' as prex;

Cart carrito = Cart(
  productList: {
    prex.productExample1: 2,
    prex.productExample2: 5,
    prex.productExample3: 3,
    prex.productExample4: 2,
  },
);
