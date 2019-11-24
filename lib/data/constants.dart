import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

Map<String, String> colors = {
  'primary': '#618C20',
  'neutral': '#CDE855',
  'secundary': '#F2A20C',
  'tertiary': '#EB1F12'
};
const List<IconData> iconsNavigationBar = [
  CupertinoIcons.home,
  CupertinoIcons.folder,
  CupertinoIcons.folder,
  CupertinoIcons.person
];

const List<String> textNavigationBar = [
  "Inicio",
  "Page 2",
  "Page 3",
  "Mi cuenta"
];
const List<String> cardsSectionTitles = [
  'Ofertas',
  'Categorias',
  'Mejor Calificadas',
  'Novedades',
];

List<String> colorsListCards = [
  colors['primary'],
  colors['secundary'],
  colors['tertiary']
];

List<String> informationCardsSection = [
  'Descubre lo que nuestros distribuidores ofertan para ti y ahorra tus recursos',
  'Descubre un sin fin de categorias sobre nuestros productos',
  'Descubre e interactua con los mejores productos calificados por la comunidad',
  'Descubre un nuevo mundo de sabores con nuestras novedades'
];
