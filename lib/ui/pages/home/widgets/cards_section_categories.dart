import 'package:aurora_fruts/ui/pages/categories/categories.dart';
import 'package:aurora_fruts/ui/pages/list_products/list_products.dart';
import 'package:flutter/material.dart';
import 'package:aurora_fruts/data/config_app/card_section.dart' as section;

///Card Section categories
///a [card section] especial for to show categories in app

class CardSectionCategories extends StatelessWidget {
  final String title;
  CardSectionCategories({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      height: 125.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('$title', style: Theme.of(context).textTheme.overline),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Categories()));
                      },
                      child: SizedBox(
                        height: 25.0,
                        child: Text('Ver todo',
                            style: Theme.of(context).textTheme.button),
                      )),
                ],
              ),
            ),
          ),
          Expanded(
            //child:CardInformation(),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  SizedBox(width: 16.0),
                  for (int i = 0; i < section.titlesCategories.length; i++)
                    CardElementCategories(
                      title: section.titlesCategories[i],
                      color: section.colorsCategoriesCards[
                          i % section.colorsCategoriesCards.length],
                    ),
                  SizedBox(width: 8.0),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CardElementCategories extends StatelessWidget {
  final Color color;
  final String title;
  CardElementCategories({this.color, this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => ListProducts(title: title,color: color,))),
      child: Container(
        margin: EdgeInsets.only(right: 8.0),
        padding: EdgeInsets.all(8.0),
        height: 75.0,
        width: 100,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(6.0)),
        child: Center(
          child: Text('${title[0].toUpperCase()}${title.substring(1)}',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 15.0)),
        ),
      ),
    );
  }
}
