import 'package:aurora_fruts/models/order.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

final firebaseDb = Firestore.instance;

//CRUD
//Create
Future<void> createOrder({@required Order order}) async {
  final ref = await firebaseDb.collection('order').add({
    'address_order': order.addressOrder,
    'date_order': order.dateOrder,
    'hour_delivery': order.hourDelivery,
    'user': order.user,
    'snacks': order.snacks
  });
  print(ref.documentID.toString());
}

//Read
Future<Order> readOrder({@required String id}) async {
  final ref = await firebaseDb.collection('order').document(id).get();
  return Order.fromSnapshot(ref);
}

Future<List<Order>> readOrders() async {
  List<Order> _orders = [];
  try {
    await firebaseDb
        .collection('order')
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) => _orders.add(Order.fromSnapshot(f)));
    });
  } catch (e) {
    print('Exception read ' + e.toString());
  }
  return _orders;
}

//Update
Future<void> updateOrder(
    {@required String key,
    @required dynamic value,
    @required String id}) async {
  try {
    await firebaseDb.collection('order').document(id).updateData({key: value});
  } catch (e) {
    print('Exception update:' + e.toString());
  }
}

//Delete
Future<void> deleteOrder({@required String id}) async {
  try {
    await firebaseDb.collection('order').document(id).delete();
  } catch (e) {
    print('Exception delete' + e.toString());
  }
}
