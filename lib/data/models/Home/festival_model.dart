
class FestivalModel {
  List<String> image;
  String title;
  String address;
  String time;
  String description;
  String history;
  String feature;

  int isHot;

  FestivalModel({
    required this.image,
    required this.title,
    required this.address,
    required this.time,
    required this.description,
    required this.history,
    required this.feature,
    required this.isHot,
  });

  factory FestivalModel.fromJson(Map<String, dynamic> json) {
    var images = json['image'];
    List<String> imageList = [];

    if (images is String) {
      imageList = [images];
    } else if (images is List) {
      imageList = List<String>.from(images);
    }

    return FestivalModel(
      image: imageList,
      title: json['title'] ?? '',
      address: json['address'] ?? '',
      time: json['time'] ?? '',
      description: json['description'] ?? '',
      history: json['history'] ?? '',
      feature: json['feature'] ?? '',
      isHot: json['isHot'] ?? 0,
    );
  }
}
