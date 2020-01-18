import 'package:flutter/material.dart';

class ReviewsUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Reseñas',
            style: Theme.of(context).textTheme.overline,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.star, color: Colors.yellow[700]),
                Icon(Icons.star, color: Colors.yellow[700]),
                Icon(Icons.star, color: Colors.yellow[700]),
                Icon(Icons.star_border, color: Colors.yellow[700]),
                Icon(Icons.star_border, color: Colors.yellow[700])
              ],
            ),
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text('Tu calificación',
                    style: TextStyle(color: Colors.grey[700])),
              )),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 160.0,
            child: Column(
              children: <Widget>[
                Text(
                  'Es una gran opción para comer algo a media mañana, es una merienda muy rica y fresca',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[500], fontSize: 16.0),
                ),
                Divider(),
                Text(
                  'Gran opcíon para escoger cuando tienes que comer algo saludable en la mañana',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[500], fontSize: 16.0),
                ),
                Divider(),
                Text(
                  'Yo siempre como 2 a la semana, me ayudo mucho a seguir mi dieta',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[500], fontSize: 16.0),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
