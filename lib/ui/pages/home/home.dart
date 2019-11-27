import 'package:aurora_fruts/ui/pages/home/widgets/cards_section_categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aurora_fruts/data/constants.dart' as constant;
import 'package:aurora_fruts/ui/pages/home/widgets/cards_section.dart';
import 'package:aurora_fruts/data/example/card_section.dart' as section;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _picker;

  @override
  void initState() {
    super.initState();
    _picker = 0;
  }

  void _changePicker(picker) => setState(() => _picker = picker);

  List<Widget> _bodyItems = <Widget>[
    HomeContent(),
    Container(),
    Container(),
    Container()
  ];

  Widget _search() {
    //TODO: change to search function
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[400],
            blurRadius: 5.0,
            spreadRadius: 1.0
          )
        ]
      ),
      height: 50.0,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          Icon(
            Icons.search,
            color: Colors.grey,
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: Text(
              '¿Qué estás buscando?',
              style: TextStyle(color: Colors.grey[600]),
            ),
          )
        ],
      ),
    );
  }

  Widget _background() {
    return Stack(
      children: <Widget>[
        Container(
            height: 215.0,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/fruits.jpg'),
              fit: BoxFit.cover,
            ))),
        Container(
          padding: EdgeInsets.only(bottom: 15.0),
          height: 215.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.transparent,
              Colors.white.withOpacity(0.3),
              Colors.white.withOpacity(0.7),
              Colors.white.withOpacity(0.9),
              Colors.white
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: Center(
            child: Text(
              'Joice Food',
              style: TextStyle(
                fontFamily: 'Helvetica',
                fontSize: 42.0,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          height: 190.0,
          child: Align(alignment: Alignment.bottomCenter, child: _search()),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            _background(),
            Column(
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).padding.top),
                SizedBox(height: 165.0),
                _bodyItems[_picker]
              ],
            ),
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: 56.0,
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.white,
            ),
            child: BottomNavigationBar(
                onTap: (picker) => _changePicker(picker),
                currentIndex: _picker,
                selectedItemColor: Colors.black,
                selectedLabelStyle:
                    TextStyle(color: Colors.black, fontSize: 14.0),
                unselectedItemColor: Colors.grey[500],
                unselectedLabelStyle: TextStyle(color: Colors.grey[600]),
                items: [
                  for (int i = 0; i < constant.iconsNavigationBar.length; i++)
                    BottomNavigationBarItem(
                        icon: Icon(constant.iconsNavigationBar[i]),
                        title: Text(constant.textNavigationBar[i]))
                ]),
          ),
        ));
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 84.0 - 165,
      child: Padding(
        padding: EdgeInsets.only(left: 0.0, right: 0.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              for (int i = 0; i < section.cardsSectionTitles.length; i++)
                if (section.cardsSectionTitles[i] == 'Categorías')
                  CardSectionCategories(
                    title: section.cardsSectionTitles[i],
                  )
                else
                  CardSection(
                    icon: section.iconCardSection[i],
                    title: section.cardsSectionTitles[i],
                    color: section.colorsListCards[i % 4],
                    description: section.informationCardsSection[i],
                  )
            ],
          ),
        ),
      ),
    );
  }
}
