// class FeaturedItem {
//   final String title;
//   final String imageUrl;

//   FeaturedItem({
//     required this.title,
//     required this.imageUrl,
//   });
// }





import 'category_model.dart'; // import your Category/SubCategory model

class FeaturedItem {
  final String title;
  final String imageUrl;
  final Category category; // add category reference

  FeaturedItem({
    required this.title,
    required this.imageUrl,
    required this.category,
  });
}
