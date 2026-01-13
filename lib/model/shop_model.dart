// class Shop {
//   final String name;
//   final String imageUrl;
//   final String category;
//   final double rating; // out of 5
//   final String description;
//   final String phone;
//   final String location;
//   final double distance; // in km

//   Shop({
//     required this.name,
//     required this.imageUrl,
//     required this.category,
//     required this.rating,
//     required this.description,
//     required this.phone,
//     required this.location,
//     required this.distance,
//   });
// }
class Shop {
  final String name;
  final double rating;
  final String location;
  final String imageUrl;
  final String description;
  final List<Map<String, dynamic>> reviews;

  Shop({
    required this.name,
    required this.rating,
    required this.location,
    required this.imageUrl,
    required this.description,
    required this.reviews,
  });
}
