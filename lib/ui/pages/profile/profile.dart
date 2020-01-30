import 'package:aurora_fruts/models/user.dart';
import 'package:flutter/material.dart';
import 'package:aurora_fruts/data/example/user_example.dart' as us;
import 'package:aurora_fruts/ui/templates/section_base.dart' as sectionBase;
import 'package:aurora_fruts/ui/pages/profile/widgets/menu_items.dart' as menu;
import 'package:aurora_fruts/ui/pages/profile/widgets/main_information.dart'
    as mainInfo;

class ProfileView extends StatelessWidget {
  static User user = us.user;

  Widget _cardNumbers({String value, String key, bool right = false}) {
    return Container(
      height: 100.0,
      decoration: BoxDecoration(
          border: Border(
        top: BorderSide(color: Colors.grey),
        bottom: BorderSide(color: Colors.grey),
        right: right
            ? BorderSide(color: Colors.grey)
            : BorderSide(color: Colors.white),
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(value,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
          SizedBox(height: 4.0),
          Text(key, style: TextStyle(fontSize: 14.0, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _numbersUser() {
    return Row(
      children: <Widget>[
        Expanded(
          child: _cardNumbers(
              right: true, key: 'Puntos', value: user.points.toString()),
        ),
        Expanded(
            child:
                _cardNumbers(key: 'Ordenes', value: user.nroOrders.toString()))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return sectionBase.SectionBase(
      defaultPadding: false,
      title: 'Mi',
      subtitle: 'Cuenta',
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(0.0),
        child: Column(
          children: <Widget>[
            mainInfo.MainInformation(
              user: user,
            ),
            SizedBox(height: 16.0),
            _numbersUser(),
            SizedBox(height: 16.0),
            menu.MenuItems()
          ],
        ),
      ),
    );
  }
}
