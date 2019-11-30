import 'package:aurora_fruts/ui/common_widgets/titlesBar.dart';
import 'package:flutter/material.dart';
import 'package:aurora_fruts/data/example/card_section.dart' as section;

class Categories extends StatelessWidget {
  Widget _categoriesList() {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverGrid.count(
            childAspectRatio: 1.4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              for (int i = 0; i < section.titlesCategories.length; i++)
                _CategorieCard(
                  title: section.titlesCategories[i],
                  color: section.colorsCategoriesCards[
                      i % section.colorsCategoriesCards.length],
                ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 24.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              TitlesBar(h1: 'Todas las', h2: 'Categorías'),
            ],
          ),
          SizedBox(height: 32.0),
          Expanded(child: _categoriesList()),
        ],
      ),
    );
  }
}

class _CategorieCard extends StatelessWidget {
  final String title;
  final Color color;
  _CategorieCard({this.color, this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //TODO: go to categorie screen
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  color,
                  color.withOpacity(0.9),
                  color.withOpacity(0.7),
                  color.withOpacity(0.4)
                ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "${title[0].toUpperCase()}${title.substring(1)}",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w300),
            ),
            Text(
              '> ver todo',
              style: TextStyle(color: Colors.white54),
            )
          ],
        ),
      ),
    );
  }
}
