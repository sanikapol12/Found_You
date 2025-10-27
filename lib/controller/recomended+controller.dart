import 'package:flutter_project/model/recomended_category_model.dart';
import 'package:flutter_project/model/recomended_dataprovider.dart';

class RecommendedController {
  List<RecommendedCategory> getRecommendedCategories() {
    return RecommendedData.getCategories();
  }
}
