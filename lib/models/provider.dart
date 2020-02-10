import 'package:cloud_firestore/cloud_firestore.dart';

class Provider {
  final String address;
  final String name;
  final String photo;
  final List<dynamic> snacks;

  Provider({
    this.address,
    this.name,
    this.photo,
    this.snacks,
  });

  factory Provider.fromSnapshot(DocumentSnapshot snapshot){
    return Provider(
      address: snapshot['address'],
      name: snapshot['name'],
      photo: snapshot['photo'],
      snacks: snapshot['snacks']
    );
  }
}
