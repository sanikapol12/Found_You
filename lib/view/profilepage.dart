import 'package:flutter/material.dart';
import 'package:flutter_project/controller/profile_controller.dart';
import 'package:flutter_project/controller/project_controller.dart';
import 'package:flutter_project/controller/register_business_controller.dart';
import 'package:flutter_project/view/drawer.dart';
import 'package:flutter_project/view/edit_profile.dart';
import 'package:flutter_project/view/home_page.dart';
import 'package:flutter_project/view/post_grid_page.dart';
import 'package:flutter_project/view/project_bottomsheet.dart';
import 'package:flutter_project/view/the_subscription.dart';
import 'package:flutter_project/widget/botton_nav_widget.dart';
import 'package:share_plus/share_plus.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State createState() => _ProfilepageState();
}

class _ProfilepageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _shineController;
  final ProjectController controller = ProjectController();
  String? businessId;
  List<String> posts = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadImages();
    _shineController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  Future<void> loadImages() async {
    posts = await controller.getProjectImages();
    setState(() => loading = false);
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _shineController = AnimationController(
  //     vsync: this,
  //     duration: const Duration(seconds: 3),
  //   )..repeat();
  // }

  @override
  void dispose() {
    _shineController.dispose();
    super.dispose();
  }

  /// ✅ Fetch user + business data together
  Future<Map<String, dynamic>> _fetchCombinedData() async {
    try {
      final userSnap = await ProfileController().getUserData();
      final userData = userSnap.data() as Map<String, dynamic>? ?? {};

      final businessSnap = await RegesterBusinesscontroller()
          .getbuisnessDataforprofile();

      final businessData = businessSnap.data() as Map<String, dynamic>? ?? {};
      businessId = businessSnap.id;

      return {"user": userData, "business": businessData};
    } catch (e) {
      debugPrint("❌ Error in _fetchCombinedData: $e");
      return {"user": {}, "business": {}};
    }
  }

  @override
  Widget build(BuildContext context) {
    final profileController = ProfileController();

    return Scaffold(
      endDrawer: const AppDrawer(),
      appBar: AppBar(
        elevation: 0.4,
        title: FutureBuilder<Map<String, dynamic>>(
          future: _fetchCombinedData(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Text("User", style: TextStyle(color: Colors.black));
            }
            final userData = snapshot.data!["user"] ?? {};
            final name = userData["name"] ?? "User";
            return Text(
              name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                foreground: Paint()
                  ..shader = const LinearGradient(
                    colors: [Color(0xFF7F00FF), Color(0xFFE100FF)],
                  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
              ),
            );
          },
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
              (route) => false,
            );
          },
          icon: ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color(0xFF7F00FF), Color(0xFFE100FF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),

        // ✅Actions added here before the drawer
        actions: [
          IconButton(
            onPressed: () {
              AddProjectBottomSheet.show(context);
            },
            icon: const Icon(Icons.add_box_outlined, color: Colors.pink),
          ),
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),

      //  Pull to refresh
      body: RefreshIndicator(
        onRefresh: () async => setState(() {}),
        child: FutureBuilder<Map<String, dynamic>>(
          future: _fetchCombinedData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData) {
              return const Center(child: Text("No data found"));
            }

            final userData = snapshot.data!["user"] ?? {};
            final businessData = snapshot.data!["business"] ?? {};

            final email = userData["email"] ?? "email@example.com";
            final contact = userData["phoneNo"] ?? "N/A";
            final category = businessData["subcategory2"] ?? "Not specified";
            final description =
                businessData["discription"] ?? "No description provided.";
            final businessName =
                businessData["businessName"] ?? "Business Not Registered";
            final profileImage = businessData['imageUrl'] ?? '';
            final joinDate =
                userData["signupDate"]?.toString().substring(0, 10) ??
                "Unknown";

            final bool hasBusiness =
                businessName != "Business Not Registered" &&
                businessData.isNotEmpty;

            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),

                    ///  PROFILE HEADER
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 45,
                          backgroundImage: profileImage.isNotEmpty
                              ? NetworkImage(profileImage)
                              : const AssetImage(
                                      'assets/images/default_profile.png',
                                    )
                                    as ImageProvider,
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                businessName,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                category,
                                style: const TextStyle(color: Colors.grey),
                              ),
                              Text(
                                "Joined: $joinDate",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    /// 📞 CONTACT DETAILS
                    Text(
                      email,
                      style: const TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.phone, size: 16, color: Colors.grey),
                        const SizedBox(width: 6),
                        Text(
                          contact,
                          style: const TextStyle(color: Colors.black87),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    /// 📝 DESCRIPTION
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 16),

                    /// 🏢 BUSINESS ADDRESS CARD
                    if (hasBusiness && businessData.isNotEmpty) ...[
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.purple.shade50,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.purpleAccent.withOpacity(0.4),
                          ),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Business Address 🏢",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "${businessData['plotNo'] ?? ''}, ${businessData['buildingName'] ?? ''}",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              "${businessData['road'] ?? ''}, ${businessData['area'] ?? ''}",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              "${businessData['city'] ?? ''}, ${businessData['state'] ?? ''} - ${businessData['pincode'] ?? ''}",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black87,
                              ),
                            ),
                            if ((businessData['gst'] ?? '').isNotEmpty) ...[
                              const SizedBox(height: 6),
                              Text(
                                "GST: ${businessData['gst']}",
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],

                    const SizedBox(height: 20),

                    /// ✏️ EDIT + SHARE BUTTONS
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () async {
                              final updatedProfile = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => EditProfilePage(
                                    controller: profileController,
                                  ),
                                ),
                              );
                              if (updatedProfile != null) {
                                profileController.updateProfile(updatedProfile);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Profile updated successfully!",
                                    ),
                                  ),
                                );
                              }
                            },
                            icon: const Icon(Icons.edit_outlined),
                            label: const Text("Edit"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purpleAccent,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () => _showShareBottomSheet(context),
                            icon: const Icon(Icons.share_outlined),
                            label: const Text("Share"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purpleAccent,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    /// 🌟 SUBSCRIPTION CARD
                    if (hasBusiness)
                      AnimatedBuilder(
                        animation: _shineController,
                        builder: (context, child) {
                          return ShaderMask(
                            shaderCallback: (rect) {
                              return LinearGradient(
                                begin: Alignment(
                                  -1.0 + 2.0 * _shineController.value,
                                  -1,
                                ),
                                end: Alignment(
                                  1.0 + 2.0 * _shineController.value,
                                  1,
                                ),
                                colors: const [
                                  Colors.white24,
                                  Colors.white10,
                                  Colors.transparent,
                                ],
                                stops: const [0.0, 0.3, 1.0],
                              ).createShader(rect);
                            },
                            blendMode: BlendMode.lighten,
                            child: child,
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF7F00FF), Color(0xFFE100FF)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.purple.withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Boost Your Business 🚀",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                const Text(
                                  "Subscribe to premium to reach more customers and grow faster!",
                                  style: TextStyle(color: Colors.white70),
                                ),
                                const SizedBox(height: 12),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: ElevatedButton(
                                    onPressed: _showSubscriptionOptions,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      foregroundColor: Colors.purple,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    child: const Text("Subscribe Now"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                    const SizedBox(height: 25),
                    const Divider(),

                    /// 🧱 PROJECT GRID
                    loading
                        ? const Padding(
                            padding: EdgeInsets.all(20),
                            child: CircularProgressIndicator(),
                          )
                        : GridView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: posts.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 2,
                                  mainAxisSpacing: 2,
                                ),
                            itemBuilder: (context, index) {
                              final imageUrl = posts[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          PostDetailPage(imageUrl: imageUrl),
                                    ),
                                  );
                                },
                                child: Hero(
                                  tag: imageUrl,
                                  child: Image.network(
                                    imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: const BottomNavWidget(currentIndex: 3),
    );
  }

  /// 🔗 Share Bottom Sheet
  void _showShareBottomSheet(BuildContext context) {
    const appLink = "https://example.com/yourapp";
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
                    Icons.message,
                    Colors.green,
                    "WhatsApp",
                    () {
                      Share.share("Check out this app: $appLink");
                      Navigator.pop(context);
                    },
                  ),
                  _buildShareButton(
                    Icons.telegram,
                    Colors.blue,
                    "Telegram",
                    () {
                      Share.share("Check out this app: $appLink");
                      Navigator.pop(context);
                    },
                  ),
                  _buildShareButton(Icons.email, Colors.orange, "Email", () {
                    Share.share("Check out this app: $appLink");
                    Navigator.pop(context);
                  }),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildShareButton(
    IconData icon,
    Color color,
    String label,
    VoidCallback onTap,
  ) {
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

  /// 💎 Subscription Options
  void _showSubscriptionOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: Wrap(
            children: [
              const Center(
                child: Text(
                  "Choose a plan",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 12),
              _buildPlanTile("Basic", "Free - limited visibility", "Basic"),
              _buildPlanTile("Pro", "₹299 / month - more visibility", "Pro"),
              _buildPlanTile(
                "Premium",
                "₹599 / month - top placement",
                "Premium",
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPlanTile(String title, String subtitle, String planName) {
    return ListTile(
      leading: const Icon(Icons.star, color: Colors.purple),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => SubscriptionPage(planName: planName),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purpleAccent,
          foregroundColor: Colors.white,
        ),
        child: const Text("Select"),
      ),
    );
  }
}
