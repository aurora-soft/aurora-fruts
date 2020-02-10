import 'package:aurora_fruts/models/collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

final firebaseDb = Firestore.instance;

//CRUD
//Create
Future<void> createCollection({@required Collection collection}) async {
  final ref = await firebaseDb.collection('collections').add({
    'name': collection.name,
    'tag': collection.tag,
    'snacks': collection.products,
    'suggestion': collection.suggestion,
    'menu_item': collection.menuItem
  });
  print(ref.documentID.toString());
}

//Read
Future<Collection> readCollection({@required String id}) async {
  final ref = await firebaseDb.collection('collections').document(id).get();
  return Collection.fromSnapshot(ref);
}

Future<List<Collection>> readCollections() async {
  List<Collection> _collections = [];
  try {
    await firebaseDb
        .collection('collections')
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents
          .forEach((f) => _collections.add(Collection.fromSnapshot(f)));
    });
  } catch (e) {
    print('Exception read ' + e.toString());
  }
  return _collections;
}

//Update
Future<void> updateCollection(
    {@required String key,
    @required dynamic value,
    @required String id}) async {
  try {
    await firebaseDb
        .collection('collections')
        .document(id)
        .updateData({key: value});
  } catch (e) {
    print('Exception update:' + e.toString());
  }
}

//Delete
Future<void> deleteCollection({@required String id}) async {
  try {
    await firebaseDb.collection('collections').document(id).delete();
  } catch (e) {
    print('Exception delete' + e.toString());
  }
}
