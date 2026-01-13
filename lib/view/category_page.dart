import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/controller/category_controller.dart';
import 'package:flutter_project/controller/register_business_controller.dart';
import 'package:flutter_project/model/category_model.dart';
import 'package:flutter_project/view/home_page.dart';
import 'package:flutter_project/view/subsub_category_page.dart';
import 'package:flutter_project/view/shop_details_page.dart';
import 'package:flutter_project/widget/botton_nav_widget.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>
    with TickerProviderStateMixin {
  final CategoryController categoryController = CategoryController();
  final RegesterBusinesscontroller businessController =
      RegesterBusinesscontroller();

  final List<List<Color>> gradientList = [
    [Colors.purple, Colors.blue],
    [Colors.orange, Colors.red],
    [Colors.green, Colors.teal],
    [Colors.pink, Colors.deepPurple],
    [Colors.cyan, Colors.indigo],
  ];

  int selectedIndex = 0;
  late AnimationController _animationController;
  List<Map<String, dynamic>> shopList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..forward();
    fetchShops();
  }

  Future<void> fetchShops() async {
    try {
      final snapshot = await businessController.getbuisnessData();
      final dynamic s = snapshot;
      List<Map<String, dynamic>> fetchedData = [];

      if (s != null) {
        try {
          final docs = s.docs;
          fetchedData = (docs as Iterable)
              .map((doc) => doc.data() as Map<String, dynamic>)
              .toList();
        } catch (_) {
          try {
            final data = s.data();
            if (data is List) {
              fetchedData = data.whereType<Map<String, dynamic>>().toList();
            } else if (data is Map<String, dynamic>) {
              fetchedData = [data];
            }
          } catch (_) {
            fetchedData = [];
          }
        }
      }

      setState(() {
        shopList = fetchedData;
        isLoading = false;
      });
      log("✅ Shops fetched: ${shopList.length}");
    } catch (e) {
      log("❌ Error fetching shops: $e");
      setState(() => isLoading = false);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Category> categories = categoryController.getAllCategories();

    if (categories.isEmpty) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final Category selectedCategory = categories[selectedIndex];
    final List<SubCategory> subcategories = selectedCategory.subcategories;

    // Filter shops by selected category
    final filteredShops = shopList.where((shop) {
      final shopCategory = (shop['category'] ?? '')
          .toString()
          .trim()
          .toLowerCase();
      return shopCategory == selectedCategory.name.toLowerCase();
    }).toList();

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
              (route) =>
                  false, // removes all previous routes so HomePage becomes root
            );
          },
          icon: ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color(0xFF7F00FF), Color(0xFFE100FF)], // Purple → Pink
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds),
            child: const Icon(
              Icons.arrow_back_ios_new, // iOS-style arrow
              color: Colors.white, // must stay white for gradient
              size: 24,
            ),
          ),
        ),
        title: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [
              Color(0xFF7F00FF), // purple
              Color(0xFFE100FF), // pink
            ],
          ).createShader(bounds),
          child: const Text(
            "Categories",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Row(
        children: [
          // ✅ LEFT PANEL
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
                    _animationController.forward(from: 0);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
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
                            color: Colors.purple.withOpacity(0.25),
                            blurRadius: 30,
                            offset: const Offset(0, 3),
                          ),
                      ],
                    ),
                    child: Stack(
                      alignment: Alignment.center,
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
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
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
                        Text(
                          cat.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // ✅ RIGHT PANEL — Subcategories + Shops
          Expanded(
            child: Container(
              color: Colors.grey.shade100,
              padding: const EdgeInsets.all(12),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // 🔹 Subcategory Grid
                    GridView.builder(
                      key: ValueKey(selectedIndex),
                      itemCount: subcategories.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            childAspectRatio: 3 / 2.6,
                          ),
                      itemBuilder: (context, index) {
                        final sub = subcategories[index];
                        final interval = index / subcategories.length;
                        final animation = CurvedAnimation(
                          parent: _animationController,
                          curve: Interval(
                            interval,
                            1.0,
                            curve: Curves.easeOutCubic,
                          ),
                        );

                        return AnimatedBuilder(
                          animation: animation,
                          builder: (context, child) => Opacity(
                            opacity: animation.value,
                            child: Transform.translate(
                              offset: Offset(0, 30 * (1 - animation.value)),
                              child: child,
                            ),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      SubSubCategoryPage(subCategory: sub),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF7F00FF),
                                    Color(0xFFE100FF),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Container(
                                margin: const EdgeInsets.all(1.5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
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
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 20),
                    const Divider(
                      color: Color(0xFF7F00FF), // Purple color
                      thickness: 1.5, // optional, makes it bolder
                      indent: 20, // optional, adds left padding
                      endIndent: 20, // optional, adds right padding
                    ),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [
                            Color(0xFF7F00FF), // Purple
                            Color(0xFFE100FF), // Pink
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(bounds),
                        child: const Text(
                          "Popular Businesses",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors
                                .white, // must be white for gradient to show
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : filteredShops.isEmpty
                        ? const Center(
                            child: Text(
                              "No businesses found for this category.",
                              style: TextStyle(fontSize: 15),
                            ),
                          )
                        : ListView.builder(
                            itemCount: filteredShops.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final shop = filteredShops[index];
                              final imageUrl =
                                  shop['imageUrl'] ?? shop['imageURL'] ?? '';

                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          ShopDetailsPage(shop: shop),
                                    ),
                                  );
                                },
                                child: Card(
                                  margin: const EdgeInsets.only(bottom: 14),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  elevation: 4,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            const BorderRadius.vertical(
                                              top: Radius.circular(16),
                                            ),
                                        child: Image.network(
                                          imageUrl,
                                          height: 140,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) =>
                                                  const SizedBox(
                                                    height: 140,
                                                    child: Center(
                                                      child: Icon(
                                                        Icons.store,
                                                        size: 80,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              shop['businessName'] ?? "No Name",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              shop['discription'] ??
                                                  "No description",
                                              style: const TextStyle(
                                                color: Colors.black54,
                                              ),
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavWidget(currentIndex: 1),
    );
  }
}
