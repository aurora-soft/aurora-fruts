import 'package:flutter/material.dart';

class CardSection extends StatelessWidget {
  final String title;
  final double flex;
  CardSection({this.title, this.flex = 0.0});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '$title',
                style: Theme.of(context).textTheme.title,
              ),
              Text(
                'Mas ->',
                style: Theme.of(context).textTheme.button,
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              for (int i = 0; i < 5; i++) CardElement(flex: flex)
            ],
          ),
        )
        /*
        ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context,item){
            return CardElement();
          },
        ) */
      ],
    );
  }
}

class CardElement extends StatelessWidget {
  final double flex;
  CardElement({this.flex});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8.0),
      height: 150.0,
      width: 120 * (1 + flex),
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(12.0)),
    );
  }
}
