import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    Container(color: Colors.blue),
    Container(color: Colors.red),
    Container(color: Colors.yellow),
    Container(color: Colors.green)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyItems[_picker],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (picker) {
          _changePicker(picker);
        },
        currentIndex: _picker,
        selectedItemColor: Colors.blue,
        selectedLabelStyle: TextStyle(color: Colors.blue),
        unselectedItemColor: Colors.black,
        unselectedLabelStyle: TextStyle(color: Colors.black),
        items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.folder), title: Text('Page 2')),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.folder), title: Text('Page 3')),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person), title: Text('Account')),
        ],
      ),
    );
  }
}
