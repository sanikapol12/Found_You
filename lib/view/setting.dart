// import 'package:flutter/material.dart';
// import 'package:flutter_project/view/email_notification.dart';
// import 'package:flutter_project/view/fotgot_password.dart';
// import 'package:flutter_project/view/help_center.dart';
// import 'package:flutter_project/view/language.dart';
// import 'package:flutter_project/view/notification.dart';
// import 'package:flutter_project/view/security_page.dart';
// import 'package:flutter_project/view/your_activity_page.dart';

// class SettingsPage extends StatelessWidget {
//   const SettingsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0.5,
//         title: const Text(
//           "Settings",
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//         ),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: ListView(
//         children: [
//           const SizedBox(height: 10),

//           // -------- Account Section --------
//           _buildSectionTitle("Account"),
//           _buildSettingItem(
//             icon: Icons.lock_outline,
//             title: "Change Password",
//             subtitle: "",
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (_) => const ForgotPasswordPage(titleMessage: ''),
//                 ),
//               );
//             },
//           ),
//           _buildSettingItem(
//             icon: Icons.history_toggle_off,
//             title: "Your Activity",
//             subtitle: "View and manage your time on Instagram",
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => const YourActivityPage()),
//               );
//             },
//           ),
//           _buildSettingItem(
//             icon: Icons.security,
//             title: "Security",
//             subtitle: "Password, login activity, and 2FA",
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => const SecurityPage()),
//               );
//             },
//           ),
//           _buildSettingItem(
//             icon: Icons.language,
//             title: "Language",
//             subtitle: "Change app language",
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => const LanguagePage()),
//               );
//             },
//           ),

//           const Divider(height: 20),

//           // -------- Notifications --------
//           _buildSectionTitle("Notifications"),
//           _buildSettingItem(
//             icon: Icons.notifications_active_outlined,
//             title: "Push Notifications",
//             subtitle: "Manage notification settings",
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => Notificationpage()),
//               );
//             },
//           ),
//           _buildSettingItem(
//             icon: Icons.mail_outline,
//             title: "Email Notifications",
//             subtitle: "Control emails from Instagram",
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (_) => const EmailNotificationPage(),
//                 ),
//               );
//             },
//           ),

//           const Divider(height: 20),

//           // -------- Help --------
//           _buildSectionTitle("Help"),
//           _buildSettingItem(
//             icon: Icons.help_outline,
//             title: "Help Center",
//             subtitle: "FAQs and customer support",
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => const HelpCenterPage()),
//               );
//             },
//           ),
//           _buildSettingItem(
//             icon: Icons.info_outline,
//             title: "About",
//             subtitle: "Terms, policies, and app info",
//             onTap: () {
//               // Navigator.push(context,
//               //     MaterialPageRoute(builder: (_) => const AboutPage()));
//             },
//           ),

//           const Divider(height: 20),

//           // -------- Account Actions --------
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: ElevatedButton(
//               onPressed: () {
//                 _showLogoutDialog(context);
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.redAccent,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 minimumSize: const Size(double.infinity, 45),
//               ),
//               child: const Text("Log Out", style: TextStyle(fontSize: 16)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Section Title Widget
//   Widget _buildSectionTitle(String title) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
//       child: Text(
//         title.toUpperCase(),
//         style: const TextStyle(
//           fontWeight: FontWeight.bold,
//           fontSize: 13,
//           color: Colors.grey,
//         ),
//       ),
//     );
//   }

//   // Single Setting Item
//   Widget _buildSettingItem({
//     required IconData icon,
//     required String title,
//     String? subtitle,
//     VoidCallback? onTap,
//   }) {
//     return ListTile(
//       leading: Icon(icon, color: Colors.black),
//       title: Text(
//         title,
//         style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
//       ),
//       subtitle: subtitle != null ? Text(subtitle) : null,
//       trailing: const Icon(Icons.arrow_forward_ios, size: 16),
//       onTap: onTap,
//     );
//   }

//   // Logout Confirmation
//   void _showLogoutDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//           title: const Text(
//             "Log Out?",
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//           content: const Text("Are you sure you want to log out?"),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text("Cancel"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pop(context);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text("Logged out successfully")),
//                 );
//               },
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
//               child: const Text("Logout"),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
