import 'package:aurora_fruts/models/favourites.dart';
import 'package:flutter/material.dart';
import 'package:aurora_fruts/ui/pages/favourites/widgets/card_list.dart';

class FavouriteList extends StatelessWidget {
  final List<Favourites> lists;

  FavouriteList({this.lists});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: lists.length,
      itemBuilder: (context, index) => CardList(favourite: lists[index]),
    );
  }
}
