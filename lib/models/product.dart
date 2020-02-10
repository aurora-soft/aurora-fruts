import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String name;
  final String description;
  final double price;
  final String provider;
  final List<dynamic> labels;
  final List<dynamic> ingredients;
  final double discountPercent;
  final List<dynamic> photos;
  final String createDate;
  final bool isDiscount;
  final String dateDueDiscount;

  Product({
    this.description,
    this.discountPercent,
    this.ingredients,
    this.labels,
    this.name,
    this.price,
    this.provider,
    this.photos,
    this.createDate,
    this.isDiscount,
    this.dateDueDiscount,
  });

  factory Product.fromSnapshot(DocumentSnapshot snapshot){
    return Product(
      createDate: snapshot['create_date'],
      dateDueDiscount: snapshot['date_due_discount'],
      description: snapshot['description'],
      discountPercent: snapshot['discount_percent'],
      ingredients: snapshot['ingredients'],
      isDiscount: snapshot['is_discount'],
      labels: snapshot['labels'],
      name: snapshot['name'],
      photos: snapshot['photos'],
      price: snapshot['price'],
      provider: snapshot['provider'],
    );
  }
}
