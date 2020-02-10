import 'package:aurora_fruts/data/provider/cart_provider.dart';
import 'package:aurora_fruts/models/cart.dart';
import 'package:aurora_fruts/models/product.dart';
import 'package:aurora_fruts/ui/pages/payment/payment.page.dart';
import 'package:flutter/material.dart';
import 'package:aurora_fruts/ui/templates/section_base.dart' as sectionBase;
import 'package:aurora_fruts/ui/common_widgets/buttons.dart' as buttons;
import 'package:aurora_fruts/ui/pages/cart/widgets/list_itemCart.dart'
    as listItems;
import 'package:aurora_fruts/ui/pages/cart/business_logic/business_logic.dart'
    as blCart;
import 'package:provider/provider.dart';
import 'package:aurora_fruts/ui/common_widgets/messages.dart' as messages;

class CartView extends StatefulWidget {
  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  Cart cart;

  double total;

  Widget _totalPrice({List<Product> products, List<int> cantidades}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          'Total:',
          style: TextStyle(
              fontSize: 32.0, color: Colors.black, fontWeight: FontWeight.w300),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Bs. ${blCart.getTotal(products, cantidades).toStringAsFixed(2)}",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 36.0,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ),
      ],
    );
  }

  Widget _usePoints() {
    return Padding(
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
    );
  }

  Widget _body() {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    List<Product> products;
    List<int> cantidades;
    try {
      products = cartProvider.cart.productList.keys.toList();
      cantidades = cartProvider.cart.productList.values.toList();
    } catch (Exceptione) {}
    if (cartProvider.cart.productList.length <= 0) {
      return messages.Message(
        message: 'no hay elementos\nen el carrito',
      );
    } else {
      return Column(
        children: <Widget>[
          listItems.ListItemCart(cart: cart),
          SizedBox(height: 32.0),
          _totalPrice(products: products, cantidades: cantidades),
        ],
      );
    }
  }

  @override
  void initState() {
    super.initState();
    total = 0;
  }

  @override
  Widget build(BuildContext context) {
    return sectionBase.SectionBase(
        title: 'Mi',
        subtitle: 'Orden',
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              _body(),
              SizedBox(height: 32.0),
              buttons.ButtonBase(
                title: 'Confirmar Orden',
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PaymentPage())),
              ),
              SizedBox(height: 6.0),
              buttons.ButtonBase(
                title: 'Planear Entregas',
                onTap: () {
                  //TODO: change index tab bar
                },
              ),
              _usePoints()
            ],
          ),
        ));
  }
}
