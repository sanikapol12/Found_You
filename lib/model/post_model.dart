class PostModel {
  final String imageUrl;

  PostModel({required this.imageUrl});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(imageUrl: json['imageUrl']);
  }

  Map<String, dynamic> toJson() => {'imageUrl': imageUrl};
}
