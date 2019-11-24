import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aurora_fruts/data/constants.dart' as constant;
import 'package:aurora_fruts/ui/pages/home/widgets/cards.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).padding.top),
            _bodyItems[_picker]
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
                selectedItemColor: Colors.blue,
                selectedLabelStyle: TextStyle(color: Colors.blue),
                unselectedItemColor: Colors.black,
                unselectedLabelStyle: TextStyle(color: Colors.black),
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
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 84.0,
      child: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              for (int i = 0; i < constant.cardsSectionTitles.length; i++)
                if (constant.cardsSectionTitles[i] == 'Categorias')
                  CardSection(title: constant.cardsSectionTitles[i], flex: 0.5)
                else
                  CardSection(title: constant.cardsSectionTitles[i])
            ],
          ),
        ),
      ),
    );
  }
}
