import 'package:aurora_fruts/models/product.dart';

List<Product> products = [
  productExample1,
  productExample2,
  productExample3,
  productExample4
];

Product productExample1 = Product(
  name: 'té de manzana',
  discount: 8.42,
  weight: '500 ml',
  description:
      'Un tipo de jugo de fruta que se hace de la pulpa de manzanas procesadas para su jugo. Es un líquido muy claro del que se ha eliminado la pulpa. Este jugo a menudo se usa para dar sabor a las carnes, o como ingrediente en aderezos y salsas, agregando un sabor dulce a manzana.',
  price: 10.62,
  provider: 'fresh fruits inc.',
  labels: ['jugo', 'destilado', 'bebida caliente'],
  ingredients: ['pulpa de manzana', 'azucar', 'canela', 'agua'],
  images: [
    'https://masvaletener.com/wp-content/uploads/2016/01/te-de-manzana-beneficios.jpg',
    'http://ajuaa.com/wp-content/uploads/2018/10/jugo_manzana.jpg',
  ],
);

Product productExample2 = Product(
  name: 'galletas de avena',
  weight: '800 gr',
  description:
      'Más que un postre rico y crujiente, estas galletas de avena son beneficiosas para llevar a cabo una buena digestión. Además, estas galletas nos aportan mucha energía sin abusar de los carbohidratos.',
  price: 8.40,
  provider: 'la estancia',
  labels: ['producto integral', 'galletas'],
  observer: 'mantener en un envase biodegradable, como bolsas de papel',
  ingredients: [
    'copos de avena',
    'harina',
    'azucar morena',
    'sal',
    'huevos',
    'aceite de oliva',
    'avellana'
  ],
  images: [
    'https://www.enmicocinahoy.cl/wp-content/uploads/2013/02/galletas-avena-pasas-1024x708.jpg',
  ],
);

Product productExample3 = Product(
  name: 'almendras',
  discount: 10.50,
  weight: '500 gr',
  description:
      'Las almendras proporcionan mucha energía, proteínas, minerales, vitaminas y fibra. Además, la mayoría de las grasas que contienen son insaturadas y reducen el colesterol en la sangre.',
  price: 11.00,
  provider: 'la colmena',
  labels: ['frutos secos', 'producto natural', 'semillas'],
  images: [
    'https://mlstaticquic-a.akamaihd.net/almendras-x-12-kiloventa-min1-kg-leer-descripcion-D_NQ_NP_952483-MLU27371602157_052018-F.jpg',
  ],
);

Product productExample4 = Product(
  name: 'zumo de tomate',
  discount: 12.0,
  weight: '600 ml',
  description:
      'El jugo de tomate o zumo de tomate es un preparado procedente del jugo de los tomates que se suele emplear como bebida. ',
  price: 12.5,
  provider: 'fresh fruits inc.',
  labels: ['zumo', 'vegetales', 'bebida conservada'],
  ingredients: [
    'tomates rojos',
    'agua',
    'limon',
    'salsa picante',
    'salsa inglesa',
    'sal',
    'azucar',
    'hielo'
  ],
  observer: 'mantener el producto a una temperatura al rededor de los 10°C a 15°C',
  images: [
    'https://cdn.cookmonkeys.es/recetas/medium/zumo-de-tomate-preparado-en-thermomix-13665.jpg',
  ],
);
