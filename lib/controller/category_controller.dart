// import 'package:flutter_project/model/subcategory_model.dart';

// import '../model/category_model.dart';
// import '../model/data_provider.dart';

// class CategoryController {
//   List<Category> getAllCategories(List<String> subSubCategories) {
//     return DataProvider.categories;
//   }

//   List<SubCategory> getSubCategories(Category category) {
//     return category.subcategories;
//   }

//   List<String> getSubSubCategories(SubCategory subCategory, String subCategoryName) {
//     return subCategory.subSubCategories;
//   }
// }




import '../model/category_model.dart';
import '../model/data_provider.dart';

class CategoryController {
  List<Category> getAllCategories() => DataProvider.getAllCategories();
}

