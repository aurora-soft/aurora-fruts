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
              ))
        ],
      ),
    );
  }
}
