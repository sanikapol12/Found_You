// import 'package:flutter_project/model/featured_content_dataprovider_model.dart';
// import 'package:flutter_project/model/featured_content_model.dart';


// class FeaturedController {
//   List<FeaturedItem> getFeaturedItems() {
//     return FeaturedData.getFeaturedItems();
//   }
// }




import 'package:flutter_project/model/featured_content_dataprovider_model.dart';
import 'package:flutter_project/model/featured_content_model.dart';
import 'package:flutter_project/model/category_model.dart';

class FeaturedController {
  // Pass categories so featured items can link to categories
  List<FeaturedItem> getFeaturedItems(List<Category> categories) {
    return FeaturedData.getFeaturedItems(categories);
  }
}
