import 'package:aurora_fruts/models/product.dart';
import 'package:aurora_fruts/ui/pages/product_details/product_details.dart';
import 'package:flutter/material.dart';

class CardElement extends StatelessWidget {
  final Color color;
  final Product product;
  CardElement({this.color, this.product});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.0,
      margin: EdgeInsets.only(right: 8.0),
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetails(product: product))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 110.0,
              width: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: color ?? Theme.of(context).primaryColor,
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    product.images[0],
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(height: 4.0),
            Text(
              "${product.name[0].toUpperCase()}${product.name.substring(1)}",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 15.0),
            ),
            Text(
              "${product.provider[0].toUpperCase()}${product.provider.substring(1)}",
              style: TextStyle(color: Colors.grey, fontSize: 12.0),
            )
          ],
        ),
      ),
    );
  }
}
