// import 'package:flutter_project/model/featured_content_model.dart';

// class FeaturedData {
//   static List<FeaturedItem> getFeaturedItems() {
//     return [
//       FeaturedItem(
//         title: "Fashion & Style",
//         imageUrl: "https://picsum.photos/300/180?random=1",
//       ),
//       FeaturedItem(
//         title: "Automobile Zone",
//         imageUrl: "https://picsum.photos/300/180?random=2",
//       ),
//       FeaturedItem(
//         title: "Home Decor",
//         imageUrl: "https://picsum.photos/300/180?random=3",
//       ),
//       FeaturedItem(
//         title: "Beauty & Salon",
//         imageUrl: "https://picsum.photos/300/180?random=4",
//       ),
//     ];
//   }
// }

import 'featured_content_model.dart';
import 'category_model.dart';

class FeaturedData {
  static List<FeaturedItem> getFeaturedItems(List<Category> categories) {
    // Example: pick first 4 categories randomly
    final featuredCategories = categories.take(4).toList();

    return [
      FeaturedItem(
        title: featuredCategories[0].name,
        imageUrl:
            "https://th.bing.com/th/id/OIP.YyozHXS5zu8fPD2KnKBiOwHaE8?w=290&h=193&c=7&r=0&o=7&cb=12&dpr=1.3&pid=1.7&rm=3",
        category: featuredCategories[0],
      ),
      FeaturedItem(
        title: featuredCategories[1].name,
        imageUrl:
            "https://th.bing.com/th/id/OIP.jRMjQ6wGE5tE7oCoCJNEDQHaEo?w=248&h=180&c=7&r=0&o=7&cb=12&dpr=1.3&pid=1.7&rm=3",
        category: featuredCategories[1],
      ),
      FeaturedItem(
        title: featuredCategories[2].name,
        imageUrl:
            "https://th.bing.com/th/id/OIP.k6Hm4-9Lu_abZIFVsZTxBwAAAA?w=159&h=180&c=7&r=0&o=7&cb=12&dpr=1.3&pid=1.7&rm=3",
        category: featuredCategories[2],
      ),
      FeaturedItem(
        title: featuredCategories[3].name,
        imageUrl:
            "https://th.bing.com/th/id/OIP.akaJSEW4hC_2b4Xm5Rvo5wHaEJ?w=309&h=180&c=7&r=0&o=7&cb=12&dpr=1.3&pid=1.7&rm=3",
        category: featuredCategories[3],
      ),
    ];
  }
}
