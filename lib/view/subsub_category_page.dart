// import 'package:flutter/material.dart';
// import 'package:flutter_project/controller/shop_controller.dart';
// import 'package:flutter_project/view/banner.dart';
// import 'package:flutter_project/widget/botton_nav_widget.dart';
// import '../model/category_model.dart';
// import '../model/shop_model.dart';

// class SubSubCategoryPage extends StatelessWidget {
//   final SubCategory subCategory;
//   final ShopController controller = ShopController();

//   SubSubCategoryPage({super.key, required this.subCategory});

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final List<Shop> shops = controller.getAllShops(); // fetch shops
//     final List<List<Color>> gradientList = [
//       [Colors.purple, Colors.blue],
//       [Colors.orange, Colors.red],
//       [Colors.green, Colors.teal],
//       [Colors.pink, Colors.deepPurple],
//       [Colors.cyan, Colors.indigo],
//     ];

//     return Scaffold(
//       body: Container(
//         width: size.width,
//         height: size.height,
//         color: Colors.grey[100],
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 25),

//             // Title + Back Button
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
//                     subCategory.name,
//                     style: const TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 15),

//             // Horizontal scrollable sub-subcategories
//             SizedBox(
//               height: 50,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: subCategory.subSubCategories.length,
//                 itemBuilder: (context, index) {
//                   final subSub = subCategory.subSubCategories[index];
//                   return Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 6),
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         padding: EdgeInsets.zero,
//                         minimumSize: const Size(100, 40),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(25),
//                         ),
//                         elevation: 4,
//                         backgroundColor: Colors.transparent,
//                         shadowColor: Colors.transparent,
//                       ),
//                       onPressed: () {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text("Selected $subSub")),
//                         );
//                       },
//                       child: Ink(
//                         decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                             colors: gradientList[index % gradientList.length],
//                             begin: Alignment.topLeft,
//                             end: Alignment.bottomRight,
//                           ),
//                           borderRadius: BorderRadius.circular(25),
//                         ),
//                         child: Container(
//                           alignment: Alignment.center,
//                           padding: const EdgeInsets.symmetric(horizontal: 16),
//                           child: Text(
//                             subSub,
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
//             const BannerCarousel(),
//             const SizedBox(height: 20),

//             // Shop Details List
//             Expanded(
//               child: ListView.builder(
//                 itemCount: shops.length,
//                 itemBuilder: (context, index) {
//                   final shop = shops[index];
//                   return Card(
//                     elevation: 4,
//                     margin: const EdgeInsets.symmetric(vertical: 8),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(12),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // Shop image
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(15),
//                             child: Image.network(
//                               shop.imageUrl,
//                               width: double.infinity,
//                               height: 150,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           const SizedBox(height: 8),

//                           // Name & Category
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 shop.name,
//                                 style: const TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 8,
//                                   vertical: 4,
//                                 ),
//                                 decoration: BoxDecoration(
//                                   color: Colors.blueAccent,
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: Text(
//                                   shop.category,
//                                   style: const TextStyle(color: Colors.white),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 4),

//                           // Rating & Distance
//                           Row(
//                             children: [
//                               const Icon(
//                                 Icons.star,
//                                 color: Colors.orange,
//                                 size: 16,
//                               ),
//                               const SizedBox(width: 4),
//                               Text("${shop.rating}"),
//                               const SizedBox(width: 12),
//                               const Icon(
//                                 Icons.location_on,
//                                 size: 16,
//                                 color: Colors.grey,
//                               ),
//                               const SizedBox(width: 4),
//                               Text("${shop.distance} km away"),
//                             ],
//                           ),
//                           const SizedBox(height: 8),

//                           // Description
//                           Text(
//                             shop.description,
//                             style: const TextStyle(
//                               fontSize: 14,
//                               color: Colors.black87,
//                             ),
//                           ),
//                           const SizedBox(height: 8),

//                           // Contact & Location buttons
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               ElevatedButton.icon(
//                                 onPressed: () {
//                                   // TODO: implement call
//                                 },
//                                 icon: const Icon(Icons.call),
//                                 label: const Text("Call"),
//                               ),
//                               ElevatedButton.icon(
//                                 onPressed: () {
//                                   // TODO: implement map navigation
//                                 },
//                                 icon: const Icon(Icons.map),
//                                 label: const Text("Map"),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: const BottomNavWidget(currentIndex: 0),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_project/model.dart/categoryModel.dart';

// class SubSubCategoryPage extends StatelessWidget {
//   final SubCategory subCategory;

//   const SubSubCategoryPage({super.key, required this.subCategory});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(subCategory.name),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: ListView.builder(
//         padding: const EdgeInsets.all(16),
//         itemCount: subCategory.subSubCategories.length,
//         itemBuilder: (context, index) {
//           final subSub = subCategory.subSubCategories[index];
//           return GestureDetector(
//             child: Container(
//               margin: const EdgeInsets.symmetric(vertical: 8),
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [Colors.blue, Colors.purple],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//                 borderRadius: BorderRadius.circular(16),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black26,
//                     blurRadius: 4,
//                     offset: Offset(2, 2),
//                   ),
//                 ],
//               ),
//               child: ListTile(
//                 title: Text(
//                   subSub,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 trailing: const Icon(
//                   Icons.arrow_forward_ios,
//                   color: Colors.white,
//                 ),
//                 onTap: () {
//                   // TODO: Navigate to shop details or another page if needed
//                 },
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/controller/favorite_controller.dart';
import 'package:flutter_project/controller/notification_controller.dart';
import 'package:flutter_project/controller/profile_controller.dart';
import 'package:flutter_project/controller/register_business_controller.dart';
import 'package:flutter_project/model/category_model.dart';
import 'package:flutter_project/view/shop_details_page.dart';
import 'package:url_launcher/url_launcher.dart';

class SubSubCategoryPage extends StatefulWidget {
  final SubCategory subCategory;
  const SubSubCategoryPage({super.key, required this.subCategory});

  @override
  State<SubSubCategoryPage> createState() => _SubSubCategoryPageState();
}

class _SubSubCategoryPageState extends State<SubSubCategoryPage> {
  bool isFavorite = false;
  final RegesterBusinesscontroller businessController =
      RegesterBusinesscontroller();
  final Addtofavoriteclass addtofavoritecontrollerObj = Addtofavoriteclass();
  final NotificationController notificationController =
      NotificationController();

  List<Map<String, dynamic>> allData = [];
  List<Map<String, dynamic>> displayedData = [];
  bool isLoading = true;
  String selectedCategory = "All";
  final Map<int, bool> serviceClickedMap = {};
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

      // Compare Firestore 'category' field with passed category
      final passedCategory = widget.subCategory.name.trim().toLowerCase();
      final filteredByMainCategory = fetchedData.where((shop) {
        final shopCategory = (shop['subcategory1'] ?? '')
            .toString()
            .trim()
            .toLowerCase();
        return shopCategory == passedCategory;
      }).toList();

      setState(() {
        allData = filteredByMainCategory;
        displayedData = allData; // Default show all
        isLoading = false;
      });

      debugPrint("Fetched: ${fetchedData.length}");
      debugPrint(
        "Filtered by category '$passedCategory': ${filteredByMainCategory.length}",
      );
    } catch (e) {
      debugPrint("Error fetching business data: $e");
      setState(() => isLoading = false);
    }
  }

  void filterBySubCategory(String categoryName) {
    setState(() {
      selectedCategory = categoryName;
      if (categoryName == "All") {
        displayedData = allData;
      } else {
        displayedData = allData.where((shop) {
          final shopSubCategory = (shop['subcategory2'] ?? '')
              .toString()
              .trim()
              .toLowerCase();
          return shopSubCategory == categoryName.trim().toLowerCase();
        }).toList();
      }
    });
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
    final categories = ["All", ...widget.subCategory.subSubCategories];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white, // Important for ShaderMask to apply gradient
            ),
          ),
        ),
        title: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
          child: Text(
            widget.subCategory.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // centerTitle: true,
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Horizontal category buttons
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: categories.map((categoryName) {
                final isSelected = categoryName == selectedCategory;
                return GestureDetector(
                  onTap: () => filterBySubCategory(categoryName),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: isSelected
                            ? [Colors.purple, Colors.blue]
                            : [Colors.grey.shade300, Colors.grey.shade200],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 4,
                          offset: const Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        categoryName,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 20),

          // Dynamic Shop List
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
                    itemCount: displayedData.length,
                    itemBuilder: (context, index) {
                      final shop = displayedData[index];
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
                              // 🖼️ Image
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
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

                                    // 🔹 Action Buttons
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ElevatedButton.icon(
                                          onPressed: () {
                                            final phone = shop['phoneNo'] ?? "";
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
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
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
    );
  }
}
