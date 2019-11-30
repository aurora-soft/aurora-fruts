import 'package:aurora_fruts/models/user.dart';
import 'package:flutter/material.dart';

User user = User(
    nickName: 'Louella Andrews',
    email: 'louella.andrews@example.com',
    tagProfile: 'nomada digital',
    nroOrders: 114,
    points: 215,
    telephone: '(591)77723937',
    imageProfile:
        "https://laboratoriosniam.com/wp-content/uploads/2018/07/michael-dam-258165-unsplash_WEB2.jpg");

List<String> menuTags = [
  'Mis listas',
  'Billetera',
  'Amigos',
  'Promociones',
  '¿Te gustaría ofrecer un producto?',
  'Configuraciones',
  'Acerca de',
];

List<IconData> iconsMenu = [
  Icons.favorite,
  Icons.credit_card,
  Icons.people,
  Icons.local_offer,
  Icons.store_mall_directory,
  Icons.settings,
  Icons.info
];