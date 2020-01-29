import 'package:aurora_fruts/models/cart.dart';
import 'package:aurora_fruts/models/product.dart';
import 'package:aurora_fruts/ui/common_widgets/cart.widget.dart';
import 'package:aurora_fruts/ui/common_widgets/titlesBar.dart';
import 'package:flutter/material.dart';
import 'package:aurora_fruts/data/example/cart_example.dart' as carex;

import '../../../data/example/card.example.dart' as Cards;

class PaymentPage extends StatelessWidget {
  final Cart cartExample = carex.carrito;
  final _cards = Cards.listCards;

  final _textSubtitle = TextStyle(
    color: Colors.black54,
  );

  final _textSubtitle2 = TextStyle(
    color: Colors.black87,
    fontSize: 16.0,
  );
  final _textSubtitle3 = TextStyle(
    color: Colors.black87,
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
  );

  double _getPrice(Product product, int quantity) {
    double _discount =
        product.discount != null ? product.discount : product.price;
    double result = quantity * _discount;
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: TitlesBar(h1: 'Pagos', h2: ''),
        iconTheme: IconThemeData(color: Colors.black54),
      ),
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(
            right: 16.0,
            left: 16.0,
            top: MediaQuery.of(context).padding.top + 24.0),
        // color: Colors.grey[100],
        child: Column(
          children: <Widget>[
            _listCards(),
            _summary(context),
            Spacer(),
            _confirmationButton(context),
          ],
        ),
      ),
    );
  }

  Widget _listCards() {
    return Container(
      height: 175.0,
      // color: Colors.amber,
      child: ListView.builder(
        itemBuilder: buildListCards,
        itemCount: _cards.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget buildListCards(BuildContext context, int i) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: i == 0
              ? Theme.of(context).primaryColor
              : Theme.of(context).primaryColor.withOpacity(0.3),
        ),
        margin: EdgeInsets.all(20.0),
        padding: EdgeInsets.all(20.0),
        width: 150.0,
        height: 175.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              _cards[i].nameCard,
              style: TextStyle(
                  color: i != 0 ? Theme.of(context).primaryColor : Colors.white,
                  fontSize: 26.0,
                  fontWeight: FontWeight.w800),
            ),
            Text(
              'xxxx  ${_cards[i].lastFourDigits}',
              style: TextStyle(
                  color: i != 0 ? Colors.black.withOpacity(0.65) : Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              'Expire ${_cards[i].expiration}',
              style: TextStyle(
                  color: i != 0 ? Colors.black54 : Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ));
  }

  Widget _summary(BuildContext context) {
    List<Product> _products = cartExample.productList.keys.toList();
    List<int> _cantidades = cartExample.productList.values.toList();
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: carex.carrito.productList.length,
      itemBuilder: (context, item) {
        return ItemCart(
          imageLink: _products[item].images[0],
          name: _products[item].name,
          quantity: _cantidades[item],
          price: _getPrice(_products[item], _cantidades[item]),
          includeImage: false,
        );
      },
    );
  }

  Widget _confirmationButton(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => PaymentPage())),
      child: Container(
        height: 50.0,
        width: MediaQuery.of(context).size.width - 32,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Theme.of(context).accentColor.withOpacity(0.9),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[400], blurRadius: 5.0, spreadRadius: 2.0)
            ]),
        child: Center(
          child: Text(
            'Pagar Orden',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}
