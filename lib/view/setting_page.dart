// import 'package:flutter/material.dart';
// import 'package:flutter_project/controller/profile_controller.dart';
// import 'package:flutter_project/view/edit_profile.dart';
// import 'package:flutter_project/view/login_page.dart';
// import 'package:shared_preferences/shared_preferences.dart';


// // You would typically define your main function and run MyApp
// // void main() {
// //   runApp(const MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return const MaterialApp(
// //       title: 'Settings Demo',
// //       home: SettingsScreen(),
// //     );
// //   }
// // }

// class SettingsScreen extends StatelessWidget {
//   SettingsScreen({super.key});

//    final ProfileController controller = ProfileController();

//   @override
//   Widget build(BuildContext context) {
//     // A simplified representation of the app's primary color (often red/pink for the active elements)
//     const Color primaryColor = Color(0xFFE53935); // A nice red

//     return Scaffold(
//       // The app bar with the title "Settings"
//       appBar: AppBar(
//         title: const Text('Settings'),
//         centerTitle: false, // iOS style title alignment
//         // The back button is typically added automatically in a navigation context,
//         // but for a standalone screen, you might add a leading icon.
//         // leading: const BackButton(),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             // --- Account Settings Section ---
//             const Padding(
//               padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
//               child: Text(
//                 'Account Settings',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.grey,
//                 ),
//               ),
//             ),
//             _SettingsTile(
//               icon: Icons.edit,
//               color: Colors.redAccent,
//               title: 'Edit Profile',
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => EditProfilePage(controller: controller,)),
//                 );
//               },
//             ),
//             _SettingsTile(
//               icon: Icons.lock_outline,
//               color: Colors.green,
//               title: 'Change Password',
//               onTap: () {
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(builder: (context) => ProfilePage()),
//                 // );
//               },
//             ),
//             _SettingsTile(
//               icon: Icons.email_outlined,
//               color: Colors.blue,
//               title: 'Email Preferences',
//               onTap: () {},
//             ),

//             // --- Separator ---
//             const Divider(height: 1),

//             // --- App Preferences Section ---
//             const Padding(
//               padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
//               child: Text(
//                 'App Preferences',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.grey,
//                 ),
//               ),
//             ),
//             _SettingsSwitchTile(
//               icon: Icons.notifications_none,
//               color: Colors.blueAccent,
//               title: 'Notifications',
//               value: true, // Set to true as shown in the image
//               onChanged: (bool value) {},
//             ),
//             _SettingsSwitchTile(
//               icon: Icons.sync,
//               color: Colors.orange,
//               title: 'Sync Data',
//               value: false, // Set to false as shown in the image
//               onChanged: (bool value) {},
//             ),

//             // --- Separator ---
//             const Divider(height: 1),

//             // --- More Section ---
//             const Padding(
//               padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
//               child: Text(
//                 'More',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.grey,
//                 ),
//               ),
//             ),
//             _SettingsTile(
//               icon: Icons.security,
//               color: Colors.purple,
//               title: 'Privacy Policy',
//               onTap: () {
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(builder: (context) => PrivacyPolicyPage()),
//                 // );
//               },
//             ),
//             _SettingsTile(
//               icon: Icons.description_outlined,
//               color: Colors.lightBlue,
//               title: 'Terms of Service',
//               onTap: () {
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(builder: (context) => TermsOfServicePage()),
//                 // );
//               },
//             ),

//             // --- Log Out Button ---
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 16.0,
//                 vertical: 20.0,
//               ),
//               child: SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     // Handle log out action

//                     logout(context);
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: primaryColor, // Use the red color
//                     padding: const EdgeInsets.symmetric(vertical: 15.0),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                   ),
//                   child: const Text(
//                     'Log Out',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       // --- Bottom Navigation Bar (Simplified) ---
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: 3, // Assuming 'More' or 'Profile' is the active tab
//         selectedItemColor: primaryColor,
//         unselectedItemColor: Colors.grey,
//         showUnselectedLabels: true,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home_outlined),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.category_outlined),
//             label: 'Categories',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person_outline),
//             label: 'Profile',
//           ),
//           BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
//         ],
//       ),
//     );
//   }

//   void logout(BuildContext context) async {
//     SharedPreferences sharedPreferencesObj =
//         await SharedPreferences.getInstance();
//     sharedPreferencesObj.clear();
//     Navigator.of(context).pushAndRemoveUntil(
//       MaterialPageRoute(
//         builder: (context) {
//           return Login();
//         },
//       ),
//       (route) => false,
//     );
//   }
// }

// /// A custom widget for a standard settings tile with a leading icon.
// class _SettingsTile extends StatelessWidget {
//   final IconData icon;
//   final Color color;
//   final String title;
//   final VoidCallback onTap;

//   const _SettingsTile({
//     required this.icon,
//     required this.color,
//     required this.title,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: Container(
//         padding: const EdgeInsets.all(8),
//         decoration: BoxDecoration(
//           color: color.withOpacity(0.1), // Light background for the icon
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Icon(icon, color: color),
//       ),
//       title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
//       trailing: const Icon(
//         Icons.arrow_forward_ios,
//         size: 16,
//         color: Colors.grey,
//       ),
//       onTap: onTap,
//     );
//   }
// }

// /// A custom widget for a settings tile with a trailing Switch.
// class _SettingsSwitchTile extends StatelessWidget {
//   final IconData icon;
//   final Color color;
//   final String title;
//   final bool value;
//   final ValueChanged<bool> onChanged;

//   const _SettingsSwitchTile({
//     required this.icon,
//     required this.color,
//     required this.title,
//     required this.value,
//     required this.onChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     // Using a CupertinoSwitch to better match the iOS style in the image
//     return ListTile(
//       leading: Container(
//         padding: const EdgeInsets.all(8),
//         decoration: BoxDecoration(
//           color: color.withOpacity(0.1),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Icon(icon, color: color),
//       ),
//       title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
//       trailing: Switch.adaptive(
//         // adaptive switch chooses platform-specific style
//         value: value,
//         onChanged: onChanged,
//         activeColor: const Color(0xFFE53935), // Primary red for active state
//       ),
//       onTap: () =>
//           onChanged(!value), // Tapping the tile also toggles the switch
//     );
//   }
// }