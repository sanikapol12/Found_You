class Category {
  final String name;
  final String icon;
  final List<SubCategory> subcategories;

  Category({
    required this.name,
    required this.icon,
    required this.subcategories,
  });
}

class SubCategory {
  final String name;
  final List<String> subSubCategories;

  SubCategory({
    required this.name,
    required this.subSubCategories,
  });
}
