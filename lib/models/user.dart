import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String city;
  final String nickName;
  final String email;
  final String phone;
  final int points;
  final String photo;
  final List<dynamic> favourites;
  final List<dynamic> orders;
  final String tagProfile;

  User({
    this.tagProfile,
    this.photo,
    this.email,
    this.nickName,
    this.points,
    this.phone,
    this.city,
    this.favourites,
    this.orders,
  });

  factory User.fromSnapshot(DocumentSnapshot snapshot) {
    return User(
        nickName: snapshot['nick_name'],
        city: snapshot['city'],
        email: snapshot['email'],
        favourites: snapshot['favourites'],
        phone: snapshot['phone'],
        points: snapshot['points'],
        photo: snapshot['photo'],
        tagProfile: snapshot['tag_profile'],
        orders: snapshot['orders']);
  }
}
