// import 'package:flutter/material.dart';
// import 'package:flutter_project/controller/featured_content_controller.dart';
// import 'package:flutter_project/model/featured_content_model.dart';

// class FeaturedContentView extends StatelessWidget {
//   final FeaturedController controller = FeaturedController();

//   FeaturedContentView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final List<FeaturedItem> featuredItems = controller.getFeaturedItems();

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         const SizedBox(height: 20),
//         ShaderMask(
//           shaderCallback: (bounds) => const LinearGradient(
//             colors: [Colors.blue, Colors.purple, Colors.red],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ).createShader(bounds),
//           child: const Text(
//             'Featured Content',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//         ),
//         const SizedBox(height: 10),
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             children: featuredItems.map((item) {
//               return Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 8),
//                 width: 200,
//                 height: 150,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(16),
//                   image: DecorationImage(
//                     image: NetworkImage(item.imageUrl),
//                     fit: BoxFit.cover,
//                   ),
//                   boxShadow: const [
//                     BoxShadow(
//                       color: Colors.black26,
//                       blurRadius: 5,
//                       offset: Offset(0, 3),
//                     ),
//                   ],
//                 ),
//                 alignment: Alignment.bottomCenter,
//                 child: Container(
//                   width: double.infinity,
//                   padding: const EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                     color: Colors.black.withOpacity(0.5),
//                     borderRadius: const BorderRadius.only(
//                       bottomLeft: Radius.circular(16),
//                       bottomRight: Radius.circular(16),
//                     ),
//                   ),
//                   child: Text(
//                     item.title,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               );
//             }).toList(),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../model/featured_content_model.dart';
import '../view/sub_category_page.dart';

class FeaturedContentView extends StatelessWidget {
  final List<FeaturedItem> featuredItems;

  const FeaturedContentView({super.key, required this.featuredItems});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFF7F00FF), Color(0xFFE100FF)],
            // colors: [Colors.blue, Colors.purple, Colors.red],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: const Text(
            'Featured Content',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: featuredItems.map((item) {
              return GestureDetector(
                onTap: () {
                  // Navigate to category page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SubCategoryPage(
                        category: item.category,
                        subcategoryName: null,
                      ),
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
                      image: NetworkImage(item.imageUrl),
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
                      item.title,
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
