import 'package:cloud_firestore/cloud_firestore.dart';

class Collection {
  final String name;
  final String tag;
  final bool suggestion;
  final List<dynamic> products;
  final bool menuItem;
  Collection(
      {this.products, this.name, this.tag, this.suggestion, this.menuItem});

  factory Collection.fromSnapshot(DocumentSnapshot snapshot) {
    return Collection(
        name: snapshot['name'],
        suggestion: snapshot['suggestion'],
        products: snapshot['snacks'],
        menuItem: snapshot['menu_item'],
        tag: snapshot['tag']);
  }
}
