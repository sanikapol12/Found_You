class Project {
  final String id;
  final String name;
  final String price;
  final String category;
  final String? description;
  final String? imageUrl;

  Project({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    this.description,
    this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'category': category,
      'description': description,
      'imageUrl': imageUrl,
    };
  }
}
