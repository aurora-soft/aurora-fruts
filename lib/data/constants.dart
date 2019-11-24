import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Map<String, String> colors = {
  'primary': '#5B8C30',
  'neutral': '#D2D831',
  'secundary': '#F2A412',
  'tertiary': '#E8521E'
};
const List<IconData> iconsNavigationBar = [
  //CupertinoIcons.home,
  //CupertinoIcons.folder,
  //CupertinoIcons.folder,
  //CupertinoIcons.person
  Icons.home,
  Icons.folder,
  Icons.folder,
  Icons.person
];

const List<String> textNavigationBar = [
  "Inicio",
  "Page 2",
  "Page 3",
  "Mi cuenta"
];
const List<String> cardsSectionTitles = [
  'Ofertas',
  'Categorías',
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

List<IconData> iconCardSection = [
  IconData(0xe903, fontFamily: 'SectionIcons'),
  IconData(0xe901, fontFamily: 'SectionIcons'),
  IconData(0xe900, fontFamily: 'SectionIcons'),
  IconData(0xe902, fontFamily: 'SectionIcons'),
];