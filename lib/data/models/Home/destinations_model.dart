
class DestinationsModels{
  List<String> image;
  String title;
  String address;
  String content;
  String description;
  String history;
  String feature;
  int isHot;

  DestinationsModels({
    required this.image,
    required this.title,
    required this.address,
    required this.content,
    required this.description,
    required this.history,
    required this.feature,
    required this.isHot,
  });

  factory DestinationsModels.fromJson(Map<String, dynamic> json) {
    var images = json['image'];
    List<String> imageList = [];

    if (images is String) {
      imageList = [images];
    } else if (images is List) {
      imageList = List<String>.from(images);
    }

    return DestinationsModels(
      image: imageList,
      title: json['title'] ?? '',
      address: json['address'] ?? '',
      content: json['content'] ?? '',
      description: json['description'] ?? '',
      history: json['history'] ?? '',
      feature: json['feature'] ?? '',
      isHot: json['isHot'] ?? 0,
    );
  }

  where(bool Function(dynamic destinations) param0) {}
}
