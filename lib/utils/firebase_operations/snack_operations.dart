import 'package:aurora_fruts/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

final firebaseDb = Firestore.instance;

//CRUD
//Create
Future<void> createSnack({@required Product product}) async {
  final ref = await firebaseDb.collection('snack').add({
    'create_date': product.createDate,
    'date_due_discount': product.dateDueDiscount,
    'description': product.description,
    'discount_percent': product.discountPercent,
    'ingredients': [],
    'is_discount': product.isDiscount,
    'labels': [],
    'name': product.name,
    'photos': [],
    'price': product.price,
    'provider': product.provider,
  });
  print(ref.documentID.toString());
}

//Read
Future<Product> readSnack({@required String id}) async {
  final ref = await firebaseDb.collection('snack').document(id).get();
  return Product.fromSnapshot(ref);
}

Future<List<Product>> readSnacks() async {
  List<Product> _products = [];
  try {
    await firebaseDb
        .collection('snack')
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) => _products.add(Product.fromSnapshot(f)));
    });
  } catch (e) {
    print('Exception read ' + e.toString());
  }
  return _products;
}

//Update
Future<void> updateSnack(
    {@required String key,
    @required dynamic value,
    @required String id}) async {
  try {
    await firebaseDb.collection('snack').document(id).updateData({key: value});
  } catch (e) {
    print('Exception update:' + e.toString());
  }
}

//Delete
Future<void> deleteSnack({@required String id}) async {
  try {
    await firebaseDb.collection('snack').document(id).delete();
  } catch (e) {
    print('Exception delete' + e.toString());
  }
}
