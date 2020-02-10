import 'package:aurora_fruts/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

final firebaseDb = Firestore.instance;

//CRUD
//Create
Future<void> createUser({@required User user}) async {
  final ref = await firebaseDb.collection('user').add({
    'nick_name': user.nickName,
    'email': user.email,
    'city': user.city,
    'phone': user.phone,
    'points': user.points,
    'photo': user.photo,
    'favourites': [],
    'orders': [],
    'tag_profile': user.tagProfile
  });
  print(ref.documentID.toString());
}

//Read
Future<User> readUser({@required String id}) async {
  final ref = await firebaseDb.collection('user').document(id).get();
  print(ref.data);
  return User.fromSnapshot(ref);
}

//!not usable
/*Future<void> _readUsers() async {
  try {
    await firebaseDb
        .collection('user')
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) => print('${f.data}}'));
    });
  } catch (e) {
    print('Exception read ' + e.toString());
  }
}*/

//Update
Future<void> updateUser(
    {@required String key,
    @required dynamic value,
    @required String id}) async {
  try {
    await firebaseDb.collection('user').document(id).updateData({key: value});
  } catch (e) {
    print('Exception update:' + e.toString());
  }
}

//Delete
Future<void> deleteUser({@required String id}) async {
  try {
    await firebaseDb.collection('user').document(id).delete();
  } catch (e) {
    print('Exception delete' + e.toString());
  }
}
