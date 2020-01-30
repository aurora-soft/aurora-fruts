import 'package:aurora_fruts/models/user.dart';
import 'package:flutter/material.dart';

class MainInformation extends StatelessWidget {
  final User user;
  MainInformation({this.user});

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

  Widget _informationAditional({IconData icon, String data}) {
    return Row(
      children: <Widget>[
        Icon(icon, color: Colors.grey),
        SizedBox(width: 8.0),
        Text(data, style: TextStyle(color: Colors.grey))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:16.0),
      child: Column(
        children: <Widget>[
          _pictureInformation(),
          SizedBox(height: 16.0),
          _informationAditional(icon: Icons.phone, data: user.telephone),
          SizedBox(height: 8.0),
          _informationAditional(icon: Icons.mail, data: user.email),
        ],
      ),
    );
  }
}
