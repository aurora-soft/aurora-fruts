import 'package:cloud_firestore/cloud_firestore.dart';

class Order {
  final String addressOrder;
  final String dateOrder;
  final String hourDelivery;
  final String user;
  final Map<String, dynamic> snacks;

  Order({
    this.addressOrder,
    this.dateOrder,
    this.hourDelivery,
    this.snacks,
    this.user,
  });

  factory Order.fromSnapshot(DocumentSnapshot snapshot) {
    return Order(
        addressOrder: snapshot['address_order'],
        dateOrder: snapshot['date_order'],
        hourDelivery: snapshot['hour_delivery'],
        user: snapshot['user'],
        snacks: snapshot['snacks']);
  }
}
