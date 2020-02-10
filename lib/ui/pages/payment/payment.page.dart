import 'package:aurora_fruts/data/provider/cart_provider.dart';
import 'package:aurora_fruts/models/cart.dart';
import 'package:aurora_fruts/models/product.dart';
import 'package:aurora_fruts/ui/common_widgets/cart.widget.dart';
import 'package:flutter/material.dart';
import 'package:aurora_fruts/ui/templates/section_base.dart' as sectionBase;
import 'package:provider/provider.dart';
import '../../../data/example/card.example.dart' as Cards;
import 'package:aurora_fruts/ui/common_widgets/buttons.dart' as buttons;
import 'package:aurora_fruts/ui/pages/payment/business_logic.dart/business_logic.dart'
    as blpayment;

Cart cart;

class PaymentPage extends StatelessWidget {
  final _cards = Cards.listCards;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    cart = cartProvider.cart;
    return sectionBase.SectionBase(
      subtitle: 'Pagos',
      backButton: true,
      title: '',
      body: Column(
        children: <Widget>[
          _listCards(),
          _summary(context),
          SizedBox(height: 32.0),
          buttons.ButtonBase(
            title: 'Pagar Orden',
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => PaymentPage())),
          ),
        ],
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
    List<Product> _products = cart.productList.keys.toList();
    List<int> _cantidades = cart.productList.values.toList();
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _products.length,
      itemBuilder: (context, item) {
        if (cart.productList.length <= 0) {
          return Center(child: Text('no items'));
        } else {
          return ItemCart(
            imageLink: _products[item].photos[0],
            name: _products[item].name,
            quantity: _cantidades[item],
            price: blpayment.getPrice(_products[item], _cantidades[item]),
            includeImage: false,
          );
        }
      },
    );
  }
}
