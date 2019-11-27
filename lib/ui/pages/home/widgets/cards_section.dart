import 'package:aurora_fruts/models/product.dart';
import 'package:aurora_fruts/ui/pages/product_details/product_details.dart';
import 'package:flutter/material.dart';
import 'package:aurora_fruts/utils/config.dart' as config;
import 'package:aurora_fruts/data/example/products.dart' as proex;

class CardSection extends StatefulWidget {
  final String description;
  final String title;
  final String color;
  final IconData icon;
  CardSection({this.title, this.color, this.description, this.icon});

  @override
  _CardSectionState createState() => _CardSectionState();
}

class _CardSectionState extends State<CardSection> {
  bool isScrolling;

  @override
  void initState() {
    super.initState();
    isScrolling = false;
  }

  void _activateScroll() => setState(() => isScrolling = true);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      height: 200.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('${widget.title}',
                      style: Theme.of(context).textTheme.overline),
                  InkWell(
                      onTap: _activateScroll,
                      child: Text(isScrolling ? 'Ver todo' : 'Más',
                          style: Theme.of(context).textTheme.button)),
                ],
              ),
            ),
          ),
          Expanded(
            //child:CardInformation(),
            child: SingleChildScrollView(
              physics: isScrolling
                  ? BouncingScrollPhysics()
                  : NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  SizedBox(width: 16.0),
                  CardInformation(
                    description: widget.description,
                    color: widget.color,
                    isScrolling: isScrolling,
                    icon: widget.icon,
                    ontap: (activate) {
                      setState(() => isScrolling = activate);
                    },
                  ),
                  for (int i = 0; i < proex.products.length; i++)
                    CardElement(
                      color: widget.color,
                      product: proex.products[i],
                    ),
                  SizedBox(width: 8.0),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CardInformation extends StatefulWidget {
  bool isScrolling;
  final String color;
  final String description;
  final IconData icon;
  final Function(bool) ontap;
  CardInformation(
      {this.color, this.description, this.isScrolling, this.icon, this.ontap});
  @override
  _CardInformationState createState() => _CardInformationState();
}

class _CardInformationState extends State<CardInformation> {
  Widget _cover() {
    return InkWell(
      onTap: () {
        widget.ontap(false);
      },
      child: Container(
        height: 150.0,
        width: 130.0,
        decoration: BoxDecoration(
            color: config.convertColor(widget.color),
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.black45, blurRadius: 3.0, spreadRadius: 1.0)
            ]),
        child: Center(
          child: Icon(
            widget.icon,
            size: 54.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _information() {
    return Container(
      padding: EdgeInsets.only(top: 4.0, bottom: 4.0, right: 4.0, left: 130.0),
      margin: EdgeInsets.only(top: 16.0, bottom: 16.0, left: 8.0, right: 36.0),
      width: MediaQuery.of(context).size.width,
      height: 150.0,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 15.0, spreadRadius: 0.1)
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            widget.description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15.0, color: Colors.grey[700]),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () {
                  //TODO: go to list section screen
                },
                child: Text(
                  'Descubrir',
                  style: TextStyle(color: Colors.blue[800], fontSize: 16.0),
                ),
              ))
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8.0),
      padding: EdgeInsets.only(top: 4.0, bottom: 4.0, left: 4.0),
      width: widget.isScrolling ? 160.0 : MediaQuery.of(context).size.width,
      height: 150.0,
      child: Stack(
        children: <Widget>[
          Transform.translate(
              offset: Offset(widget.isScrolling ? 24.0 : 0.0, 0.0),
              child: _information()),
          _cover(),
        ],
      ),
    );
  }
}

class CardElement extends StatelessWidget {
  final String color;
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
                color: config.convertColor(color).withOpacity(0.5),
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
