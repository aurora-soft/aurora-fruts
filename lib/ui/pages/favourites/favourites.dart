import 'package:aurora_fruts/models/favourites.dart';
import 'package:aurora_fruts/ui/pages/favourites/widgets/card_list.dart';
import 'package:flutter/material.dart';
import 'package:aurora_fruts/ui/common_widgets/titlesBar.dart';
import 'package:aurora_fruts/data/example/favourites_example.dart' as fex;

class Favorites extends StatelessWidget {
  static List<Favourites> _lists = fex.listFavourites;

  Widget _addListsButton(BuildContext context) {
    return InkWell(
      onTap: () {
        //TODO: create new list
      },
      child: Container(
        height: 50.0,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey[400]),
            borderRadius: BorderRadius.circular(4.0)),
        child: Center(
          child: Text(
            '+ Añadir nueva lista',
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _search(BuildContext context) {
    //TODO: change to search function
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Colors.grey[300]))),
      height: 50.0,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          Icon(Icons.search, color: Colors.grey[400]),
          SizedBox(width: 8.0),
          Expanded(
            child: Text(
              '¿Qué estás buscando?',
              style: TextStyle(color: Colors.grey[500]),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
          right: 16.0,
          left: 16.0,
          top: MediaQuery.of(context).padding.top + 24.0),
      color: Colors.white,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TitlesBar(h1: 'Mis', h2: 'Favoritos'),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                child: _search(context)),
            _addListsButton(context),
            SizedBox(height: 28.0),
            for (int i = 0; i < _lists.length; i++)
              CardList(favourite: _lists[i])
          ],
        ),
      ),
    );
  }
}
