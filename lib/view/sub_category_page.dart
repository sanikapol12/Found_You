// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:flutter_project/controller/favorite_controller.dart';
// import 'package:flutter_project/controller/notification_controller.dart';
// import 'package:flutter_project/controller/profile_controller.dart';
// import 'package:flutter_project/controller/register_business_controller.dart';
// import 'package:flutter_project/model/category_model.dart';
// import 'package:flutter_project/view/subsub_category_page.dart';
// import 'package:flutter_project/view/shop_details_page.dart';
// import 'package:flutter_project/widget/botton_nav_widget.dart';
// import 'package:url_launcher/url_launcher.dart';

// class SubCategoryPage extends StatefulWidget {
//   final Category category;

//   const SubCategoryPage({
//     super.key,
//     required this.category,
//     required subcategoryName,
//   });

//   @override
//   State<SubCategoryPage> createState() => _SubCategoryPageState();
// }

// class _SubCategoryPageState extends State<SubCategoryPage> {
//   final RegesterBusinesscontroller businessController =
//       RegesterBusinesscontroller();
//   final Addtofavoriteclass addtofavoritecontrollerObj = Addtofavoriteclass();
//   final NotificationController notificationController =
//       NotificationController();

//   List<Map<String, dynamic>> allData = [];
//   bool isLoading = true;
//   final Map<int, bool> serviceClickedMap = {}; // To track "Get Service" clicks

//   @override
//   void initState() {
//     super.initState();
//     fetchBusinessData();
//   }

//   Future<void> fetchBusinessData() async {
//     try {
//       final snapshot = await businessController.getbuisnessData();
//       final dynamic s = snapshot;
//       List<Map<String, dynamic>> fetchedData = [];

//       if (s != null) {
//         try {
//           final docs = s.docs;
//           fetchedData = (docs as Iterable)
//               .map((doc) => doc.data() as Map<String, dynamic>)
//               .toList();
//         } catch (_) {
//           try {
//             final data = s.data();
//             if (data is List) {
//               fetchedData = data.whereType<Map<String, dynamic>>().toList();
//             } else if (data is Map<String, dynamic>) {
//               fetchedData = [data];
//             }
//           } catch (_) {
//             fetchedData = [];
//           }
//         }
//       }

//       final selectedCategory = widget.category.name.trim().toLowerCase();
//       final filteredData = fetchedData.where((shop) {
//         final shopCategory = (shop['category'] ?? '')
//             .toString()
//             .trim()
//             .toLowerCase();
//         return shopCategory == selectedCategory;
//       }).toList();

//       setState(() {
//         allData = filteredData;
//         isLoading = false;
//       });

//       log("✅ Selected Category: ${widget.category.name}");
//       log("✅ Total fetched: ${fetchedData.length}");
//       log("✅ Filtered count: ${filteredData.length}");
//     } catch (e) {
//       log("❌ Error fetching data: $e");
//       setState(() => isLoading = false);
//     }
//   }

//   Future<void> _launchCall(String phone) async {
//     final Uri url = Uri(scheme: 'tel', path: phone);
//     if (await canLaunchUrl(url)) {
//       await launchUrl(url);
//     } else {
//       debugPrint("Could not launch phone dialer");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final List<List<Color>> gradientList = [
//       [Colors.purple, Colors.blue],
//       [Colors.orange, Colors.red],
//       [Colors.green, Colors.teal],
//       [Colors.pink, Colors.deepPurple],
//       [Colors.cyan, Colors.indigo],
//     ];

//     final size = MediaQuery.of(context).size;

//     return Scaffold(
//       body: Container(
//         width: size.width,
//         height: size.height,
//         color: Colors.grey[200],
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 25),

//             // 🔹 App Bar
//             Row(
//               children: [
//                 IconButton(
//                   onPressed: () => Navigator.pop(context),
//                   icon: const Icon(Icons.arrow_back),
//                 ),
//                 const SizedBox(width: 15),
//                 ShaderMask(
//                   shaderCallback: (bounds) => const LinearGradient(
//                     colors: [Colors.blue, Colors.purple, Colors.red],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ).createShader(bounds),
//                   child: Text(
//                     widget.category.name,
//                     style: const TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 10),

//             // 🔹 Horizontal Subcategory Buttons
//             SizedBox(
//               height: 100,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: widget.category.subcategories.length,
//                 itemBuilder: (context, index) {
//                   final sub = widget.category.subcategories[index];
//                   return Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 6),
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         padding: EdgeInsets.zero,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         elevation: 4,
//                         backgroundColor: Colors.transparent,
//                         shadowColor: Colors.transparent,
//                       ),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) =>
//                                 SubSubCategoryPage(subCategory: sub as dynamic),
//                           ),
//                         );
//                       },
//                       child: Ink(
//                         decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                             colors: gradientList[index % gradientList.length],
//                             begin: Alignment.topLeft,
//                             end: Alignment.bottomRight,
//                           ),
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         child: Container(
//                           alignment: Alignment.center,
//                           padding: const EdgeInsets.symmetric(
//                             vertical: 12,
//                             horizontal: 12,
//                           ),
//                           child: Text(
//                             sub.name,
//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 14,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),

//             const SizedBox(height: 20),

//             // 🔹 Shop Cards
//             Expanded(
//               child: isLoading
//                   ? const Center(child: CircularProgressIndicator())
//                   : allData.isEmpty
//                   ? const Center(
//                       child: Text(
//                         "No shops found for this category.",
//                         style: TextStyle(fontSize: 16),
//                       ),
//                     )
//                   : ListView.builder(
//                       itemCount: allData.length,
//                       itemBuilder: (context, index) {
//                         final shop = allData[index];
//                         final imageUrl =
//                             shop['imageURL'] ??
//                             shop['imageUrl'] ??
//                             shop['photoUrl'] ??
//                             shop['businessImage'] ??
//                             '';

//                         final isServiceClicked =
//                             serviceClickedMap[index] ?? false;

//                         return GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (_) => ShopDetailsPage(shop: shop),
//                               ),
//                             );
//                           },
//                           child: Card(
//                             elevation: 4,
//                             margin: const EdgeInsets.symmetric(
//                               vertical: 8,
//                               horizontal: 4,
//                             ),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 // 🖼️ Image
//                                 ClipRRect(
//                                   borderRadius: const BorderRadius.vertical(
//                                     top: Radius.circular(15),
//                                   ),
//                                   child: SizedBox(
//                                     width: double.infinity,
//                                     height: 160,
//                                     child: imageUrl.isNotEmpty
//                                         ? Image.network(
//                                             imageUrl,
//                                             fit: BoxFit.cover,
//                                             errorBuilder:
//                                                 (context, error, stackTrace) =>
//                                                     const Center(
//                                                       child: Icon(
//                                                         Icons.store,
//                                                         size: 80,
//                                                         color: Colors.grey,
//                                                       ),
//                                                     ),
//                                           )
//                                         : const Center(
//                                             child: Icon(
//                                               Icons.store,
//                                               size: 80,
//                                               color: Colors.grey,
//                                             ),
//                                           ),
//                                   ),
//                                 ),

//                                 //  Details
//                                 Padding(
//                                   padding: const EdgeInsets.all(12),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           Expanded(
//                                             child: Text(
//                                               shop['businessName'] ?? "No Name",
//                                               style: const TextStyle(
//                                                 fontSize: 18,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                           ),
//                                           Container(
//                                             padding: const EdgeInsets.symmetric(
//                                               horizontal: 8,
//                                               vertical: 4,
//                                             ),
//                                             decoration: BoxDecoration(
//                                               color: Colors.blueAccent,
//                                               borderRadius:
//                                                   BorderRadius.circular(10),
//                                             ),
//                                             child: Text(
//                                               shop['subcategory2'] ?? "Unknown",
//                                               style: const TextStyle(
//                                                 color: Colors.white,
//                                                 fontSize: 12,
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       const SizedBox(height: 8),
//                                       Text(
//                                         shop['discription'] ??
//                                             "No description available",
//                                         style: const TextStyle(
//                                           fontSize: 14,
//                                           color: Colors.black87,
//                                         ),
//                                       ),
//                                       const SizedBox(height: 12),

//                                       // 🔹 Action Buttons
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           ElevatedButton.icon(
//                                             onPressed: () {
//                                               final phone =
//                                                   shop['phoneNo'] ?? "";
//                                               if (phone.isNotEmpty) {
//                                                 _launchCall(phone);
//                                               }
//                                             },
//                                             icon: const Icon(Icons.call),
//                                             label: const Text("Call"),
//                                           ),
//                                           ElevatedButton.icon(
//                                             onPressed: () {},
//                                             icon: const Icon(Icons.map),
//                                             label: const Text("Map"),
//                                           ),
//                                           ElevatedButton.icon(
//                                             onPressed: () async {
//                                               await addtofavoritecontrollerObj
//                                                   .addtofavorite(data: shop);
//                                               ScaffoldMessenger.of(
//                                                 context,
//                                               ).showSnackBar(
//                                                 SnackBar(
//                                                   content: Text(
//                                                     "Added ${shop['businessName'] ?? 'this shop'} to favorites ❤️",
//                                                   ),
//                                                 ),
//                                               );
//                                             },
//                                             icon: const Icon(
//                                               Icons.bookmark_border,
//                                             ),
//                                             label: const Text("Favorite"),
//                                           ),
//                                         ],
//                                       ),

//                                       const SizedBox(height: 20),

//                                       // 🔹 Get Services Button
//                                       SizedBox(
//                                         width: double.infinity,
//                                         child: ElevatedButton.icon(
//                                           onPressed: isServiceClicked
//                                               ? null
//                                               : () async {
//                                                   final userSnap =
//                                                       await ProfileController()
//                                                           .getUserData();
//                                                   final userData =
//                                                       userSnap.data()
//                                                           as Map<
//                                                             String,
//                                                             dynamic
//                                                           >? ??
//                                                       {};

//                                                   await notificationController
//                                                       .addgetServicedata(
//                                                         data: {
//                                                           'userEmail':
//                                                               userData['email'],
//                                                           'phoneNo':
//                                                               userData['phoneNo'],
//                                                           'userName':
//                                                               userData['name'],
//                                                           'timeStamp':
//                                                               DateTime.now(),
//                                                         },
//                                                         businessEmail:
//                                                             shop['email'],
//                                                       );

//                                                   setState(() {
//                                                     serviceClickedMap[index] =
//                                                         true;
//                                                   });

//                                                   ScaffoldMessenger.of(
//                                                     context,
//                                                   ).showSnackBar(
//                                                     const SnackBar(
//                                                       content: Text(
//                                                         "Request sent successfully ✅",
//                                                       ),
//                                                     ),
//                                                   );
//                                                 },
//                                           icon: Icon(
//                                             isServiceClicked
//                                                 ? Icons.hourglass_empty
//                                                 : Icons.shopping_bag_outlined,
//                                             color: Colors.white,
//                                           ),
//                                           label: Text(
//                                             isServiceClicked
//                                                 ? "Pending ⏳"
//                                                 : "Get Services",
//                                             style: const TextStyle(
//                                               color: Colors.white,
//                                             ),
//                                           ),
//                                           style: ElevatedButton.styleFrom(
//                                             backgroundColor: isServiceClicked
//                                                 ? const Color.fromARGB(
//                                                     255,
//                                                     88,
//                                                     88,
//                                                     88,
//                                                   )
//                                                 : Colors.blueAccent,
//                                             shape: RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(12),
//                                             ),
//                                             padding: const EdgeInsets.symmetric(
//                                               vertical: 12,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: const BottomNavWidget(currentIndex: 0),
//     );
//   }
// }

import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/controller/favorite_controller.dart';
import 'package:flutter_project/controller/notification_controller.dart';
import 'package:flutter_project/controller/profile_controller.dart';
import 'package:flutter_project/controller/register_business_controller.dart';
import 'package:flutter_project/model/category_model.dart';
import 'package:flutter_project/view/subsub_category_page.dart';
import 'package:flutter_project/view/shop_details_page.dart';
import 'package:url_launcher/url_launcher.dart';

class SubCategoryPage extends StatefulWidget {
  final Category category;

  const SubCategoryPage({
    super.key,
    required this.category,
    required subcategoryName,
  });

  @override
  State<SubCategoryPage> createState() => _SubCategoryPageState();
}

class _SubCategoryPageState extends State<SubCategoryPage> {
  final TextEditingController reviewController = TextEditingController();
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final RegesterBusinesscontroller businessController =
      RegesterBusinesscontroller();
  final Addtofavoriteclass addtofavoritecontrollerObj = Addtofavoriteclass();
  final NotificationController notificationController =
      NotificationController();

  List<Map<String, dynamic>> allData = [];
  bool isFavorite = false; // define at top inside your StatefulWidget
  bool isLoading = true;
  final Map<int, bool> serviceClickedMap = {}; // To track "Get Service" clicks

  @override
  void initState() {
    super.initState();
    fetchBusinessData();
  }

  Future<void> fetchBusinessData() async {
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

      final selectedCategory = widget.category.name.trim().toLowerCase();
      final filteredData = fetchedData.where((shop) {
        final shopCategory = (shop['category'] ?? '')
            .toString()
            .trim()
            .toLowerCase();
        return shopCategory == selectedCategory;
      }).toList();

      setState(() {
        allData = filteredData;
        isLoading = false;
      });

      log("✅ Selected Category: ${widget.category.name}");
      log("✅ Total fetched: ${fetchedData.length}");
      log("✅ Filtered count: ${filteredData.length}");
    } catch (e) {
      log("❌ Error fetching data: $e");
      setState(() => isLoading = false);
    }
  }

  // 🔹 Calculate average rating
  double getAverageRating(dynamic ratingsData) {
    if (ratingsData == null) return 0.0;

    if (ratingsData is List) {
      if (ratingsData.isEmpty) return 0.0;
      double sum = 0;
      for (var r in ratingsData) {
        if (r is num) sum += r.toDouble();
      }
      return sum / ratingsData.length;
    } else if (ratingsData is num) {
      return ratingsData.toDouble();
    }
    return 0.0;
  }

  Future<void> _launchCall(String phone) async {
    final Uri url = Uri(scheme: 'tel', path: phone);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      debugPrint("Could not launch phone dialer");
    }
  }

  @override
  Widget build(BuildContext context) {
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

            //  App Bar
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [Colors.pink, Colors.purple],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors
                          .white, // Must stay white for ShaderMask to show gradient
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Color(0xFF7F00FF), Color(0xFFE100FF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds),
                  child: Text(
                    widget.category.name,
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

            //  Horizontal Subcategory Buttons
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.category.subcategories.length,
                itemBuilder: (context, index) {
                  final sub = widget.category.subcategories[index];
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
                                SubSubCategoryPage(subCategory: sub as dynamic),
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

            //  Shop Cards
            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : allData.isEmpty
                  ? const Center(
                      child: Text(
                        "No shops found for this category.",
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  : ListView.builder(
                      itemCount: allData.length,
                      itemBuilder: (context, index) {
                        final shop = allData[index];
                        final imageUrl =
                            shop['imageURL'] ??
                            shop['imageUrl'] ??
                            shop['photoUrl'] ??
                            shop['businessImage'] ??
                            '';
                        final isServiceClicked =
                            serviceClickedMap[index] ?? false;

                        //  Calculate average rating
                        // final avgRating = getAverageRating(
                        //   shop['ratings'],
                        // ).toStringAsFixed(1);

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ShopDetailsPage(shop: shop),
                              ),
                            );
                          },
                          child: Card(
                            elevation: 4,
                            margin: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 4,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //  Image
                                ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(15),
                                  ),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 160,
                                    child: imageUrl.isNotEmpty
                                        ? Image.network(
                                            imageUrl,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    const Center(
                                                      child: Icon(
                                                        Icons.store,
                                                        size: 80,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                          )
                                        : const Center(
                                            child: Icon(
                                              Icons.store,
                                              size: 80,
                                              color: Colors.grey,
                                            ),
                                          ),
                                  ),
                                ),

                                //  Details
                                Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              shop['businessName'] ?? "No Name",
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 4,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.blueAccent,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Text(
                                              shop['subcategory2'] ?? "Unknown",
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      const SizedBox(height: 6),

                                      //  Rating Row
                                      //  Real-time Rating Display (From Firestore)
                                      StreamBuilder<QuerySnapshot>(
                                        stream: FirebaseFirestore.instance
                                            .collection('reviews')
                                            .where(
                                              'shopId',
                                              isEqualTo:
                                                  shop['id'] ??
                                                  shop['businessName'],
                                            )
                                            .snapshots(),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return const Row(
                                              children: [
                                                SizedBox(
                                                  width: 16,
                                                  height: 16,
                                                  child:
                                                      CircularProgressIndicator(
                                                        strokeWidth: 2,
                                                      ),
                                                ),
                                                SizedBox(width: 6),
                                                Text(
                                                  "Loading...",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black54,
                                                  ),
                                                ),
                                              ],
                                            );
                                          }

                                          if (!snapshot.hasData ||
                                              snapshot.data!.docs.isEmpty) {
                                            return const Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.grey,
                                                  size: 20,
                                                ),
                                                SizedBox(width: 4),
                                                Text(
                                                  "No ratings yet",
                                                  style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            );
                                          }

                                          final reviews = snapshot.data!.docs;
                                          double total = 0;
                                          for (var doc in reviews) {
                                            total += (doc['rating'] ?? 0)
                                                .toDouble();
                                          }
                                          final avg = total / reviews.length;

                                          return Row(
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                                size: 20,
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                "${avg.toStringAsFixed(1)} ★ (${reviews.length})",
                                                style: const TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),

                                      const SizedBox(height: 8),
                                      Text(
                                        shop['discription'] ??
                                            "No description available",
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      const SizedBox(height: 12),

                                      //  Action Buttons
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ElevatedButton.icon(
                                            onPressed: () {
                                              final phone =
                                                  shop['phoneNo'] ?? "";
                                              if (phone.isNotEmpty) {
                                                _launchCall(phone);
                                              }
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              elevation: 2,
                                            ),
                                            icon: const Icon(
                                              Icons.call,
                                              color: Colors.purple,
                                            ),
                                            label: Text(
                                              "Call",
                                              style: TextStyle(
                                                color: Colors
                                                    .purple, // 🟢 text color
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          ElevatedButton.icon(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              elevation: 2,
                                            ),
                                            icon: const Icon(
                                              Icons.map,
                                              color: Colors.purple,
                                            ),
                                            label: const Text(
                                              "Map",
                                              style: TextStyle(
                                                color: Colors
                                                    .purple, // 🟢 text color
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),

                                          //  bool isFavorite = false; // define this at top of your StatefulWidget
                                          ElevatedButton.icon(
                                            onPressed: () async {
                                              setState(() {
                                                isFavorite =
                                                    !isFavorite; // toggle color state
                                              });

                                              if (isFavorite) {
                                                // Add to favorites
                                                await addtofavoritecontrollerObj
                                                    .addtofavorite(data: shop);
                                                ScaffoldMessenger.of(
                                                  context,
                                                ).showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      "Added ${shop['businessName'] ?? 'this shop'} to favorites ❤️",
                                                    ),
                                                  ),
                                                );
                                              } else {
                                                // (Optional) remove logic can be added later
                                                ScaffoldMessenger.of(
                                                  context,
                                                ).showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      "Removed ${shop['businessName'] ?? 'this shop'} from favorites 💔",
                                                    ),
                                                  ),
                                                );
                                              }
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: isFavorite
                                                  ? Colors.purple
                                                  : Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                // // side: const BorderSide(

                                                //   width: 1.2,
                                                // ),
                                              ),
                                              elevation: 2,
                                            ),
                                            icon: Icon(
                                              isFavorite
                                                  ? Icons.bookmark
                                                  : Icons.bookmark_border,
                                              color: isFavorite
                                                  ? Colors.white
                                                  : Colors
                                                        .purple, // 🔹 icon color toggle
                                            ),
                                            label: Text(
                                              isFavorite
                                                  ? "Favorited"
                                                  : "Favorite",
                                              style: TextStyle(
                                                color: isFavorite
                                                    ? Colors.white
                                                    : Colors
                                                          .purple, // 🔹 text color toggle
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      const SizedBox(height: 20),

                                      //  Get Services Button
                                      SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton.icon(
                                          onPressed: isServiceClicked
                                              ? null
                                              : () async {
                                                  final userSnap =
                                                      await ProfileController()
                                                          .getUserData();
                                                  final userData =
                                                      userSnap.data()
                                                          as Map<
                                                            String,
                                                            dynamic
                                                          >? ??
                                                      {};

                                                  await notificationController
                                                      .addGetServiceData(
                                                        data: {
                                                          'userEmail':
                                                              userData['email'],
                                                          'phoneNo':
                                                              userData['phoneNo'],
                                                          'userName':
                                                              userData['name'],
                                                          'timeStamp':
                                                              DateTime.now(),
                                                        },
                                                        businessEmail:
                                                            shop['email'],
                                                      );

                                                  setState(() {
                                                    serviceClickedMap[index] =
                                                        true;
                                                  });

                                                  ScaffoldMessenger.of(
                                                    context,
                                                  ).showSnackBar(
                                                    const SnackBar(
                                                      content: Text(
                                                        "Request sent successfully ✅",
                                                      ),
                                                    ),
                                                  );
                                                },
                                          icon: Icon(
                                            isServiceClicked
                                                ? Icons.hourglass_empty
                                                : Icons.shopping_bag_outlined,
                                            color: Colors.white,
                                          ),
                                          label: Text(
                                            isServiceClicked
                                                ? "Pending ⏳"
                                                : "Get Services",
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: isServiceClicked
                                                ? const Color.fromARGB(
                                                    255,
                                                    88,
                                                    88,
                                                    88,
                                                  )
                                                : Colors.blueAccent,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 12,
                                            ),
                                          ),
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
            ),
          ],
        ),
      ),
      //bottomNavigationBar: const BottomNavWidget(currentIndex: 0),
    );
  }
}
