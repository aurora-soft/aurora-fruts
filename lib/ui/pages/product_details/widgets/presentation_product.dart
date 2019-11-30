import 'package:aurora_fruts/models/product.dart';
import 'package:flutter/material.dart';
import 'package:aurora_fruts/ui/common_widgets/snackbar.dart' as snackbar;

class PresentationProduct extends StatelessWidget {
  final Product product;
  PresentationProduct({this.product});

  Widget _imageBuilder(BuildContext context) {
    return SizedBox(
      height: 200.0,
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: RotatedBox(
              quarterTurns: -1,
              child: Text(
                '${product.weight}',
                style: TextStyle(
                    color: Colors.grey[400],
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0),
              ),
            ),
          ),
          SizedBox(
            width: 8.0,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(35),
            child: Stack(children: [
              SizedBox(
                height: 200.0,
                width: 250.0,
                child: Image.network(
                  product.images[0],
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(35.0)),
                      color: Colors.black45),
                  child: IconButton(
                    onPressed: (){
                      //TODO: add to favourites
                    },
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.grey,
                      size: 32.0,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0.0,
                right: 0.0,
                child: Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(35.0)),
                      color: Colors.black45),
                  child: IconButton(
                    onPressed: () {
                      snackbar.showSnackBar(
                          context: context,
                          color: Theme.of(context).accentColor,
                          title: 'Producto añadido al carrito');
                    },
                    icon: Icon(
                      Icons.add_shopping_cart,
                      color: Colors.white,
                      size: 32.0,
                    ),
                  ),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _imageBuilder(context),
          Rating(product: product),
        ],
      ),
    );
  }
}

class Rating extends StatelessWidget {
  final Product product;
  Rating({this.product});

  Widget _rating(BuildContext context) {
    return Column(
      children: <Widget>[
        //Text('Puntaje', style: Theme.of(context).textTheme.overline),
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
      ],
    );
  }

  Widget _price(BuildContext context) {
    return Column(
      children: <Widget>[
        //Text('Precio', style: Theme.of(context).textTheme.overline),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _rating(context),
          SizedBox(width: 32.0),
          _price(context)
        ],
      ),
    );
  }
}
