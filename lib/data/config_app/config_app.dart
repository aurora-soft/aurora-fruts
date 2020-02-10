import 'package:aurora_fruts/ui/pages/favourites/favourites.dart';
import 'package:flutter/material.dart';

const List<String> menuTags = [
  'Mis listas',
  'Billetera',
  'Amigos',
  'Promociones',
  '¿Te gustaría ofrecer un producto?',
  'Configuraciones',
  'Acerca de',
];

const List<IconData> iconsMenu = [
  Icons.favorite,
  Icons.credit_card,
  Icons.people,
  Icons.local_offer,
  Icons.store_mall_directory,
  Icons.settings,
  Icons.info
];

List<Widget> navigation = [
  Favorites(),
  Container(),
  Container(),
  Container(),
  Container(),
  Container(),
  Container()
];

List<IconData> iconCardSection = [
  IconData(0xe902, fontFamily: 'DetailsDescriptionIcons'),
  IconData(0xe901, fontFamily: 'DetailsDescriptionIcons'),
  IconData(0xe900, fontFamily: 'DetailsDescriptionIcons'),
];