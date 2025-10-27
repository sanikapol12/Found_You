// import 'package:flutter/material.dart';
// import 'package:flutter_project/controller/category_controller.dart';
// import 'package:flutter_project/model/subcategory_model.dart';

// class  SubSubCategoryPage extends StatefulWidget {
//     final String categoryName;
//   final String subCategoryName;
//   final CategoryController controller = CategoryController();

//  // final SubCategory subCategory;
//    SubSubCategoryPage({
//     required this.categoryName,
//      required this.subCategoryName, required SubCategory subCategory,
//   });
//   @override
//   State<SubSubCategoryPage> createState() => _SubSubCategoryPageState();
// }

// class _SubSubCategoryPageState extends State<SubSubCategoryPage> {
//   String selectedCategory = 'All';

//   @override
//   Widget build(BuildContext context) {
//    // Add “All” to beginning of subcategory list
//    // final categories = ["All", ...widget.subCategory.subSubCategories];

//  final size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Container(
//          width: size.width,
//           height: size.height,
//           child: SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//          child: Row(
//           children: [

//           ],
//          ),
//           ),
//       ),
//     );
//   }

//   }

// //   import 'package:flutter/material.dart';
// // import '../controller/category_controller.dart';

// // class SubSubCategoryPage extends StatelessWidget {
// //   final String categoryName;
// //   final String subCategoryName;
// //   final CategoryController controller = CategoryController();

// //   SubSubCategoryPage({
// //     required this.categoryName,
// //     required this.subCategoryName,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     final subSubCategories =
// //         controller.getSubSubCategories(categoryName, subCategoryName);

// //     return Scaffold(
// //       appBar: AppBar(title: Text(subCategoryName)),
// //       body: ListView.builder(
// //         itemCount: subSubCategories.length,
// //         itemBuilder: (context, index) {
// //           return ListTile(
// //             title: Text(subSubCategories[index]),
// //             leading: const Icon(Icons.label_outline),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }

import 'package:flutter/material.dart';
import 'package:flutter_project/controller/shop_controller.dart';
import '../model/category_model.dart';
import '../model/shop_model.dart';

class SubSubCategoryPage extends StatelessWidget {
  final SubCategory subCategory;
  final ShopController controller = ShopController();

  SubSubCategoryPage({super.key, required this.subCategory});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List<Shop> shops = controller.getAllShops(); // fetch shops
    final List<List<Color>> gradientList = [
      [Colors.purple, Colors.blue],
      [Colors.orange, Colors.red],
      [Colors.green, Colors.teal],
      [Colors.pink, Colors.deepPurple],
      [Colors.cyan, Colors.indigo],
    ];

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.grey[100],
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25),

            // Title + Back Button
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back),
                ),
                const SizedBox(width: 15),
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Colors.blue, Colors.purple, Colors.red],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds),
                  child: Text(
                    subCategory.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            // Horizontal scrollable sub-subcategories
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: subCategory.subSubCategories.length,
                itemBuilder: (context, index) {
                  final subSub = subCategory.subSubCategories[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(100, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 4,
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Selected $subSub")),
                        );
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: gradientList[index % gradientList.length],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            subSub,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
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

            const SizedBox(height: 20),

            // Shop Details List
            Expanded(
              child: ListView.builder(
                itemCount: shops.length,
                itemBuilder: (context, index) {
                  final shop = shops[index];
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Shop image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              shop.imageUrl,
                              width: double.infinity,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 8),

                          // Name & Category
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                shop.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  shop.category,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),

                          // Rating & Distance
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text("${shop.rating}"),
                              const SizedBox(width: 12),
                              const Icon(
                                Icons.location_on,
                                size: 16,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 4),
                              Text("${shop.distance} km away"),
                            ],
                          ),
                          const SizedBox(height: 8),

                          // Description
                          Text(
                            shop.description,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 8),

                          // Contact & Location buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {
                                  // TODO: implement call
                                },
                                icon: const Icon(Icons.call),
                                label: const Text("Call"),
                              ),
                              ElevatedButton.icon(
                                onPressed: () {
                                  // TODO: implement map navigation
                                },
                                icon: const Icon(Icons.map),
                                label: const Text("Map"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
