import 'package:aurora_fruts/models/cart.dart';
import 'package:aurora_fruts/models/product.dart';
import 'package:aurora_fruts/ui/common_widgets/cart.widget.dart';
import 'package:flutter/material.dart';
import 'package:aurora_fruts/ui/pages/cart/business_logic/business_logic.dart'as blItemCart;

class ListItemCart extends StatelessWidget {

  final Cart cart;
  ListItemCart({this.cart});

  @override
  Widget build(BuildContext context) {
    List<Product> _products = cart.productList.keys.toList();
    List<int> _cantidades = cart.productList.values.toList();
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: cart.productList.length,
      itemBuilder: (context, item) {
        return ItemCart(
          imageLink: _products[item].images[0],
          name: _products[item].name,
          quantity: _cantidades[item],
          price: blItemCart.getPrice(_products[item], _cantidades[item]),
          includeImage: true,
        );
      },
    );
  }
}
