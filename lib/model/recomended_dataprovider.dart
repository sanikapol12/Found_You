import 'package:flutter_project/model/recomended_category_model.dart';


class RecommendedData {
  static List<RecommendedCategory> getCategories() {
    return [
      RecommendedCategory(
        name: "Fashion & Style",
        imageUrl: "https://picsum.photos/200/140?random=1",
      ),
      RecommendedCategory(
        name: "Automobile",
        imageUrl: "https://picsum.photos/200/140?random=2",
      ),
      RecommendedCategory(
        name: "Home Decor",
        imageUrl: "https://picsum.photos/200/140?random=3",
      ),
      RecommendedCategory(
        name: "Beauty & Salon",
        imageUrl: "https://picsum.photos/200/140?random=4",
      ),
      RecommendedCategory(
        name: "Electronics",
        imageUrl: "https://picsum.photos/200/140?random=5",
      ),
    ];
  }
}
