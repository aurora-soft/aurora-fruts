import 'package:aurora_fruts/ui/pages/list_products/list_products.dart';
import 'package:flutter/material.dart';

class CategorieCard extends StatelessWidget {
  final String title;
  final Color color;
  CategorieCard({this.color, this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ListProducts(
                    title: title,
                    color: color,
                  ))),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  color,
                  color.withOpacity(0.9),
                  color.withOpacity(0.7),
                  color.withOpacity(0.4)
                ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "${title[0].toUpperCase()}${title.substring(1)}",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w300),
            ),
            Text(
              '> ver todo',
              style: TextStyle(color: Colors.white54),
            )
          ],
        ),
      ),
    );
  }
}
