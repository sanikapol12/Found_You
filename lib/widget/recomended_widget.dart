// import 'package:flutter/material.dart';
// import 'package:flutter_project/controller/recomended+controller.dart';
// import 'package:flutter_project/model/recomended_category_model.dart';
// import 'package:flutter_project/view/sub_category_page.dart';


// class RecommendedCategoryWidget extends StatelessWidget {
//   final RecommendedController controller = RecommendedController();

//   RecommendedCategoryWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final List<RecommendedCategory> categories =
//         controller.getRecommendedCategories();

//     final List<List<Color>> gradientList = [
//       [Colors.purple, Colors.blue],
//       [Colors.orange, Colors.red],
//       [Colors.green, Colors.teal],
//       [Colors.pink, Colors.deepPurple],
//       [Colors.cyan, Colors.indigo],
//     ];

//     return SizedBox(
//       height: 180,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: categories.length,
//         padding: const EdgeInsets.symmetric(horizontal: 12),
//         itemBuilder: (context, index) {
//           final cat = categories[index];

//           return GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (_) => SubCategoryPage(category: cat),
//                 ),
//               );
//             },
//             child: Container(
//               width: 140,
//               margin: const EdgeInsets.symmetric(horizontal: 6),
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: gradientList[index % gradientList.length],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//                 borderRadius: BorderRadius.circular(20),
//                 boxShadow: const [
//                   BoxShadow(
//                     color: Colors.black26,
//                     blurRadius: 4,
//                     offset: Offset(0, 3),
//                   )
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   ClipRRect(
//                     borderRadius: const BorderRadius.vertical(
//                       top: Radius.circular(20),
//                     ),
//                     child: Image.network(
//                       "https://picsum.photos/200/140?random=$index",
//                       height: 100,
//                       width: double.infinity,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 6),
//                     child: Text(
//                       cat.name,
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 14,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
