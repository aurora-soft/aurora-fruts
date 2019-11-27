import 'package:aurora_fruts/models/product.dart';
import 'package:flutter/material.dart';
import 'package:aurora_fruts/utils/config.dart' as config;
import 'package:aurora_fruts/data/constants.dart' as constant;
import 'package:aurora_fruts/data/example/details_description.dart' as details;

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
      return Ingredients(ingredients: widget.product.ingredients);
    } else if (picker == 1) {
      return Notes(notes: widget.product.observer);
    } else {
      return Description(description: widget.product.description);
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
                Tab(child: Text('Ingredientes')),
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
      child: description != null
          ? Row(
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: Center(
                      child: Icon(details.iconCardSection[0], size: 64.0)),
                ),
                Flexible(
                  flex: 4,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: Text(
                      '"${description[0].toUpperCase()}${description.substring(1)}"',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                ),
              ],
            )
          : Center(
              child: Text(
                'No hay descripción\ndisponible',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[500], fontSize: 24.0),
              ),
            ),
    );
  }
}

class Notes extends StatelessWidget {
  final String notes;
  Notes({this.notes});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: notes != null
          ? Row(
              children: <Widget>[
                Flexible(
                  flex: 4,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: Text(
                      '"${notes[0].toUpperCase()}${notes.substring(1)}"',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Center(
                      child: Icon(details.iconCardSection[1], size: 64.0)),
                ),
              ],
            )
          : Center(
              child: Text(
                'No hay notas\ndisponibles',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[500], fontSize: 24.0),
              ),
            ),
    );
  }
}

class Ingredients extends StatelessWidget {
  final List<String> ingredients;
  Ingredients({this.ingredients});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ingredients != null
          ? Row(
              children: <Widget>[
                Flexible(
                    flex: 2,
                    child: Center(
                        child: Icon(details.iconCardSection[2], size: 64.0))),
                Flexible(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        for (int i = 0; i < ingredients.length; i++)
                          Text(
                            "*\t\t${ingredients[i]}",
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 18.0,
                                fontStyle: FontStyle.italic),
                          )
                      ],
                    )),
              ],
            )
          : Center(
              child: Text(
                'Información no\ndisponible',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[500], fontSize: 24.0),
              ),
            ),
    );
  }
}
