import 'package:flutter/material.dart';
import 'package:flutter_project/controller/profile_controller.dart'; // ✅ Correct controller import
import 'package:flutter_project/view/drawer.dart';
import 'package:flutter_project/view/edit_profile.dart';
import 'package:flutter_project/view/project_bottomsheet.dart';
import 'package:share_plus/share_plus.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ Use controller from MVC (controller/profile_controller.dart)
    final ProfileController controller = ProfileController();

    final List<String> posts = List.generate(
      12,
      (index) => "https://picsum.photos/300/300?random=$index",
    );

    return Scaffold(
      endDrawer: const AppDrawer(),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: const Text(
          "sanika_pol",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              AddProjectBottomSheet.show(context);
            },
            icon: const Icon(Icons.add_box_outlined, color: Colors.black),
          ),
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // -------- Profile Header --------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 45,
                    backgroundImage: NetworkImage(
                      "https://th.bing.com/th/id/OIP.YekhTrJ7KTg6ETn43henTwHaEo?w=266&h=180",
                    ),
                  ),
                  const SizedBox(width: 25),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Sanika Construction",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Real Estate",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // -------- Bio / Website --------
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "www.sanikapol.com",
                  style: TextStyle(color: Colors.blue, fontSize: 14),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // -------- Buttons --------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  // -------- EDIT PROFILE BUTTON --------
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () async {
                        final updatedProfile = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                EditProfilePage(controller: controller),
                          ),
                        );

                        if (updatedProfile != null) {
                          controller.updateProfile(updatedProfile);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Profile updated successfully!"),
                            ),
                          );
                        }
                      },
                      child: const Text("Edit Profile"),
                    ),
                  ),

                  const SizedBox(width: 8),

                  // -------- SHARE PROFILE BUTTON --------
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        _showShareBottomSheet(context);
                      },
                      child: const Text("Share Profile"),
                    ),
                  ),

                  const SizedBox(width: 8),

                  // -------- ADD PERSON BUTTON --------
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.all(8),
                      minimumSize: const Size(40, 40),
                    ),
                    child: const Icon(Icons.person_add, size: 20),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),
            const Divider(),

            // -------- Posts Grid --------
            GridView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: posts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              itemBuilder: (context, index) {
                return Image.network(posts[index], fit: BoxFit.cover);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// -------- Share Bottom Sheet --------
_showShareBottomSheet(BuildContext context) {
  const String appLink = "https://example.com/yourapp";

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
                  icon: FontAwesomeIcons.whatsapp,
                  color: Colors.green,
                  label: "WhatsApp",
                  onTap: () {
                    Share.share("Check out this app: $appLink");
                  },
                ),
                _buildShareButton(
                  icon: FontAwesomeIcons.telegram,
                  color: Colors.blue,
                  label: "Telegram",
                  onTap: () {
                    Share.share("Check out this app: $appLink");
                  },
                ),
                _buildShareButton(
                  icon: Icons.email,
                  color: Colors.orange,
                  label: "Email",
                  onTap: () {
                    Share.share("Check out this app: $appLink");
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Share.share("Hey! Check out this amazing app: $appLink");
                },
                icon: const Icon(Icons.share),
                label: const Text("More Apps"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
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

// -------- Reusable Share Button --------
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
