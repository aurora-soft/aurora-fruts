import 'package:aurora_fruts/models/cart.dart';
import 'package:aurora_fruts/models/product.dart';
import 'package:aurora_fruts/ui/common_widgets/cart.widget.dart';
import 'package:aurora_fruts/ui/pages/payment/payment.page.dart';
import 'package:aurora_fruts/ui/pages/schedule/schedule.page.dart';
import 'package:flutter/material.dart';
import 'package:aurora_fruts/data/example/cart_example.dart' as carex;
import 'package:aurora_fruts/ui/common_widgets/titlesBar.dart';

class CartView extends StatefulWidget {
  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final Cart cartExample = carex.carrito;

  double total;
  double _getPrice(Product product, int quantity) {
    double _discount =
        product.discount != null ? product.discount : product.price;
    double result = quantity * _discount;
    return result;
  }

  double _getTotal(List<Product> products, List<int> quantity) {
    double total = 0;
    for (int i = 0; i < products.length; i++) {
      double _price = products[i].discount != null
          ? products[i].discount
          : products[i].price;
      total = total + (_price * quantity[i]);
    }
    return total;
  }

  @override
  void initState() {
    super.initState();
    total = 0;
  }

  Widget _confirmationButton() {
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
            'Confirmar Orden',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget _scheduleButton() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SchedulePage()));
      },
      child: Container(
        height: 50.0,
        width: MediaQuery.of(context).size.width - 32,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Theme.of(context).accentColor.withOpacity(0.5),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[400], blurRadius: 5.0, spreadRadius: 2.0)
            ]),
        child: Center(
          child: Text(
            'Planear Entregas',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Product> _products = cartExample.productList.keys.toList();
    List<int> _cantidades = cartExample.productList.values.toList();

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 24.0,
        left: 16.0,
        right: 16.0,
      ),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TitlesBar(h1: 'Mi', h2: 'Orden'),
            SizedBox(height: 32.0),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: carex.carrito.productList.length,
              itemBuilder: (context, item) {
                return ItemCart(
                  imageLink: _products[item].images[0],
                  name: _products[item].name,
                  quantity: _cantidades[item],
                  price: _getPrice(_products[item], _cantidades[item]),
                  includeImage: true,
                );
              },
            ),
            SizedBox(height: 32.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Total:',
                  style: TextStyle(
                      fontSize: 32.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w300),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Bs. ${_getTotal(_products, _cantidades).toStringAsFixed(2)}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 36.0,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: _confirmationButton(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: _scheduleButton(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      //TODO: go to change points view
                    },
                    child: Text(
                      'Quiero utilizar mis puntos',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
