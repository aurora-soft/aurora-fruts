import 'package:aurora_fruts/models/product.dart';

List<Product> products = [
  productExample1,
  productExample2,
  productExample3,
  productExample4
];

List<Product> ensaladasProducts = [
  productExample5,
  productExample6,
  productExample7,
];

Product productExample1 = Product(
  name: 'té de manzana',
  discount: 1.42,
  weight: '500 ml',
  description:
      'Un tipo de jugo de fruta que se hace de la pulpa de manzanas procesadas para su jugo. Es un líquido muy claro del que se ha eliminado la pulpa. Este jugo a menudo se usa para dar sabor a las carnes, o como ingrediente en aderezos y salsas, agregando un sabor dulce a manzana.',
  price: 1.62,
  provider: 'fresh fruits inc.',
  labels: ['jugo', 'destilado', 'bebida caliente'],
  ingredients: ['pulpa de manzana', 'azucar', 'canela', 'agua'],
  images: [
    'http://ajuaa.com/wp-content/uploads/2018/10/jugo_manzana.jpg',
  ],
);

Product productExample2 = Product(
  name: 'galletas de avena',
  weight: '800 gr',
  description:
      'Más que un postre rico y crujiente, estas galletas de avena son beneficiosas para llevar a cabo una buena digestión. Además, estas galletas nos aportan mucha energía sin abusar de los carbohidratos.',
  price: 3.40,
  provider: 'la estancia',
  labels: ['producto integral', 'galletas'],
  observer: 'Delicious Food (La Paz)',
  deliveryScheduale: '08:00 - 12:00 A.M.',
  // observer: 'mantener en un envase biodegradable, como bolsas de papel',
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
    'https://images-gmi-pmc.edge-generalmills.com/d250d157-1974-4dc8-9b43-3f3889f53a52.jpg',
  ],
);

Product productExample3 = Product(
  name: 'almendras',
  discount: 4.50,
  weight: '500 gr',
  description:
      'Las almendras proporcionan mucha energía, proteínas, minerales, vitaminas y fibra. Además, la mayoría de las grasas que contienen son insaturadas y reducen el colesterol en la sangre.',
  price: 8.20,
  provider: 'fresh fruits inc.',
  labels: ['jugo', 'destilado', 'bebida caliente'],
  ingredients: ['pulpa de manzana', 'azucar', 'canela', 'agua'],
  images: [
    'https://mlstaticquic-a.akamaihd.net/almendras-x-12-kiloventa-min1-kg-leer-descripcion-D_NQ_NP_952483-MLU27371602157_052018-F.jpg',
  ],
);

Product productExample4 = Product(
  name: 'zumo de tomate',
  discount: 2.3,
  weight: '600 ml',
  description:
      'El jugo de tomate o zumo de tomate es un preparado procedente del jugo de los tomates que se suele emplear como bebida. ',
  price: 2.5,
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
  observer:
      'mantener el producto a una temperatura al rededor de los 10°C a 15°C',
  images: [
    'https://cdn.cookmonkeys.es/recetas/medium/zumo-de-tomate-preparado-en-thermomix-13665.jpg',
  ],
);

Product productExample5 = Product(
  name: 'Ensalada de fruta simple',
  discount: 0.0,
  weight: '600 ml',
  description:
      'Ensalada de fruta simple, contiene una gran variedad de frutas frescas de la temporada',
  price: 10.0,
  provider: 'Fresh Fruits inc.',
  labels: ['Ensalada', 'Frutas'],
  ingredients: [
    'Manzanas',
    'Plátano',
    'Papaya',
    'Piña',
    'Uvas',
  ],
  observer: 'Delicious Food',
  images: [
    'https://t2.rg.ltmcdn.com/es/images/1/7/3/img_ensalada_de_frutas_26371_600.jpg',
  ],
);

Product productExample6 = Product(
  name: 'Ensalada de fruta con yogurt',
  discount: 0.0,
  weight: '600 ml',
  description:
      'Ensalada de fruta simple, contiene una gran variedad de frutas frescas de la temporada, adicionalmente viene con el yogurt de su preferencia',
  price: 12.0,
  provider: 'Fresh Fruits inc.',
  labels: ['Ensalada', 'Frutas'],
  ingredients: [
    'Manzanas',
    'Plátano',
    'Papaya',
    'Piña',
    'Uvas',
    'Yogurt',
  ],
  observer: 'Delicious Food',
  images: [
    'https://cheforopeza.com.mx/wp-content/uploads/2017/11/ensalada-yogurt-web.jpg',
  ],
);

Product productExample7 = Product(
  name: 'Ensalada de fruta con yogurt y granola',
  discount: 0.0,
  weight: '600 ml',
  description:
      'Ensalada de fruta simple, contiene una gran variedad de frutas frescas de la temporada, adicionalmente viene con granola y el yogurt de su preferencia',
  price: 12.0,
  provider: 'Fresh Fruits inc.',
  labels: ['Ensalada', 'Frutas'],
  ingredients: [
    'Manzanas',
    'Plátano',
    'Papaya',
    'Piña',
    'Uvas',
    'Yogurt',
    'Granola'
  ],
  observer: 'Delicious Food',
  images: [
    'https://www.solocontestas.com/wp-content/uploads/2013/08/Fruta-Mixta-con-Yogur.jpg',
  ],
);
