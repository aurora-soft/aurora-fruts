import 'package:aurora_fruts/models/product.dart';
import 'package:flutter/material.dart';
import 'package:aurora_fruts/data/constants.dart' as constant;
import 'package:aurora_fruts/utils/config.dart' as config;

class PresentationProduct extends StatelessWidget {
  final Product product;
  PresentationProduct({this.product});

  Widget _imageBuilder(BuildContext context) {
    return Transform.translate(
      offset: Offset(
          MediaQuery.of(context).size.width -
              MediaQuery.of(context).size.width * 0.55,
          -10.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: SizedBox(
            height: 200.0,
            width: 250.0,
            child: Image.network(
              product.images[0],
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          _imageBuilder(context),
          Information(
            product: product,
          ),
        ],
      ),
    );
  }
}

class Information extends StatelessWidget {
  final Product product;
  Information({this.product});

  Widget _rating(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Puntaje',
            //style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            style: Theme.of(context).textTheme.overline,
          ),
          Row(
            children: <Widget>[
              Icon(Icons.star, color: Colors.yellow[700]),
              Icon(Icons.star, color: Colors.yellow[700]),
              Icon(Icons.star, color: Colors.yellow[700]),
              Icon(Icons.star, color: Colors.yellow[700]),
              Icon(Icons.star_border, color: Colors.yellow[700])
            ],
          ),
          Text(
            'Altamente recomendado',
            style: TextStyle(color: Colors.grey, fontSize: 12.0),
          ),
          SizedBox(height: 8.0),
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                    text: product.discount != null
                        ? '\$ ${product.discount}\t'
                        : '\$ ${product.price}\t',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0)),
                TextSpan(
                    text: product.discount != null ? '${product.price}' : '',
                    style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 16.0,
                        decoration: TextDecoration.lineThrough))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _dataInformation() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            '${product.weight}',
            style: TextStyle(
                color: Colors.grey[300],
                fontWeight: FontWeight.bold,
                fontSize: 32.0),
          ),
        ),
        SizedBox(width: 16.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              'Ingredientes',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              margin: EdgeInsets.only(left: 0.0, bottom: 32.0),
              padding: EdgeInsets.all(8.0),
              width: 150.0,
              height: 150.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: config
                      .convertColor(constant.colors['neutral'])
                      .withOpacity(0.7)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  for (int i = 0; i < product.ingredients.length; i++)
                    Row(
                      children: <Widget>[
                        Text(
                          "*\t${product.ingredients[i][0].toUpperCase()}${product.ingredients[i].substring(1)}",
                          style: TextStyle(fontStyle: FontStyle.italic),
                        )
                      ],
                    )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8.0),
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(child: _rating(context)),
          _dataInformation(),
        ],
      ),
    );
  }
}
