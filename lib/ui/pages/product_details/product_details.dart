import 'package:aurora_fruts/models/product.dart';
import 'package:aurora_fruts/ui/pages/product_details/widgets/aditional_information.dart';
import 'package:aurora_fruts/ui/pages/product_details/widgets/presentation_product.dart';
import 'package:aurora_fruts/ui/pages/product_details/widgets/reviews_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductDetails extends StatelessWidget {
  final Product product;
  ProductDetails({this.product});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        return;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          brightness: Brightness.light,
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "${product.name[0].toUpperCase()}${product.name.substring(1)}",
                          style: Theme.of(context).textTheme.display1,
                        ),
                        Text("por ${product.provider}",
                            style: TextStyle(color: Colors.grey))
                      ],
                    ),
                  ),
                  SizedBox(width: 30.0)
                ],
              )),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(0.0),
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: PresentationProduct(product: product)),
              Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: AditionalInformation(product: product)),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: ReviewsUser())
            ],
          ),
        ),
      ),
    );
  }
}
