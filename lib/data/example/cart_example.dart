import 'package:aurora_fruts/models/cart.dart';
import 'package:aurora_fruts/data/example/products.dart' as prex;

Cart carrito = Cart(
  productList: {
    prex.productExample1:1,
    prex.productExample2:1,
    prex.productExample3:1,
    prex.productExample4:1,
  },
);
