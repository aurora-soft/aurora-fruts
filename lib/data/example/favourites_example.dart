import 'package:aurora_fruts/models/favourites.dart';
import 'package:aurora_fruts/data/example/products.dart';

Favourites _favourites1 = Favourites(
  name: 'favoritos',
  tag: 'preferidos por mi',
  productos: {
    productExample1.name: productExample1,
    productExample2.name: productExample2,
  },
);

Favourites _favourites2 = Favourites(
  name: 'saludables y organicos',
  tag: 'frutos secos y mas',
  productos: {
    productExample3.name: productExample3,
    productExample2.name: productExample2,
    productExample1.name: productExample1
  },
);

Favourites _favourites3 = Favourites(
  name: 'bebidas deliciosas',
  tag: 'bebidas para acompañar',
  productos: {
    productExample1.name: productExample1,
    productExample4.name: productExample4,
  },
);

List<Favourites> listFavourites = [_favourites1, _favourites2, _favourites3];
