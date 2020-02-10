import 'package:aurora_fruts/models/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

final firebaseDb = Firestore.instance;

//CRUD
//Create
Future<void> createProvider({@required Provider provider}) async {
  final ref = await firebaseDb.collection('provider').add({
    'address': provider.address,
    'name': provider.name,
    'photo': provider.photo,
    'snacks': provider.snacks
  });
  print(ref.documentID.toString());
}

//Read
Future<Provider> readProvider({@required String id}) async {
  final ref = await firebaseDb.collection('provider').document(id).get();
  return Provider.fromSnapshot(ref);
}

Future<List<Provider>> readProviders() async {
  List<Provider> _providers = [];
  try {
    await firebaseDb
        .collection('provider')
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) => _providers.add(Provider.fromSnapshot(f)));
    });
  } catch (e) {
    print('Exception read ' + e.toString());
  }
  return _providers;
}

//Update
Future<void> updateProvider(
    {@required String key,
    @required dynamic value,
    @required String id}) async {
  try {
    await firebaseDb.collection('provider').document(id).updateData({key: value});
  } catch (e) {
    print('Exception update:' + e.toString());
  }
}

//Delete
Future<void> deleteProvider({@required String id}) async {
  try {
    await firebaseDb.collection('provider').document(id).delete();
  } catch (e) {
    print('Exception delete' + e.toString());
  }
}
