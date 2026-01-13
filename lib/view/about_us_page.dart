// import 'package:flutter/material.dart';
// import 'package:animate_do/animate_do.dart';

// class AboutPage extends StatelessWidget {
//   const AboutPage({Key? key}) : super(key: key);

//   // 🔹 Reusable card widget with animation
//   Widget _personCard({
//     required String imagePath,
//     required String name,
//     required String thankYou,
//     int delay = 0,
//   }) {
//     return ZoomIn(
//       delay: Duration(milliseconds: delay),
//       duration: const Duration(milliseconds: 700),
//       child: Container(
//         width: 250,
//         margin: const EdgeInsets.only(right: 14),
//         decoration: BoxDecoration(
//           color: Colors.white.withOpacity(0.92),
//           borderRadius: BorderRadius.circular(16),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.1),
//               blurRadius: 8,
//               offset: const Offset(2, 3),
//             ),
//           ],
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               CircleAvatar(radius: 36, backgroundImage: AssetImage(imagePath)),
//               const SizedBox(height: 10),
//               Text(
//                 name,
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black87,
//                   fontSize: 16,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Text(
//                 thankYou,
//                 textAlign: TextAlign.center,
//                 softWrap: true,
//                 style: const TextStyle(
//                   fontSize: 13.5,
//                   height: 1.5,
//                   color: Colors.black54,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // 🔹 Reusable side image + text widget (for optional use)
//   Widget _sideImageWithText({
//     required String imagePath,
//     required String title,
//     required String description,
//     required String thankYou,
//     bool imageLeft = true,
//     int delay = 0,
//   }) {
//     final image = ClipRRect(
//       borderRadius: BorderRadius.circular(12),
//       child: Image.asset(imagePath, width: 110, height: 110, fit: BoxFit.cover),
//     );

//     final text = Expanded(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 14.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               description,
//               softWrap: true,
//               style: const TextStyle(
//                 fontSize: 14,
//                 color: Colors.white70,
//                 height: 1.5,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               thankYou,
//               style: const TextStyle(
//                 fontSize: 13,
//                 fontStyle: FontStyle.italic,
//                 color: Colors.amberAccent,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );

//     return FadeInUp(
//       delay: Duration(milliseconds: delay),
//       duration: const Duration(milliseconds: 800),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 14),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: imageLeft ? [image, text] : [text, image],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Container(
//           margin: const EdgeInsets.only(left: 8),
//           // decoration: const BoxDecoration(
//           //   // shape: BoxShape.circle,
//           //   gradient: LinearGradient(
//           //     colors: [Color(0xFF7F00FF), Color(0xFFE100FF)],
//           //     begin: Alignment.topLeft,
//           //     end: Alignment.bottomRight,
//           //   ),
//           // ),
//           child: IconButton(
//             icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
//             onPressed: () => Navigator.pop(context),
//           ),
//         ),
//         title: const Text('About Us', style: TextStyle(color: Colors.white)),
//         centerTitle: true,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Color(0xFF7F00FF), Color(0xFFE100FF)],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//         ),
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFF7F00FF), Color(0xFFE100FF)],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(18.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               // 🌟 Add image from assets (with animation)
//               FadeInDown(
//                 delay: const Duration(milliseconds: 200),
//                 duration: const Duration(milliseconds: 800),
//                 child: Center(
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(16),
//                     child: Image.asset(
//                       'assets/jpg/shashi_bagal.jpeg', // 👈 your asset image path
//                       width: 220,
//                       height: 220,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 20),

//               FadeInUp(
//                 delay: const Duration(milliseconds: 400),
//                 child: const Text(
//                   '''Every lecture from him feels like a step towards becoming a better version of ourselves. He encourages us to think independently, ask questions fearlessly, and never stop learning. The way he connects with every student and motivates everyone to do their best is truly special.''',
//                   style: TextStyle(color: Colors.white70, height: 1.5),
//                   textAlign: TextAlign.justify,
//                 ),
//               ),

//               const SizedBox(height: 25),

//               // 🔹 Horizontal Scroll Cards Section
//               FadeInUp(
//                 delay: const Duration(milliseconds: 500),
//                 duration: const Duration(milliseconds: 800),
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   padding: const EdgeInsets.symmetric(horizontal: 6),
//                   child: Row(
//                     children: [
//                       _personCard(
//                         imagePath: 'assets/jpg/rahul_sir.jpeg',
//                         name: 'Rahul Sir',
//                         thankYou:
//                             '''Rahul Sir is not just a teacher — he’s that one person who makes learning fun, relaxed, and full of positivity. He always greets everyone with a smile and creates such a friendly atmosphere that no student ever hesitates to ask questions. His kindness and humor make learning moments unforgettable.''',
//                         delay: 100,
//                       ),
//                       _personCard(
//                         imagePath: 'assets/jpg/prajwal_sir.jpeg',
//                         name: 'Prajwal Sir',
//                         thankYou:
//                             '''Prajwal Sir is the kind of mentor who makes complex topics look simple. His energy and clear explanations keep the class lively and focused. He always pushes us to do better while being supportive and understanding at every step. His constant encouragement reminds us that learning is not just about marks.''',
//                         delay: 200,
//                       ),
//                       _personCard(
//                         imagePath: 'assets/jpg/akshay_sir.jpeg',
//                         name: 'Akshay Sir',
//                         thankYou:
//                             '''Akshay Sir has been the most patient and understanding guide during our practical sessions. He always made sure that every student truly understood the concepts clearly before moving on. His calm and friendly way of teaching was hands-on and easy to follow, making even complex tasks feel simple, enjoyable, and fun.''',
//                         delay: 300,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 40),
//               const Divider(color: Colors.white54),

//               // 🔹 Dhanashree Tai Section (image + text in row)
//               FadeInUp(
//                 delay: const Duration(milliseconds: 600),
//                 duration: const Duration(milliseconds: 800),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 12.0,
//                     vertical: 12,
//                   ),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(12),
//                         child: Image.asset(
//                           'assets/jpg/dhanashree_tai.jpeg',
//                           width: 110,
//                           height: 110,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       const SizedBox(width: 16),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: const [
//                             Text(
//                               "Dhanashree Deshmukh",
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             SizedBox(height: 8),
//                             Text(
//                               "Dhanashree Tai has been an inspiring mentor throughout our Java batch. "
//                               "Her deep knowledge of programming and her clear, structured way of teaching "
//                               "made even complex topics easy to grasp. She always encouraged us to think logically "
//                               "and write clean, efficient code.\n\n"
//                               "Thank you Tai 💜",
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 color: Colors.white70,
//                                 height: 1.5,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),

//               const Divider(color: Colors.white54),
//               const SizedBox(height: 15),

//               FadeInUp(
//                 delay: const Duration(milliseconds: 700),
//                 child: const Center(
//                   child: Text(
//                     '✨ Thank you so much ✨',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//               FadeInUp(
//                 delay: const Duration(milliseconds: 900),
//                 child: const Center(
//                   child: Text(
//                     'You all made this journey special ❤️',
//                     style: TextStyle(
//                       color: Colors.white70,
//                       fontSize: 14,
//                       fontStyle: FontStyle.italic,
//                     ),
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 30),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
