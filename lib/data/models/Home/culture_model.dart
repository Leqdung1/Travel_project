
class CultureModel{
  List<String> image;
  String title;
  String address;
  String description;
  String history;
  List<String> feature;
  int isHot;

  CultureModel({
    required this.image,
    required this.title,
    required this.address,
    required this.description,
    required this.history,
    required this.feature,
    required this.isHot,
  });

  factory CultureModel.fromJson(Map<String, dynamic> json) {
    var images = json['image'];
    List<String> imageList = [];

    if (images is String) {
      imageList = [images];
    } else if (images is List) {
      imageList = List<String>.from(images);
    }

    var features = json['feature'];
    List<String> featureList = [];

    if (features is String) {
      featureList = [features];
    } else {
      featureList = List<String>.from(features);
    }

    return CultureModel(
      image: imageList,
      title: json['title'] ?? '',
      address: json['address'] ?? '',
      description: json['description'] ?? '',
      history: json['history'] ?? '',
      feature: featureList,
      isHot: json['isHot'] ?? 0,
    );
  }
}
