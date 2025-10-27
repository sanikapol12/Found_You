// import 'package:flutter/material.dart';
// import 'package:flutter_project/view/register_business.dart';
// import 'package:flutter_project/view/sub_category_page.dart';
// import '../controller/category_controller.dart';
// import '../model/category_model.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final CategoryController controller = CategoryController();

//   late List<Category> categories; // ✅ define categories list here

//   // gradient colors for each card
//   final List<List<Color>> gradientList = [
//     [Colors.purple, Colors.blue],
//     [Colors.orange, Colors.red],
//     [Colors.green, Colors.teal],
//     [Colors.pink, Colors.deepPurple],
//     [Colors.cyan, Colors.indigo],
//   ];

//   @override
//   void initState() {
//     super.initState();
//     categories = controller.getAllCategories(widget.subCategory.subSubCategories);

//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           width: size.width,
//           height: size.height,
//           child: Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 // Top App Bar
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         Builder(
//                           builder: (context) {
//                             return IconButton(
//                               onPressed: () {
//                                 Scaffold.of(context).openDrawer();
//                               },
//                               icon: const Icon(Icons.menu, color: Colors.teal),
//                             );
//                           },
//                         ),
//                         const SizedBox(width: 65),
//                         const Padding(
//                           padding: EdgeInsets.all(5.0),
//                           child: Text(
//                             "FOUND YOU",
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Color.fromARGB(255, 79, 86, 215),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         IconButton(
//                           onPressed: () {},
//                           icon: const Icon(
//                             Icons.notification_add_rounded,
//                             color: Color.fromARGB(255, 79, 86, 215),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),

//                 const SizedBox(height: 20),

//                 //  Search Bar
//                 TextField(
//                   decoration: InputDecoration(
//                     hintText: 'Search...',
//                     prefixIcon: const Icon(Icons.search),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     filled: true,
//                     fillColor: Colors.white,
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 // Business Register Button
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     padding: EdgeInsets.zero,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     elevation: 4,
//                     backgroundColor: Colors.transparent,
//                     shadowColor: Colors.transparent,
//                   ),
//                   onPressed: () {
//                      Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (_) => BusinessForm(),
//                             ),
//                           );
//                   },
//                   child: Ink(
//                     decoration: BoxDecoration(
//                       gradient: const LinearGradient(
//                         colors: [Color(0xFF7F00FF), Color(0xFFE100FF)],
//                         begin: Alignment.topLeft,
//                         end: Alignment.bottomRight,
//                       ),
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     child: Container(
//                       alignment: Alignment.center,
//                       height: 50,
//                       width: 220,
//                       child: const Text(
//                         'Register Your Business',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 //  Title
//                 ShaderMask(
//                   shaderCallback: (bounds) => const LinearGradient(
//                     colors: [Colors.blue, Colors.purple, Colors.red],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ).createShader(bounds),
//                   child: const Text(
//                     'Popular Categories',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 //  GridView of Categories
//                 SizedBox(
//                   height: 280,
//                   child: GridView.builder(
//                     scrollDirection: Axis.horizontal,
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       mainAxisSpacing: 12,
//                       crossAxisSpacing: 12,
//                       childAspectRatio: 1,
//                     ),
//                     itemCount: categories.length,
//                     itemBuilder: (context, index) {
//                       final cat = categories[index];
//                       return ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           padding: EdgeInsets.zero,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           elevation: 6,
//                           shadowColor: Colors.black.withOpacity(0.3),
//                           backgroundColor: Colors.transparent,
//                         ),
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (_) => SubCategoryPage(category: cat),
//                             ),
//                           );
//                         },
//                         child: Ink(
//                           decoration: BoxDecoration(
//                             gradient: LinearGradient(
//                               colors:
//                                   gradientList[index % gradientList.length],
//                               begin: Alignment.topLeft,
//                               end: Alignment.bottomRight,
//                             ),
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           child: Container(
//                             alignment: Alignment.center,
//                             padding: const EdgeInsets.symmetric(
//                               vertical: 12,
//                               horizontal: 8,
//                             ),
//                             child: Text(
//                               cat.name,
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_project/model/featured_content_dataprovider_model.dart';
import 'package:flutter_project/view/banner.dart';
import 'package:flutter_project/view/drawer.dart';
import 'package:flutter_project/view/featured_content.dart';
import 'package:flutter_project/view/notification_page.dart';
import 'package:flutter_project/widget/botton_nav_widget.dart';
import '../controller/category_controller.dart';
import '../model/category_model.dart';
import '../view/register_business.dart';
import '../view/sub_category_page.dart';

final CategoryController controller = CategoryController();
final List<Category> categories = controller.getAllCategories();

// Featured content
final featuredItems = FeaturedData.getFeaturedItems(categories);

class HomePage extends StatefulWidget {
HomePage({super.key});

@override
 State createState() => _HomePageState();




}

class _HomePageState extends State{


 // int _selectedIndex = 0;
  final CategoryController controller = CategoryController();



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List<Category> categories = controller.getAllCategories();

    final List<List<Color>> gradientList = [
      [Colors.purple, Colors.blue],
      [Colors.orange, Colors.red],
      [Colors.green, Colors.teal],
      [Colors.pink, Colors.deepPurple],
      [Colors.cyan, Colors.indigo],
    ];

  


    return Scaffold(
       drawer: AppDrawer(),
   

      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          color: Colors.grey[100],
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 25),

              //  App bar row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Builder(
                    builder: (context) {
                      return IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: const Icon(Icons.menu, color: Colors.teal),
                      );
                    },
                  ),
                  const Text(
                    "FOUND YOU",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 79, 86, 215),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Navigate to NotificationPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => NotificationPage()),
                      );
                    },
                    icon: const Icon(
                      Icons.notifications,
                      color: Color.fromARGB(255, 79, 86, 215),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Search bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),

              const SizedBox(height: 20),

              // Register Business Button
              ElevatedButton(
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
                    MaterialPageRoute(builder: (_) => BusinessForm()),
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
                    width: 220,
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

              const SizedBox(height: 30),

              //  Banner Carousel (MVC View)
              const BannerCarousel(),

              const SizedBox(height: 30),

              //  Title
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Colors.blue, Colors.purple, Colors.red],
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

              //  Category Grid
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
                            builder: (_) => SubCategoryPage(category: cat, subcategoryName: null,),
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          // Category icon as background
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.network(
                              cat.icon,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                              color: Colors.black.withOpacity(
                                0.2,
                              ), // subtle fade
                              colorBlendMode: BlendMode.darken,
                            ),
                          ),
                          // Optional gradient overlay
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
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
                          // Category name text
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

              // Featured Content Section
              FeaturedContentView(featuredItems: featuredItems),

              const SizedBox(height: 20),
              // const Text(
              //   "Recommended Categories",
              //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              // ),
              // const SizedBox(height: 12),
              // RecommendedCategoryWidget(),
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Colors.blue, Colors.purple, Colors.red],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds),
                child: const Text(
                  'Recomended Categories',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
       bottomNavigationBar: const BottomNavWidget(currentIndex: 0),

    );
  }
}
