class Product {
  String name;
  String description;
  double price;
  String provider;
  List<String> labels;
  List<String> ingredients;
  double discount;
  List<String> images;
  String weight;
  String observer;
  String dateCreated;
  String deliveryScheduale;

  Product(
      {this.description,
      this.discount,
      this.ingredients,
      this.labels,
      this.name,
      this.price,
      this.provider,
      this.images,
      this.weight,
      this.observer,
      this.dateCreated,
      this.deliveryScheduale});
}
