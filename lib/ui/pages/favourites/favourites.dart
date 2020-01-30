import 'package:flutter/material.dart';
import 'package:aurora_fruts/ui/templates/section_base.dart' as sectionBase;
import 'package:aurora_fruts/data/example/favourites_example.dart' as fex;
import 'package:aurora_fruts/ui/pages/favourites/widgets/favourite_list.dart' as favlist;

class Favorites extends StatelessWidget {

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
      margin: EdgeInsets.only(bottom: 36.0),
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
    return sectionBase.SectionBase(
      title: 'Mis',
      subtitle: 'Favoritos',
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            _search(context),
            _addListsButton(context),
            favlist.FavouriteList(lists: fex.listFavourites,)
          ],
        ),
      ),
    );
  }
}
