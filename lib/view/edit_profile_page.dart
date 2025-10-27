// // import 'package:flutter/material.dart';

// // class ProfilePage extends StatelessWidget {
// //   const ProfilePage({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Profile'),
// //         elevation: 0,
// //         flexibleSpace: Container(
// //           decoration: const BoxDecoration(
// //             gradient: LinearGradient(
// //               colors: [Color(0xFFE3F2FD), Color(0xFFB3E5FC), Color(0xFF81D4FA)],
// //               begin: Alignment.topLeft,
// //               end: Alignment.bottomRight,
// //             ),
// //           ),
// //         ),
// //         //  backgroundColor: Colors.white,
// //       ),
// //       body: Container(
// //         decoration: const BoxDecoration(
// //           gradient: LinearGradient(
// //             colors: [Color(0xFFE3F2FD), Color(0xFFB3E5FC), Color(0xFF81D4FA)],
// //             begin: Alignment.topLeft,
// //             end: Alignment.bottomRight,
// //           ),
// //         ),
// //         child: ListView(
// //           padding: const EdgeInsets.all(16),
// //           children: [
// //             // Profile Header Card
// //             Card(
// //               shape: RoundedRectangleBorder(
// //                 borderRadius: BorderRadius.circular(20),
// //               ),
// //               elevation: 5,
// //               child: Padding(
// //                 padding: const EdgeInsets.all(16.0),
// //                 child: Column(
// //                   children: [
// //                     const CircleAvatar(
// //                       radius: 50,
// //                       backgroundImage: NetworkImage(
// //                         "https://th.bing.com/th/id/OIP.YekhTrJ7KTg6ETn43henTwHaEo?w=266&h=180&c=7&r=0&o=7&cb=12&dpr=1.3&pid=1.7&rm=3",
// //                       ),
// //                     ),
// //                     const SizedBox(height: 10),
// //                     const Text(
// //                       'Sanika Pol',
// //                       style: TextStyle(
// //                         fontSize: 22,
// //                         fontWeight: FontWeight.bold,
// //                       ),
// //                     ),
// //                     const SizedBox(height: 5),
// //                     const Text(
// //                       'sanika@1204.com',
// //                       style: TextStyle(fontSize: 16, color: Colors.black54),
// //                     ),
// //                     const SizedBox(height: 10),
// //                     ElevatedButton.icon(
// //                       onPressed: () {
// //                         // Navigator.push(
// //                         //   context,
// //                         //   MaterialPageRoute(
// //                         //     builder: (context) => const EditProfilePage(),
// //                         //   ),
// //                         // );
// //                       },
// //                       icon: const Icon(Icons.edit),
// //                       label: const Text('Edit Profile'),
// //                       style: ElevatedButton.styleFrom(
// //                         backgroundColor: Colors.white,
// //                         shape: RoundedRectangleBorder(
// //                           borderRadius: BorderRadius.circular(12),
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),

// //             const SizedBox(height: 20),

// //             // Profile Details Card
// //             Card(
// //               shape: RoundedRectangleBorder(
// //                 borderRadius: BorderRadius.circular(15),
// //               ),
// //               elevation: 3,
// //               child: Column(
// //                 children: const [
// //                   ListTile(
// //                     leading: Icon(Icons.phone),
// //                     title: Text('Phone Number'),
// //                     subtitle: Text('+91 9876543210'),
// //                   ),
// //                   Divider(height: 1),
// //                   ListTile(
// //                     leading: Icon(Icons.location_on),
// //                     title: Text('Address'),
// //                     subtitle: Text('Pune, Maharashtra, India'),
// //                   ),
// //                   Divider(height: 1),
// //                   ListTile(
// //                     leading: Icon(Icons.cake),
// //                     title: Text('Date of Birth'),
// //                     subtitle: Text('01 January 2000'),
// //                   ),
// //                 ],
// //               ),
// //             ),

// //             const SizedBox(height: 20),

// //             // Account Actions
// //             Card(
// //               shape: RoundedRectangleBorder(
// //                 borderRadius: BorderRadius.circular(15),
// //               ),
// //               elevation: 3,
// //               child: Column(
// //                 children: [
// //                   ListTile(
// //                     leading: const Icon(Icons.lock),
// //                     title: const Text('Change Password'),
// //                     onTap: () {},
// //                   ),
// //                   const Divider(height: 1),
// //                   ListTile(
// //                     leading: const Icon(Icons.logout, color: Colors.red),
// //                     title: const Text(
// //                       'Logout',
// //                       style: TextStyle(color: Colors.red),
// //                     ),
// //                     onTap: () {
// //                       Navigator.pop(context);
// //                     },
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_project/view/home_page.dart';
// import 'package:flutter_project/view/setting_page.dart';

// class Editpage extends StatefulWidget {
//   const Editpage({super.key});
//   @override
//   State createState() => _ProfilepageState();
// }

// class _ProfilepageState extends State {
//   int _selectedIndex = 0;

//   // void _onNavItemTapped(int index) {
//   //   setState(() {
//   //     _selectedIndex = index;
//   //   });
//   // }
// TextEditingController LocationController = TextEditingController();
// TextEditingController NameController = TextEditingController();
// TextEditingController ContactNumberController = TextEditingController();
// TextEditingController emailController = TextEditingController();
// TextEditingController ShopnameController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     void _onItemTapped(int index) {
//       setState(() {
//         _selectedIndex = index;
//       });

//       // 🔹 Navigate to respective page
//       switch (index) {
//         case 0:
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (_) => HomePage()),
//           );
//           break;
//         case 1:
//           // Navigator.push(
//           //   context,
//           //   MaterialPageRoute(builder: (_) => const FavoritePage()),
//           // );
//           break;
//         case 2:
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (_) =>  SettingsScreen()),
//           );
//           break;
//         case 3:
//           // Navigator.push(
//           //   context,
//           //   MaterialPageRoute(builder: (_) =>  ProfilePage()),
//           // );
//           break;
//       }
//     }

//     return Scaffold(
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
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Positioned(
//                           left: 16,
//                           top: 16,
//                           child: GestureDetector(
//                             onTap: () {
//                               Navigator.pop(context); // Back to previous screen
//                             },
//                             // child: Container(
//                             //   padding: const EdgeInsets.all(8),
//                             //   decoration: BoxDecoration(
//                             //     color: Colors.white.withOpacity(0.3),
//                             //     shape: BoxShape.circle,
//                             //   ),
//                             // ),
//                             child: Container(
//                               padding: const EdgeInsets.all(8),
//                               decoration: BoxDecoration(
//                                 color: Colors.white.withOpacity(0.3),
//                                 shape: BoxShape.circle,
//                               ),
//                               child: IconButton(
//                                 // Icons.arrow_back,
//                                 icon: const Icon(Icons.arrow_back),
//                                 color: Colors.white,
//                                 onPressed: () {
//                                   Navigator.pop(
//                                     context,
//                                   ); // Close the drawer first
//                                   // Navigator.push(
//                                   //   context,
//                                   //   MaterialPageRoute(
//                                   //     builder: (context) => Editpage(),
//                                   //   ),
//                                   // );
//                                 },
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Stack(
//                       children: [
//                         CircleAvatar(
//                           radius: 50,
//                           backgroundImage: NetworkImage(
//                             'https://th.bing.com/th/id/OIP.YekhTrJ7KTg6ETn43henTwHaEo?w=266&h=180&c=7&r=0&o=7&cb=12&dpr=1.3&pid=1.7&rm=3',
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
//                       "Update Your Personal Information",
//                       style: TextStyle(color: Colors.white70, fontSize: 14),
//                     ),
//                     const SizedBox(height: 20),
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         padding: EdgeInsets.zero,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         elevation: 4,
//                         backgroundColor: Colors.transparent, // important
//                         shadowColor: Colors.transparent,
//                       ),
//                       onPressed: () {},
//                       child: Ink(
//                         decoration: BoxDecoration(
//                           gradient: const LinearGradient(
//                             colors: [Color(0xFF7F00FF), Color(0xFFE100FF)],
//                             begin: Alignment.topLeft,
//                             end: Alignment.bottomRight,
//                           ),
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         child: Container(
//                           alignment: Alignment.center,
//                           height: 50,
//                           width: 200,
//                           child: const Text(
//                             'Change Photo',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),

//                     // Action buttons
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Padding(
//                 padding: const EdgeInsets.only(top: 1, left: 20),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Account Setting",
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 10),
//               // Account Settings
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Column(
//                   children: [
//                     TextFormField(
//                 controller: NameController,
//                 decoration: const InputDecoration(
//                   labelText: 'Name',
//                   labelStyle: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.grey,
//                   ),
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
                   
//                      TextFormField(
//                 controller: ContactNumberController,
//                 decoration: const InputDecoration(
//                   labelText: 'Contact Number',
//                   labelStyle: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.grey,
//                   ),
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               TextFormField(
//                 controller: emailController,
//                 decoration: const InputDecoration(
//                   labelText: 'Email',
//                   labelStyle: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.grey,
//                   ),
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               TextFormField(
//                 controller: LocationController,
//                 decoration: const InputDecoration(
//                   labelText: 'Location',
//                   labelStyle: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.grey,
//                   ),
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               TextFormField(
//                 controller: ShopnameController,
//                 decoration: const InputDecoration(
//                   labelText: 'Shop Name',
//                   labelStyle: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.grey,
//                   ),
//                   border: OutlineInputBorder(),
//                 ),
//               ),

//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: ClipRRect(
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(30),
//           topRight: Radius.circular(30),
//         ),
//         child: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Colors.pink, Colors.purple],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//           child: BottomNavigationBar(
//             backgroundColor: Colors.transparent,
//             elevation: 0,
//             currentIndex: _selectedIndex,
//             selectedItemColor: Colors.white,
//             unselectedItemColor: Colors.white70,
//             type: BottomNavigationBarType.fixed,
//             onTap: _onItemTapped,
//             items: const [
//               BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.favorite),
//                 label: 'Favorite',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.settings),
//                 label: 'Settings',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.person),
//                 label: 'Profile',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Widget _buildActionButton(IconData icon, String label) {
//   //   return Column(
//   //     children: [
//   //       Container(
//   //         decoration: BoxDecoration(
//   //           color: Colors.white,
//   //           shape: BoxShape.circle,
//   //           boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
//   //         ),
//   //         padding: const EdgeInsets.all(12),
//   //         child: Icon(icon, color: Colors.blue[800], size: 28),
//   //       ),
//   //       const SizedBox(height: 8),
//   //       Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
//   //     ],
//   //   );
//   // }

//   // Widget _buildSettingTile(IconData icon, String title) {
//   //   return Card(
//   //     margin: const EdgeInsets.symmetric(vertical: 8),
//   //     child: ListTile(
//   //       leading: Icon(icon, color: Colors.blue[800]),
//   //       title: Text(title),
//   //       trailing: const Icon(Icons.arrow_forward_ios, size: 18),
//   //       onTap: () {},
//   //     ),
//   //   );
//   // }
// }