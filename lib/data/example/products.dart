import 'package:aurora_fruts/models/product.dart';

Product productExample = Product(
  name: 'té de manzana',
  weight: '500 ml',
  description:
      'Un tipo de jugo de fruta que se hace de la pulpa de manzanas procesadas para su jugo. Es un líquido muy claro del que se ha eliminado la pulpa. Este jugo a menudo se usa para dar sabor a las carnes, o como ingrediente en aderezos y salsas, agregando un sabor dulce a manzana.',
  price: 10.5,
  provider: 'fresh fruits inc.',
  labels: ['jugo', 'destilado', 'bebida caliente'],
  ingredients: ['pulpa de manzana', 'azucar', 'canela', 'agua'],
  images: [
    'https://masvaletener.com/wp-content/uploads/2016/01/te-de-manzana-beneficios.jpg',
    'http://ajuaa.com/wp-content/uploads/2018/10/jugo_manzana.jpg',
  ],
);
