// import 'package:flutter/material.dart';
// import 'package:flutter_project/view/subsub_category_page.dart';
// import '../controller/category_controller.dart';
// import '../model/category_model.dart';

// class SubCategoryPage extends StatelessWidget {
//   final Category category;
//   final CategoryController controller = CategoryController();

//   SubCategoryPage({super.key, required this.category});

//   @override
//   Widget build(BuildContext context) {
//    // final subcategories = controller.getSubCategories(category);

//     // return Scaffold(
//     //   appBar: AppBar(title: Text(category.name)),
//     //   body: ListView.builder(
//     //     itemCount: subcategories.length,
//     //     itemBuilder: (context, index) {
//     //       final subCategory = subcategories[index];
//     //       return Card(
//     //         margin: const EdgeInsets.all(8),
//     //         child: ListTile(
//     //           title: Text(subCategory.name),
//     //           trailing: const Icon(Icons.arrow_forward_ios),
//     //           onTap: () {
//     //             Navigator.push(
//     //               context,
//     //               MaterialPageRoute(
//     //                 builder: (context) => SubSubPage(subCategory: subCategory),
//     //               ),
//     //             );
//     //           },
//     //         ),
//     //       );
//     //     },
//     //   ),
//     // );

//     final List<List<Color>> gradientList = [
//       [Colors.purple, Colors.blue],
//       [Colors.orange, Colors.red],
//       [Colors.green, Colors.teal],
//       [Colors.pink, Colors.deepPurple],
//       [Colors.cyan, Colors.indigo],
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         title: ShaderMask(
//           shaderCallback: (bounds) => LinearGradient(
//             colors: [Colors.blue, Colors.purple],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
//           child: Text(
//             category.name,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Horizontal Subcategory Buttons (dynamic)
//               SizedBox(
//                 height: 150,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     child: GridView.builder(
//                       scrollDirection: Axis.horizontal,
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 1,
//                             mainAxisSpacing: 12,
//                             crossAxisSpacing: 12,
//                             childAspectRatio: 1,
//                           ),
//                       itemCount:
//                           category.subcategories.length, //  dynamic count
//                       itemBuilder: (context, index) {
//                         final subCategory =
//                             category.subcategories[index]; //  dynamic item
//                         final gradientColors =
//                             gradientList[index % gradientList.length];

//                         return Container(
//                           alignment: Alignment.center,
//                           width: 250,
//                           height: 60,
//                           child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               padding: EdgeInsets.zero,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                               elevation: 6,
//                               shadowColor: Colors.black.withOpacity(0.3),
//                               backgroundColor: Colors.transparent,
//                             ),
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (_) => SubSubCategoryPage(
//                                     subCategory:
//                                         subCategory, categoryName: '', subCategoryName: '', //  pass dynamic subcategory
//                                   ),
//                                 ),
//                               );
//                             },
//                             child: Ink(
//                               decoration: BoxDecoration(
//                                 gradient: LinearGradient(
//                                   colors: gradientColors,
//                                   begin: Alignment.topLeft,
//                                   end: Alignment.bottomRight,
//                                 ),
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                               child: Container(
//                                 alignment: Alignment.center,
//                                 padding: const EdgeInsets.all(20),
//                                 child: Center(
//                                   child: Text(
//                                     subCategory.name,
//                                     style: const TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 16,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 20),

//               // Shop Grid Section
//               // Padding(
//               //   padding: const EdgeInsets.symmetric(horizontal: 16),
//               //   child: GridView.builder(
//               //     shrinkWrap: true,
//               //     physics: const NeverScrollableScrollPhysics(),
//               //     itemCount: shopList.length,
//               //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               //       crossAxisCount: 2,
//               //       crossAxisSpacing: 12,
//               //       mainAxisSpacing: 12,
//               //       childAspectRatio: 0.75,
//               //     ),
//               //     itemBuilder: (context, index) {
//               //       final shop = shopList[index];
//               //       return Container(
//               //         decoration: BoxDecoration(
//               //           color: Colors.white,
//               //           borderRadius: BorderRadius.circular(16),
//               //           boxShadow: [
//               //             BoxShadow(
//               //               color: Colors.black12,
//               //               blurRadius: 6,
//               //               offset: const Offset(2, 2),
//               //             ),
//               //           ],
//               //         ),
//               //         child: Column(
//               //           crossAxisAlignment: CrossAxisAlignment.start,
//               //           children: [
//               //             ClipRRect(
//               //               borderRadius:
//               //                   const BorderRadius.vertical(top: Radius.circular(16)),
//               //               child: Image.network(
//               //                 shop.image,
//               //                 height: 100,
//               //                 width: double.infinity,
//               //                 fit: BoxFit.cover,
//               //               ),
//               //             ),
//               //             Padding(
//               //               padding: const EdgeInsets.all(8),
//               //               child: Column(
//               //                 crossAxisAlignment: CrossAxisAlignment.start,
//               //                 children: [
//               //                   Text(
//               //                     shop.name,
//               //                     style: const TextStyle(
//               //                       fontSize: 16,
//               //                       fontWeight: FontWeight.bold,
//               //                     ),
//               //                   ),
//               //                   const SizedBox(height: 4),
//               //                   Row(
//               //                     children: [
//               //                       const Icon(Icons.star,
//               //                           color: Colors.orange, size: 16),
//               //                       const SizedBox(width: 4),
//               //                       Text('${shop.rating}'),
//               //                     ],
//               //                   ),
//               //                   const SizedBox(height: 4),
//               //                   Row(
//               //                     children: [
//               //                       const Icon(Icons.location_on, size: 16),
//               //                       const SizedBox(width: 4),
//               //                       Expanded(
//               //                         child: Text(
//               //                           shop.location,
//               //                           style: const TextStyle(fontSize: 12),
//               //                           overflow: TextOverflow.ellipsis,
//               //                         ),
//               //                       ),
//               //                     ],
//               //                   ),
//               //                 ],
//               //               ),
//               //             ),
//               //           ],
//               //         ),
//               //       );
//               //     },
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_project/controller/shop_controller.dart';
import 'package:flutter_project/model/shop_model.dart';
import 'package:flutter_project/view/subsub_category_page.dart';
import '../model/category_model.dart';

class SubCategoryPage extends StatelessWidget {
  final Category category;
  final ShopController controller = ShopController();

  SubCategoryPage({super.key, required this.category, required subcategoryName});

  @override
  Widget build(BuildContext context) {
    final List<Shop> shops = controller.getAllShops();
    final List<List<Color>> gradientList = [
      [Colors.purple, Colors.blue],
      [Colors.orange, Colors.red],
      [Colors.green, Colors.teal],
      [Colors.pink, Colors.deepPurple],
      [Colors.cyan, Colors.indigo],
    ];

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.grey[200],
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25),

            // Back + Title Row
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
                    category.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Horizontal Subcategory Buttons
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: category.subcategories.length,
                itemBuilder: (context, index) {
                  final sub = category.subcategories[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 4,
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                SubSubCategoryPage(subCategory: sub),
                          ),
                        );
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: gradientList[index % gradientList.length],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 12,
                          ),
                          child: Text(
                            sub.name,
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
                    margin: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 0,
                    ),
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
