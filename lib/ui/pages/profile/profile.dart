import 'package:aurora_fruts/models/user.dart';
import 'package:flutter/material.dart';
import 'package:aurora_fruts/data/example/user_example.dart' as us;
import 'package:aurora_fruts/ui/common_widgets/titlesBar.dart';

class ProfileView extends StatelessWidget {
  static User user = us.user;

  Widget _menuElement({IconData icon, String title, BuildContext context}) {
    return Material(
      color: Colors.white,
      child: ListTile(
        onTap: () {
          //TODO: navigate to option screen
        },
        leading: Icon(icon, color: Theme.of(context).primaryColor),
        title: Text(title,
            style: TextStyle(color: Theme.of(context).primaryColor)),
      ),
    );
  }

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

  Widget _informationAditional({IconData icon, String data}) {
    return Row(
      children: <Widget>[
        Icon(icon, color: Colors.grey),
        SizedBox(width: 8.0),
        Text(data, style: TextStyle(color: Colors.grey))
      ],
    );
  }

  Widget _pictureInformation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 100.0,
          width: 100.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              image: DecorationImage(
                  image: NetworkImage(user.imageProfile), fit: BoxFit.cover)),
        ),
        SizedBox(width: 32.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('${user.nickName}', style: TextStyle(fontSize: 24.0)),
            SizedBox(height: 8.0),
            Text(
              '${user.tagProfile[0].toUpperCase()}${user.tagProfile.substring(1)}',
              style: TextStyle(fontSize: 16.0, color: Colors.grey),
            )
          ],
        )
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
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Row(
                children: <Widget>[
                  TitlesBar(h1: 'Mi', h2: 'Cuenta'),
                  Expanded(
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.edit)),
                  )
                ],
              ),
            ),
            SizedBox(height: 32.0),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
              ),
              child: _pictureInformation(),
            ),
            SizedBox(height: 16.0),
            Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: _informationAditional(
                    icon: Icons.phone, data: user.telephone)),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: _informationAditional(icon: Icons.mail, data: user.email),
            ),
            SizedBox(height: 16.0),
            Row(
              children: <Widget>[
                Expanded(
                  child: _cardNumbers(
                      right: true,
                      key: 'Puntos',
                      value: user.points.toString()),
                ),
                Expanded(
                    child: _cardNumbers(
                        key: 'Ordenes', value: user.nroOrders.toString()))
              ],
            ),
            SizedBox(height: 16.0),
            for (int j = 0; j < us.iconsMenu.length; j++)
              _menuElement(
                  icon: us.iconsMenu[j],
                  title: us.menuTags[j],
                  context: context),
            Divider(color: Colors.grey),
            ListTile(
              leading: Icon(Icons.power_settings_new, color: Colors.red),
              title: Text('Cerrar Sesión', style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      ),
    );
  }
}
