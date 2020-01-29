import 'package:aurora_fruts/ui/pages/schedule/schedule.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../data/constants.dart' as constant;
import '../../../data/example/card_section.dart' as section;
import '../../../utils/config.dart' as config;
import '../cart/cart.dart';
import '../favourites/favourites.dart';
import '../profile/profile.dart';
import 'widgets/cards_section.dart';
import 'widgets/cards_section_categories.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CupertinoTabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = CupertinoTabController(initialIndex: 2);
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
            context: context,
            builder: (BuildContext context) {
              return CupertinoAlertDialog(
                title: new Text("Salir"),
                content: new Text("Estas seguro que deseas salir"),
                actions: <Widget>[
                  CupertinoDialogAction(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: Text("Si"),
                  ),
                  CupertinoDialogAction(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text("No"),
                  )
                ],
              );
            })) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CupertinoTheme(
          data: CupertinoThemeData(
              primaryColor: config.convertColor(constant.colors['primary'])),
          child: CupertinoTabScaffold(
            controller: _tabController,
            tabBar: CupertinoTabBar(
              border: Border(top: BorderSide(color: Colors.grey[300])),
              backgroundColor: CupertinoColors.white,
              items: [
                for (int i = 0; i < constant.iconsNavigationBar.length; i++)
                  BottomNavigationBarItem(
                      icon: Icon(constant.iconsNavigationBar[i]),
                      title: Text(constant.textNavigationBar[i]))
              ],
            ),
            tabBuilder: (context, index) {
              return CupertinoTabView(
                builder: (context) {
                  switch (index) {
                    case 0:
                      return SchedulePage();
                      break;
                    case 1:
                      return CartView();
                      break;
                    case 2:
                      return HomeContent();
                      break;
                    case 3:
                      return Favorites();
                      break;
                    case 4:
                      return ProfileView();
                      break;
                    default:
                      return Container();
                      break;
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  Widget _search(BuildContext context) {
    //TODO: change to search function
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey[400], blurRadius: 5.0, spreadRadius: 1.0)
          ]),
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

  Widget _background(BuildContext context) {
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
          padding: EdgeInsets.only(bottom: 35.0),
          height: 215.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.transparent,
              Colors.white.withOpacity(0.5),
              Colors.white.withOpacity(0.6),
              Colors.white
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: Center(
            child: Text(
              'Ametis Food',
              style: TextStyle(
                fontFamily: 'Pacifico-Regular',
                fontSize: 42.0,
                color: Colors.black87,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          height: 190.0,
          child:
              Align(alignment: Alignment.bottomCenter, child: _search(context)),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _background(context),
        Column(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).padding.top),
            SizedBox(height: 165.0),
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 78.0 - 164.7,
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
                          color: Theme.of(context).primaryColor,
                          description: section.informationCardsSection[i],
                        )
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
