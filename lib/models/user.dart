class User {
  String nickName;
  String email;
  String telephone;
  int points;
  int nroOrders;
  String imageProfile;
  List<String> favourites;
  List<String> promotions;
  List<String> friends;
  String tagProfile;

  User({
    this.tagProfile,
    this.imageProfile,
    this.email,
    this.favourites,
    this.friends,
    this.nickName,
    this.nroOrders,
    this.points,
    this.promotions,
    this.telephone,
  });
}
