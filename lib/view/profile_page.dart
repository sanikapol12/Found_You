
// import 'package:flutter/material.dart';
// import 'package:flutter_project/view/app_preference.dart';
// import 'package:flutter_project/view/edit_profile_page.dart';
// import 'package:flutter_project/view/favorite_page.dart';
// import 'package:flutter_project/view/fotgot_password.dart';
// import 'package:flutter_project/view/home_page.dart';
// import 'package:flutter_project/view/order_history.dart';
// import 'package:flutter_project/view/register_business.dart';
// import 'package:flutter_project/widget/botton_nav_widget.dart';

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});
//   @override
//   State createState() => _ProfilepageState();
// }

// class _ProfilepageState extends State {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //  backgroundColor: Colors.white,
//       // appBar: AppBar(
//       //   backgroundColor: Colors.blue[800],
//       //   leading: IconButton(
//       //     icon: const Icon(Icons.arrow_back, color: Colors.white),
//       //     onPressed: () {
//       //       Navigator.pop(context); // Go back to previous page
//       //     },
//       //   ),
//       // ),
//       body: Container(
//         color: const Color.fromARGB(255, 219, 217, 217),

//         child: SafeArea(
//           child: Column(
//             children: [
//               // Profile header
//               Container(
//                 padding: const EdgeInsets.symmetric(vertical: 20),

//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [Colors.pink, Colors.purple],
//                   ),
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(30),
//                     bottomRight: Radius.circular(30),
//                   ),
//                 ),
//                 width: double.infinity,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,

//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Positioned(
//                             left: 16,
//                             top: 16,
//                             child: GestureDetector(
//                               onTap: () {
//                                 Navigator.pop(
//                                   context,
//                                 ); // Back to previous screen
//                               },
//                               child: Container(
//                                 padding: const EdgeInsets.all(8),
//                                 decoration: BoxDecoration(
//                                   //color: Colors.white.withOpacity(0.3),
//                                   shape: BoxShape.circle,
//                                 ),
//                                 child: IconButton(
//                                   // Icons.arrow_back,
//                                   icon: const Icon(Icons.arrow_back),
//                                   color: Colors.white,
//                                   onPressed: () {
//                                     Navigator.pop(
//                                       context,
//                                     ); // Close the drawer first
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => HomePage(),
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Stack(
//                       children: [
//                         CircleAvatar(
//                           radius: 50,
//                           backgroundImage: NetworkImage(
//                             'https://th.bing.com/th/id/OIP.YekhTrJ7KTg6ETn43henTwHaEo?w=266&h=180&c=7&r=0&o=7&cb=12&dpr=1.3&pid=1.7&rm=3',
//                           ),
//                         ),
//                         Positioned(
//                           right: 0,
//                           bottom: 0,
//                           child: Container(
//                             padding: EdgeInsets.all(6),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               shape: BoxShape.circle,
//                             ),
//                             child: IconButton(
//                               iconSize: 20,
//                               icon: const Icon(Icons.edit),
//                               color: Colors.blue,
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => Editpage(),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 10),
//                     const Text(
//                       "Priya Sharma",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 5),
//                     const Text(
//                       "Premium User | Joined May 2023",
//                       style: TextStyle(color: Colors.white70, fontSize: 14),
//                     ),
//                     const SizedBox(height: 20),
//                     // Action buttons
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             //   _buildActionButton(Icons.shopping_cart, "Orders"),
//                             //   _buildActionButton(Icons.folder, "Favorites"),
//                             //   _buildActionButton(
//                             //     Icons.local_fire_department,
//                             //     "Activity",
//                             //   ),
//                             ElevatedButton(
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => OrderHistoryPage(),
//                                   ),
//                                 );
//                               },
//                               style: ElevatedButton.styleFrom(
//                                 padding:
//                                     EdgeInsets.zero, // remove default padding
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),

//                                 elevation: 6,
//                                 shadowColor: Colors.black.withOpacity(0.3),
//                                 backgroundColor: Colors
//                                     .white, // 👈 required for gradient to show
//                               ),

//                               child: Ink(
//                                 decoration: BoxDecoration(
//                                   // gradient: const LinearGradient(
//                                   //   colors: [
//                                   //     Color(0xFF7F00FF),
//                                   //     Color(0xFFE100FF),
//                                   //   ],
//                                   //   begin: Alignment.topLeft,
//                                   //   end: Alignment.bottomRight,
//                                   // ),
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                                 child: Container(
//                                   alignment: Alignment.center,
//                                   height: 100,
//                                   width: 130,
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: const [
//                                       // space between text & icon
//                                       Icon(
//                                         Icons.shopping_cart,
//                                         color: Colors.blue,
//                                         size: 25,
//                                       ),
//                                       SizedBox(height: 8),
//                                       Text(
//                                         'Orders',
//                                         style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(width: 10),
//                             // ),
//                             ElevatedButton(
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => FavoritePage(),
//                                   ),
//                                 );
//                               },
//                               style: ElevatedButton.styleFrom(
//                                 padding:
//                                     EdgeInsets.zero, // remove default padding
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),

//                                 elevation: 6,
//                                 shadowColor: Colors.black.withOpacity(0.3),
//                                 backgroundColor: Colors
//                                     .white, // 👈 required for gradient to show
//                               ),

//                               child: Ink(
//                                 decoration: BoxDecoration(
//                                   // gradient: const LinearGradient(
//                                   //   colors: [
//                                   //     Color(0xFF7F00FF),
//                                   //     Color(0xFFE100FF),
//                                   //   ],
//                                   //   begin: Alignment.topLeft,
//                                   //   end: Alignment.bottomRight,
//                                   // ),
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                                 child: Container(
//                                   alignment: Alignment.center,
//                                   height: 100,
//                                   width: 130,
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: const [
//                                       // space between text & icon
//                                       Icon(
//                                         Icons.favorite,
//                                         color: Colors.red,
//                                         size: 25,
//                                       ),
//                                       SizedBox(height: 8),
//                                       Text(
//                                         'Favorite',
//                                         style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             // ),
//                             SizedBox(width: 10),

//                             ElevatedButton(
//                               onPressed: () {},
//                               style: ElevatedButton.styleFrom(
//                                 padding:
//                                     EdgeInsets.zero, // remove default padding
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),

//                                 elevation: 6,
//                                 shadowColor: Colors.black.withOpacity(0.3),
//                                 backgroundColor: Colors
//                                     .white, // 👈 required for gradient to show
//                               ),

//                               child: Ink(
//                                 decoration: BoxDecoration(
//                                   // gradient: const LinearGradient(
//                                   //   colors: [
//                                   //     Color(0xFF7F00FF),
//                                   //     Color(0xFFE100FF),
//                                   //   ],
//                                   //   begin: Alignment.topLeft,
//                                   //   end: Alignment.bottomRight,
//                                   // ),
//                                   borderRadius: BorderRadius.circular(13),
//                                 ),
//                                 child: Container(
//                                   alignment: Alignment.center,
//                                   height: 100,
//                                   width: 130,
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: const [
//                                       // space between text & icon
//                                       Icon(
//                                         Icons.local_activity,
//                                         color: Colors.green,
//                                         size: 25,
//                                       ),
//                                       SizedBox(height: 8),
//                                       Text(
//                                         'Activity',
//                                         style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const SizedBox(height: 10),
//                         const Text(
//                           "Account Setting",
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         _buildSettingTile(
//                           icon: Icons.person,
//                           iconColor: Colors.blueAccent,
//                           title: "Personal Information",
//                           backgroundColor: Colors.white,
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => BusinessForm(),
//                               ),
//                             );
//                           },
//                         ),
//                         _buildSettingTile(
//                           icon: Icons.lock,
//                           title: "Change Password",
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => ForgotPasswordPage(
//                                   titleMessage: "Change Password",
//                                 ),
//                               ),
//                             );
//                           },
//                           backgroundColor: Colors.white,
//                           iconColor: Colors.blueAccent,
//                         ),
//                         _buildSettingTile(
//                           icon: Icons.settings,
//                           iconColor: Colors.blueAccent,
//                           title: "App Preferences",
//                           backgroundColor: Colors.white,
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => const AppPreferencePage(),
//                               ),
//                             );
//                           },
//                         ),
//                         const SizedBox(height: 30), // add some bottom spacing
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: const BottomNavWidget(currentIndex: 0),
//     );
//   }

//   Widget _buildSettingTile({
//     required IconData icon,
//     required String title,
//     required VoidCallback onTap,
//     Color? backgroundColor, // solid color
//     List<Color>? gradientColors,
//     required MaterialAccentColor iconColor, // optional gradient
//   }) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 6),
//       decoration: BoxDecoration(
//         color: backgroundColor, // solid color
//         gradient: gradientColors != null
//             ? LinearGradient(
//                 colors: gradientColors,
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               )
//             : null, // gradient overrides solid color
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 5,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: ListTile(
//         leading: Icon(icon, color: Colors.black),
//         title: Text(
//           title,
//           style: const TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         trailing: const Icon(
//           Icons.arrow_forward_ios,
//           size: 16,
//           color: Colors.black,
//         ),
//         onTap: onTap,
//       ),
//     );
//   }
// }
