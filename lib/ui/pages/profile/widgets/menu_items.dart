import 'package:flutter/material.dart';
import 'package:aurora_fruts/data/example/user_example.dart' as us;

class MenuItems extends StatelessWidget {
  Widget _menuElement(
      {IconData icon,
      String title,
      BuildContext context,
      @required Widget route}) {
    return Material(
      color: Colors.white,
      child: ListTile(
        onTap: () {
          switch (title) {
            case 'Mis listas':
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => route));
              break;
            default:
              print('route');
              break;
          }
        },
        leading: Icon(icon, color: Theme.of(context).primaryColor),
        title: Text(title,
            style: TextStyle(color: Theme.of(context).primaryColor)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        for (int j = 0; j < us.iconsMenu.length; j++)
          _menuElement(
              route: us.navigation[j],
              icon: us.iconsMenu[j],
              title: us.menuTags[j],
              context: context),
        Divider(color: Colors.grey),
        ListTile(
          leading: Icon(Icons.power_settings_new, color: Colors.red),
          title: Text('Cerrar Sesión', style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }
}
