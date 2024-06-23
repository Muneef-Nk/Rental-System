class ProductsModel {
  final String id;
  final String productName;
  final String desc;
  final String profilePic;
  final String profileName;
  final String place;
  final int price;
  final String imgMain;
  final String image_png;
  final String rating;
  final List gallery;

  ProductsModel({
    required this.id,
    required this.profileName,
    required this.profilePic,
    required this.place,
    required this.image_png,
    required this.productName,
    required this.desc,
    required this.price,
    required this.imgMain,
    required this.rating,
    required this.gallery,
  });
}
