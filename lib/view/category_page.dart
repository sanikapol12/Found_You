import 'package:flutter/material.dart';
import 'package:flutter_project/controller/category_controller.dart';
import 'package:flutter_project/model/category_model.dart';
import 'package:flutter_project/view/sub_category_page.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final CategoryController controller = CategoryController();

  final List<List<Color>> gradientList = [
    [Colors.purple, Colors.blue],
    [Colors.orange, Colors.red],
    [Colors.green, Colors.teal],
    [Colors.pink, Colors.deepPurple],
    [Colors.cyan, Colors.indigo],
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Category> categories = controller.getAllCategories();

    if (categories.isEmpty) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final Category selectedCategory = categories[selectedIndex];
    final List<SubCategory> subcategories = selectedCategory.subcategories;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          'Categories',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Row(
        children: [
          // 🔹 LEFT COLUMN — Categories
          Container(
            width: MediaQuery.of(context).size.width * 0.33,
            color: Colors.white,
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final cat = categories[index];
                final gradientColors =
                    gradientList[index % gradientList.length];
                final bool isSelected = index == selectedIndex;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isSelected ? Colors.purple : Colors.transparent,
                        width: 3,
                      ),
                      boxShadow: [
                        if (isSelected)
                          BoxShadow(
                            color: Colors.purple.withOpacity(0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                      ],
                    ),
                    child: Stack(
                      alignment: Alignment.center, // ✅ Ensures full centering
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Image.network(
                            cat.icon,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 100,
                            color: Colors.black.withOpacity(0.25),
                            colorBlendMode: BlendMode.darken,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  gradientColors[0].withOpacity(0.3),
                                  gradientColors[1].withOpacity(0.3),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                          ),
                        ),
                        // ✅ Centered text
                        Text(
                          cat.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.w500,
                            fontSize: 15,
                            shadows: const [
                              Shadow(
                                color: Colors.black45,
                                offset: Offset(1, 1),
                                blurRadius: 2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // 🔹 RIGHT COLUMN — Subcategories
          Expanded(
            child: Container(
              color: Colors.grey.shade100,
              padding: const EdgeInsets.all(12),
              child: subcategories.isEmpty
                  ? const Center(
                      child: Text(
                        "No subcategories available",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    )
                  : GridView.builder(
                      itemCount: subcategories.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            childAspectRatio: 3 / 2,
                          ),
                      itemBuilder: (context, index) {
                        final sub = subcategories[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => SubCategoryPage(
                                  category: selectedCategory,
                                  subcategoryName: sub.name,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  sub.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
