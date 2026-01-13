import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/model/featured_content_dataprovider_model.dart';
import 'package:flutter_project/view/banner.dart';
import 'package:flutter_project/view/featured_content.dart';
import 'package:flutter_project/view/notification_page.dart';
import 'package:flutter_project/view/recomonded_categories.dart';
import 'package:flutter_project/view/register_business.dart';
import 'package:flutter_project/view/sub_category_page.dart';
import 'package:flutter_project/widget/botton_nav_widget.dart';
import '../controller/category_controller.dart';
import '../model/category_model.dart';

final CategoryController controller = CategoryController();
final List<Category> categories = controller.getAllCategories();
final featuredItems = FeaturedData.getFeaturedItems(categories);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CategoryController controller = CategoryController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final String userId = "demoUserId123";

  String _searchQuery = ""; // 👈 Add this variable

  @override
  Widget build(BuildContext context) {
    final List<Category> categories = controller.getAllCategories();

    final List<List<Color>> gradientList = [
      [Colors.purple, Colors.blue],
      [Colors.orange, Colors.red],
      [Colors.green, Colors.teal],
      [Colors.pink, Colors.deepPurple],
      [Colors.cyan, Colors.indigo],
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 25),

              // Header Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [Color(0xFF7F00FF), Color(0xFFE100FF)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(bounds),
                      child: const Text(
                        "FOUND YOU",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const NotificationPage(),
                        ),
                      );
                    },
                    icon: ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [Color(0xFF7F00FF), Color(0xFFE100FF)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(bounds),
                      child: const Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              //  Search Bar
              Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF7F00FF), Color(0xFFE100FF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(1.5),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value.trim().toLowerCase();
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: const Icon(Icons.search, size: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 12,
                    ),
                  ),
                  style: const TextStyle(fontSize: 14),
                ),
              ),

              const SizedBox(height: 20),

              //  Register Business Button (only if not registered)
              StreamBuilder<QuerySnapshot>(
                stream: _firestore
                    .collection('businesses')
                    .where('ownerId', isEqualTo: userId)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SizedBox(
                      height: 40,
                      width: 40,
                      child: Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    );
                  }

                  final bool hasBusiness =
                      snapshot.hasData && snapshot.data!.docs.isNotEmpty;

                  if (hasBusiness) return const SizedBox.shrink();

                  return AnimatedOpacity(
                    duration: const Duration(milliseconds: 600),
                    opacity: 1,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 4,
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const BusinessForm(),
                          ),
                        );
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF7F00FF), Color(0xFFE100FF)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 240,
                          child: const Text(
                            'Register Your Business',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 30),

              //  Banner
              const BannerCarousel(),

              const SizedBox(height: 30),

              //  Popular Categories
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Color(0xFF7F00FF), Color(0xFFE100FF)],
                  // colors: [Colors.blue, Colors.purple, Colors.red],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds),
                child: const Text(
                  'Popular Categories',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              //  Categories Grid (Horizontal)
              SizedBox(
                height: 280,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final cat = categories[index];
                    final gradientColors =
                        gradientList[index % gradientList.length];

                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        backgroundColor: Colors.transparent,
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SubCategoryPage(
                              category: cat,
                              subcategoryName: null,
                            ),
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.network(
                              cat.icon,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                              color: Colors.black.withOpacity(0.2),
                              colorBlendMode: BlendMode.darken,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
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
                          Center(
                            child: Text(
                              cat.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                shadows: [
                                  Shadow(
                                    color: Colors.black45,
                                    offset: Offset(1, 1),
                                    blurRadius: 2,
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              //SizedBox(height: 5),

              //  Search Results (only when user types)
              if (_searchQuery.isNotEmpty)
                StreamBuilder<QuerySnapshot>(
                  stream: _firestore
                      .collection('businesses')
                      .where(
                        'keywords',
                        arrayContains: _searchQuery,
                      ) // Make sure you have 'keywords' field
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }

                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Padding(
                        padding: EdgeInsets.all(10),
                        //  child: Text("No results found"),
                      );
                    }

                    final results = snapshot.data!.docs;

                    return Column(
                      children: results.map((doc) {
                        final data = doc.data() as Map<String, dynamic>;
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                data['imageUrl'] ?? '',
                              ),
                              onBackgroundImageError: (_, __) =>
                                  const Icon(Icons.store),
                            ),
                            title: Text(
                              data['businessName'] ?? 'No business name',
                            ),
                            subtitle: Text(
                              data['category'] ?? 'No category info',
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),

              // const SizedBox(height: 5),

              //  Featured Content
              FeaturedContentView(featuredItems: featuredItems),

              //  const SizedBox(height: 20),
              RecommendedCategoriesView(
                recommendedCategories: categories,
                featuredCategories: featuredItems
                    .map((f) => f.category)
                    .toList(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavWidget(currentIndex: 0),
    );
  }
}
