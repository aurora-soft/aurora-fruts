import 'package:aurora_fruts/models/product.dart';

class Favourites {
  String name;
  String tag;
  Map<String, Product> productos;
  Favourites({this.productos, this.name,this.tag});
}
