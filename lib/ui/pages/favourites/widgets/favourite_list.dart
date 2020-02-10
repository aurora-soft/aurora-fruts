import 'package:aurora_fruts/models/collection.dart';
import 'package:flutter/material.dart';
import 'package:aurora_fruts/ui/pages/favourites/widgets/card_list.dart';
import 'package:aurora_fruts/ui/common_widgets/messages.dart'as message;

class FavouriteList extends StatelessWidget {
  final List<Collection> lists;

  FavouriteList({this.lists});

  @override
  Widget build(BuildContext context) {
    if (lists == null) {
      return message.Message(message: 'no existen favoritos');
    } else {
      return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: lists.length,
        itemBuilder: (context, index) {
          if (lists.length <= 0) {
            return message.Message(message: 'no existen favoritos');
          } else {
            return CardList(favourite: lists[index]);
          }
        },
      );
    }
  }
}
