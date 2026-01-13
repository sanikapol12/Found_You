import 'package:flutter/material.dart';
import 'package:flutter_project/controller/profile_controller.dart';
import 'package:flutter_project/controller/register_business_controller.dart';
import 'package:flutter_project/view/edit_profile.dart';
import 'package:flutter_project/view/email_preferences.dart';
import 'package:flutter_project/view/fotgot_password.dart';
import 'package:flutter_project/view/login_page.dart';
import 'package:flutter_project/view/privacy_policy_page.dart';
import 'package:flutter_project/view/term_services.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool syncData = false;
  bool notifications = true;

  String? businessId;
  final ProfileController profileController = ProfileController();

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
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ---- Header ----
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: ShaderMask(
                      shaderCallback: (bounds) =>
                          const LinearGradient(
                            colors: [Colors.blue, Colors.purple],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ).createShader(
                            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                          ),
                      child: const Text(
                        "Account Settings",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // ---- Account Section ----
              const SectionTitle(title: "Account"),
              SettingsTile(
                icon: Icons.edit,
                color: Colors.redAccent,
                title: 'Edit Profile',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          EditProfilePage(controller: profileController),
                    ),
                  );
                },
              ),
              SettingsTile(
                icon: Icons.lock_outline,
                color: Colors.green,
                title: 'Change Password',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ForgotPasswordPage(
                        titleMessage: "Change Password",
                      ),
                    ),
                  );
                },
              ),
              SettingsTile(
                icon: Icons.email_outlined,
                color: Colors.blue,
                title: 'Email Preferences',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const EmailPreferencesPage(),
                    ),
                  );
                },
              ),

              const Divider(height: 30, thickness: 0.8),

              // ---- App Preferences ----
              const SectionTitle(title: "App Preferences"),
              SettingsSwitchTile(
                icon: Icons.sync,
                color: Colors.orange,
                title: 'Sync Data',
                value: syncData,
                onChanged: (value) => setState(() => syncData = value),
              ),
              SettingsSwitchTile(
                icon: Icons.notifications_none,
                color: Colors.blueAccent,
                title: 'Notifications',
                value: notifications,
                onChanged: (value) => setState(() => notifications = value),
              ),

              const Divider(height: 30, thickness: 0.8),

              // ---- More Section ----
              const SectionTitle(title: "More"),
              SettingsTile(
                icon: Icons.security,
                color: Colors.purple,
                title: 'Privacy Policy',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const PrivacyPolicyPage(),
                    ),
                  );
                },
              ),
              SettingsTile(
                icon: Icons.description_outlined,
                color: Colors.lightBlue,
                title: 'Terms of Service',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const TermsOfServicePage(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 30),

              // ---- Logout Button ----
              GradientButton(
                text: "Log Out",
                onPressed: () => _showLogoutDialog(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text(
          "Confirm Logout",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: const Text("Are you sure you want to log out?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const Login()),
              );
            },
            child: const Text("Logout", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}

//
// --- Reusable Widgets ---
//

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
          letterSpacing: 0.8,
        ),
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final VoidCallback onTap;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.color,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: color),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey,
      ),
      onTap: onTap,
    );
  }
}

class SettingsSwitchTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const SettingsSwitchTile({
    super.key,
    required this.icon,
    required this.color,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: color),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      trailing: Switch.adaptive(
        value: value,
        onChanged: onChanged,
        activeColor: const Color(0xFF6A11CB),
      ),
      onTap: () => onChanged(!value),
    );
  }
}

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const GradientButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
