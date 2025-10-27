// import 'package:flutter/material.dart';

// class AppDrawer extends StatelessWidget {
//   const AppDrawer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topRight: Radius.circular(25),
//           bottomRight: Radius.circular(25),
//         ),
//       ),
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           // Drawer Header
//           UserAccountsDrawerHeader(
//             decoration: const BoxDecoration(
//               color: Colors.deepPurple,
//             ),
//             accountName: const Text("Sanika Pol"),
//             accountEmail: const Text("sanika@example.com"),
//             currentAccountPicture: const CircleAvatar(
//               backgroundImage: AssetImage('assets/profile.jpg'),
//             ),
//           ),

//           // Drawer Items
//           ListTile(
//             leading: const Icon(Icons.home),
//             title: const Text('Home'),
//             onTap: () {
//               Navigator.pushNamed(context, '/home');
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.person),
//             title: const Text('Profile'),
//             onTap: () {
//               Navigator.pushNamed(context, '/profile');
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.favorite),
//             title: const Text('Saved'),
//             onTap: () {
//               Navigator.pushNamed(context, '/saved');
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.settings),
//             title: const Text('Settings'),
//             onTap: () {
//               Navigator.pushNamed(context, '/settings');
//             },
//           ),
//           const Divider(),
//           ListTile(
//             leading: const Icon(Icons.logout, color: Colors.red),
//             title: const Text(
//               'Logout',
//               style: TextStyle(color: Colors.red),
//             ),
//             onTap: () {
//               // Add logout logic here
//               Navigator.pop(context);
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';

// class AppDrawer extends StatelessWidget {
//   const AppDrawer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topRight: Radius.circular(25),
//           bottomRight: Radius.circular(25),
//         ),
//       ),
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           // Drawer Header
//           UserAccountsDrawerHeader(
//             decoration: const BoxDecoration(
//               color: Colors.deepPurple,
//             ),
//             accountName: const Text("Sanika Pol"),
//             accountEmail: const Text("sanika@example.com"),
//             currentAccountPicture: const CircleAvatar(
//               backgroundImage: AssetImage('assets/profile.jpg'),
//             ),
//           ),

//           // Drawer Items
//           ListTile(
//             leading: const Icon(Icons.home),
//             title: const Text('Home'),
//             onTap: () {
//               Navigator.pushNamed(context, '/home');
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.person),
//             title: const Text('Profile'),
//             onTap: () {
//               Navigator.pushNamed(context, '/profile');
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.favorite),
//             title: const Text('Saved'),
//             onTap: () {
//               Navigator.pushNamed(context, '/saved');
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.settings),
//             title: const Text('Settings'),
//             onTap: () {
//               Navigator.pushNamed(context, '/settings');
//             },
//           ),
//           const Divider(),
//           ListTile(
//             leading: const Icon(Icons.logout, color: Colors.red),
//             title: const Text(
//               'Logout',
//               style: TextStyle(color: Colors.red),
//             ),
//             onTap: () {
//               // Add logout logic here
//               Navigator.pop(context);
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_project/view/favorite_page.dart';
import 'package:flutter_project/view/help_center.dart';
import 'package:flutter_project/view/home_page.dart';
import 'package:flutter_project/view/login_page.dart';
import 'package:flutter_project/view/order_history.dart';
import 'package:flutter_project/view/privacy_policy_page.dart';
import 'package:flutter_project/view/profilepage.dart';
import 'package:flutter_project/view/setting_page.dart';
import 'package:flutter_project/view/transaction_page.dart';
import 'package:share_plus/share_plus.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  // final bool showImageHeader; // Flag to decide header type

  // const AppDrawer({super.key, this.showImageHeader = false});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Container(
        // decoration: const BoxDecoration(
        //   gradient: LinearGradient(
        //     // colors: [
        //     //   Color.fromARGB(255, 216, 220, 243),
        //     //   Color.fromARGB(255, 225, 227, 244),
        //     // ],
        //     colors: [Color(0xFFE3F2FD), Color(0xFFB3E5FC), Color(0xFF81D4FA)],
        //     begin: Alignment.topLeft,
        //     end: Alignment.bottomRight,
        //   ),
        // ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Drawer Header
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 171, 214, 209), // teal shade 1
                    Color.fromARGB(255, 79, 86, 215), // teal shade 2
                  ],
                  // colors: [
                  //   Color(0xFF26A69A), // teal shade 1
                  //   Color(0xFF00897B), // teal shade 2
                  // ],
                  // colors: [Color(0xFFE3F2FD), Color(0xFFB3E5FC), Color(0xFF81D4FA)],

                  //  colors: [Color(0xFF5C6BC0), Color(0xFF3949AB)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              accountName: const Text(
                "Sanika Pol",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              accountEmail: const Text("sanika@1204.com"),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://th.bing.com/th/id/OIP.YekhTrJ7KTg6ETn43henTwHaEo?w=266&h=180&c=7&r=0&o=7&cb=12&dpr=1.3&pid=1.7&rm=3",
                ),
              ),
            ),

            // Drawer Items
            _buildDrawerItem(
              icon: Icons.home,
              iconColor: Colors.orange,
              text: 'Home',
              onTap: () {
                Navigator.pop(context); // Close the drawer first
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            _buildDrawerItem(
              icon: Icons.person,
              iconColor: Colors.purple,
              text: 'Profile',
              onTap: () {
                Navigator.pop(context); // Close the drawer first
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profilepage()),
                );
              },
            ),
            _buildDrawerItem(
              icon: Icons.favorite,
              iconColor: Colors.red,
              text: 'favorite',
              onTap: () {
                Navigator.pop(context); // Close the drawer first
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FavoritePage()),
                );
              },
            ),
            // _buildDrawerItem(
            //   icon: Icons.bookmark,
            //   text: 'Projects',
            //   onTap: () {
            //     Navigator.pop(context); // Close the drawer first
            //     //    Navigator.push(
            //     //     context,
            //     //     MaterialPageRoute(builder: (context) => ProjectPage()),
            //     //  );
            //   },
            // ),

            _buildDrawerItem(
              icon: Icons.history,
              iconColor: Colors.blue,
              text: 'History',
              onTap: () {
                Navigator.pop(context); // Close the drawer first
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderHistoryPage()),
                );
              },
            ),

            _buildDrawerItem(
              icon: Icons.wallet,
              iconColor: Colors.brown,
              text: 'Transactions',
              onTap: () {
                Navigator.pop(context); // Close the drawer first
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TransactionPage()),
                );
              },
            ),

            _buildDrawerItem(
              icon: Icons.settings,
              iconColor: Colors.amber,
              text: 'Settings',
              onTap: () {
                Navigator.pop(context); // Close the drawer first
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
              },
            ),

            _buildDrawerItem(
              icon: Icons.headphones,
              iconColor: Colors.green,
              text: 'Help center',
              onTap: () {
                Navigator.pop(context); // Close the drawer first
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HelpCenterPage(),
                  ),
                );
              },
            ),

            _buildDrawerItem(
              icon: Icons.share,
              text: 'Share App',
              onTap: () {
                Navigator.pop(context); // close the drawer
                _showShareBottomSheet(context); // show bottom sheet directly
              },
            ),

            _buildDrawerItem(
              icon: Icons.book,
              iconColor: Colors.blue,
              text: 'Privacy Policy',
              onTap: () {
                Navigator.pop(context); // Close the drawer first
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PrivacyPolicyPage()),
                );
              },
            ),

            Divider(thickness: 1.2, indent: 20, endIndent: 20),

            _buildDrawerItem(
              icon: Icons.logout,
              text: 'Logout',
              color: Colors.red.shade700,
              iconColor: Colors.red,
              onTap: () {
                Navigator.pop(context); // Close drawer first
                _showLogoutConfirmation(context); // Show confirmation popup
              },
            ),

            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                "Version 1.0.0",
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  // Custom reusable drawer item builder
  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
    Color? color,
    Color? iconColor,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor ?? Colors.black87),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: color ?? Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      hoverColor: Colors.teal.withOpacity(0.1),
    );
  }
}

_showShareBottomSheet(BuildContext context) {
  const String appLink = "https://example.com/yourapp"; // Your app link

  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
    ),
    builder: (BuildContext bc) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Wrap(
          children: [
            const Center(
              child: Text(
                "Share via",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildShareButton(
                  icon: Icons.app_blocking,
                  color: Colors.green,
                  label: "WhatsApp",
                  onTap: () {
                    Share.share(
                      "Check out this app: $appLink",
                      subject: "Check this app on WhatsApp",
                    );
                  },
                ),
                _buildShareButton(
                  icon: Icons.telegram,
                  color: Colors.blue,
                  label: "Telegram",
                  onTap: () {
                    Share.share(
                      "Check out this app: $appLink",
                      subject: "Check this app on Telegram",
                    );
                  },
                ),
                _buildShareButton(
                  icon: Icons.email,
                  color: Colors.orange,
                  label: "Email",
                  onTap: () {
                    Share.share(
                      "Check out this app: $appLink",
                      subject: "Check out this app via Email",
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Share.share(
                    "Hey! Check out this amazing app: $appLink",
                    subject: "Check out this app",
                  );
                },
                icon: const Icon(Icons.share),
                label: const Text("More Apps", selectionColor: Colors.white),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 57, 48, 55),
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 25,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

// Reusable share button
Widget _buildShareButton({
  required IconData icon,
  required Color color,
  required String label,
  required VoidCallback onTap,
}) {
  return Column(
    children: [
      InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(50),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 30, color: color),
        ),
      ),
      const SizedBox(height: 8),
      Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
    ],
  );
}

void _showLogoutConfirmation(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text(
          "Confirm Logout",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: const Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text("Cancel", style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 124, 121, 121),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),

            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },

            // or push to your login page manually if you don’t use named routes
            child: const Text("Logout", style: TextStyle(color: Colors.white)),
          ),
        ],
      );
    },
  );
}
