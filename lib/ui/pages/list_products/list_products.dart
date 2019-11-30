import 'package:aurora_fruts/ui/common_widgets/card_element.dart';
import 'package:flutter/material.dart';
import 'package:aurora_fruts/data/example/products.dart' as proex;

class ListProducts extends StatelessWidget {
  final String title;
  final Color color;

  ListProducts({this.color, @required this.title});

  Widget _bodyList() {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverGrid.count(
            childAspectRatio: 0.65,
            crossAxisSpacing: 5,
            mainAxisSpacing: 0,
            crossAxisCount: 3,
            children: <Widget>[
              for (int i = 0; i < proex.products.length; i++)
                CardElement(product: proex.products[i])
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          physics: BouncingScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                brightness: Brightness.light,
                elevation: 0.0,
                leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.black,
                ),
                backgroundColor:
                    Colors.white,
                expandedHeight: 200.0,
                floating: true,
                pinned: true,
                snap: false,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Descubre una gran variedad de productos basados en',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  title: Text("${title[0].toUpperCase()}${title.substring(1)}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      )),
                ),
              )
            ];
          },
          body: Container(child: _bodyList())),
    );
  }
}
