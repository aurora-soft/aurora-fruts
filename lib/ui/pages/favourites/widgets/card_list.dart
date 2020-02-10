import 'package:aurora_fruts/models/collection.dart';
import 'package:aurora_fruts/models/product.dart';
import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  final Collection favourite;
  CardList({this.favourite});

  Widget _image(String link) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: SizedBox(
            height: 98.0,
            width: 100.0,
            child: Image.network(link, fit: BoxFit.cover)),
      ),
    );
  }

  Widget _listImages(BuildContext context) {
    List<Product> _productList = favourite.products;
    return Padding(
      padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          for (int i = 0; i < _productList.length; i++)
            _image(_productList[i].photos[0])
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.only(left: 32.0, top: 16.0, bottom: 16.0),
      height: 240.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "${favourite.name[0].toUpperCase()}${favourite.name.substring(1)}",
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.grey[600],
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4.0),
          Text("${favourite.tag}", style: TextStyle(color: Colors.grey)),
          _listImages(context),
          Align(
            alignment: Alignment.bottomRight,
            child: RichText(
              text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: [
                    TextSpan(
                        text: 'Productos:\t\t',
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: '+${favourite.products.length}\t\t',
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 32.0,
                            fontWeight: FontWeight.w300))
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
