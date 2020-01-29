import 'package:flutter/material.dart';

class ItemCart extends StatelessWidget {
  final int quantity;
  final String imageLink;
  final String name;
  final double price;
  final bool includeImage;
  ItemCart(
      {this.name,
      this.quantity,
      this.price,
      this.imageLink,
      this.includeImage});

  Widget _imageProduct() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4.0),
      child: Container(
        height: 60.0,
        width: 80.0,
        color: Colors.blue,
        child: Image.network(
          imageLink,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: <Widget>[
          includeImage == true
              ? _imageProduct()
              : Container(
                  width: 0,
                  height: 0,
                ),
          SizedBox(width: 16.0),
          Text(quantity.toString(),
              style: Theme.of(context).textTheme.display4),
          Text("\t\tx\t\t", style: Theme.of(context).textTheme.display4),
          Expanded(
            child: SizedBox(
                width: 130.0,
                child: Text('${name[0].toUpperCase()}${name.substring(1)}',
                    style: Theme.of(context).textTheme.display4)),
          ),
          Text(
            "Bs. ${price.toStringAsFixed(2)}",
            style: TextStyle(color: Colors.grey, fontSize: 16.0),
          )
        ],
      ),
    );
  }
}
