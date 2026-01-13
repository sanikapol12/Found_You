import 'package:flutter/material.dart';
import '../model/category_model.dart';
import '../view/sub_category_page.dart';

class RecommendedCategoriesView extends StatelessWidget {
  final List<Category> recommendedCategories;
  final List<Category> featuredCategories; // 👈 new list to exclude featured

  const RecommendedCategoriesView({
    super.key,
    required this.recommendedCategories,
    required this.featuredCategories,
  });

  @override
  Widget build(BuildContext context) {
    // 👇 Filter: remove categories already in featured
    final filteredList = recommendedCategories
        .where(
          (cat) =>
              !featuredCategories.any((featured) => featured.name == cat.name),
        )
        .take(4) // 👈 only show 4 categories
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20),

        // 🌈 Gradient title
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFF7F00FF), Color(0xFFE100FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: const Text(
            'Recommended Categories',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 10),

        // 📜 Horizontal Scroll View
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: filteredList.map((cat) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          SubCategoryPage(category: cat, subcategoryName: null),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  width: 200,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: NetworkImage(cat.icon),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                    child: Text(
                      cat.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
