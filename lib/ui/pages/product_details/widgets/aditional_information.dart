import 'package:aurora_fruts/models/product.dart';
import 'package:flutter/material.dart';
import 'package:aurora_fruts/utils/config.dart' as config;
import 'package:aurora_fruts/data/constants.dart' as constant;

class AditionalInformation extends StatefulWidget {
  final Product product;
  AditionalInformation({this.product});

  @override
  _AditionalInformationState createState() => _AditionalInformationState();
}

class _AditionalInformationState extends State<AditionalInformation>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _picker;

  void _changePicker(int picker) => setState(() => _picker = picker);

  Widget _containerAditional(int picker) {
    if (picker == 2) {
      return Container();
    } else if (picker == 1) {
      return Container();
    } else {
      return Description(
        description: widget.product.description,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _picker = 0;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child:
                Text('Etiquetas', style: Theme.of(context).textTheme.overline),
          ),
          SizedBox(height: 8.0),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(width: 8.0),
                for (int i = 0; i < widget.product.labels.length; i++)
                  ChipLabel(
                    label: widget.product.labels[i],
                  )
              ],
            ),
          ),
          SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              unselectedLabelStyle: TextStyle(color: Colors.grey),
              onTap: (picker) => _changePicker(picker),
              indicatorColor: config.convertColor(constant.colors['primary']),
              indicatorSize: TabBarIndicatorSize.tab,
              controller: _tabController,
              tabs: <Widget>[
                Tab(child: Text('Descripción')),
                Tab(child: Text('Notas')),
                Tab(child: Text('Comentarios')),
              ],
            ),
          ),
          _containerAditional(_picker)
        ],
      ),
    );
  }
}

class ChipLabel extends StatelessWidget {
  final String label;
  ChipLabel({this.label});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //TODO: go to categorie screen
      },
      child: Container(
        margin: EdgeInsets.only(right: 8.0),
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        height: 35.0,
        decoration: BoxDecoration(
            color: config.convertColor(constant.colors['primary']),
            borderRadius: BorderRadius.circular(35.0)),
        child: Text(
          "${label[0].toUpperCase()}${label.substring(1)}",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class Description extends StatelessWidget {
  final String description;
  Description({this.description});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical:8.0,horizontal: 16.0),
        child:
            Text('"${description[0].toUpperCase()}${description.substring(1)}"',style: TextStyle(color: Colors.grey[600]),),
      ),
    );
  }
}
