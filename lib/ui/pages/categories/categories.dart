import 'package:aurora_fruts/ui/pages/categories/widgets/categorie_card.dart'as card;
import 'package:flutter/material.dart';
import 'package:aurora_fruts/data/config_app/card_section.dart' as section;
import 'package:aurora_fruts/ui/templates/section_base.dart'as sectionBase;

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
                card.CategorieCard(
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
    return sectionBase.SectionBase(
      title: 'Todas las',
      subtitle: 'Categorías',
      backButton: true,
      defaultPadding: false,
      body: _categoriesList(),
    );
  }
}


