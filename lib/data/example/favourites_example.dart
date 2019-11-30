import 'package:aurora_fruts/models/favourites.dart';
import 'package:aurora_fruts/data/example/products.dart';

Favourites favourites1 = Favourites(
  name: 'favoritos',
  tag: 'preferidos por mi',
  productos: {
    productExample1.name: productExample1,
    productExample2.name: productExample2,
  },
);

Favourites favourites2 = Favourites(
  name: 'saludables y organicos',
  tag: 'frutos secos y mas',
  productos: {
    productExample3.name: productExample3,
    productExample2.name: productExample2,
    productExample1.name: productExample1
  },
);

Favourites favourites3 = Favourites(
  name: 'bebidas deliciosas',
  tag: 'bebidas para acompañar',
  productos: {
    productExample1.name: productExample1,
    productExample4.name: productExample4,
  },
);

List<Favourites> listFavourites = [favourites1, favourites2, favourites3];
