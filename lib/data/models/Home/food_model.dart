

class FoodModel {
  List<String> image;
  String title;
  String address;
  String ingredients;
  String description;
  String history;
  String feature;
  int isHot;

  FoodModel({
    required this.image,
    required this.title,
    required this.address,
    required this.ingredients,
    required this.description,
    required this.history,
    required this.feature,
    required this.isHot,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    var images = json['image'];
    List<String> imageList = [];

    if (images is String) {
      imageList = [images];
    } else if (images is List) {
      imageList = List<String>.from(images);
    }

    return FoodModel(
      image: imageList,
      title: json['title'] ?? '',
      address: json['address'],
      ingredients: json['ingredients'],
      description: json['description'] ?? '',
      history: json['history'] ?? '',
      feature: json['feature'] ?? '',
      isHot: json['isHot'] ?? 0,
    );
  }
}
