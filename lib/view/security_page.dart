import 'package:flutter/material.dart';

class SecurityPage extends StatelessWidget {
  const SecurityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: const Text(
          "Security",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "Keep your shop and account safe",
            style: TextStyle(color: Colors.black54, fontSize: 14),
          ),
          const SizedBox(height: 16),

          // 🔐 Password Section
          _buildSectionTitle("Password & Login"),
          _buildSecurityTile(
            icon: Icons.lock_outline,
            title: "Change Password",
            subtitle: "Update your login password",
            onTap: () {},
          ),
          _buildSecurityTile(
            icon: Icons.login_outlined,
            title: "Login Activity",
            subtitle: "See where you’re logged in",
            onTap: () {},
          ),
          _buildSecurityTile(
            icon: Icons.device_hub_outlined,
            title: "Device Management",
            subtitle: "Manage devices logged into your shop account",
            onTap: () {},
          ),

          const Divider(height: 30),

          // 🧱 Two-Factor Auth Section
          _buildSectionTitle("Two-Factor Authentication"),
          _buildSecurityTile(
            icon: Icons.security_outlined,
            title: "Set up 2FA",
            subtitle: "Add an extra layer of protection",
            onTap: () {},
          ),
          _buildSecurityTile(
            icon: Icons.sms_outlined,
            title: "Text Message (SMS)",
            subtitle: "Receive login codes via SMS",
            onTap: () {},
          ),
          _buildSecurityTile(
            icon: Icons.email_outlined,
            title: "Email Verification",
            subtitle: "Get login alerts by email",
            onTap: () {},
          ),

          const Divider(height: 30),

          // 🔍 Monitoring Section
          _buildSectionTitle("Monitoring"),
          _buildSecurityTile(
            icon: Icons.notifications_active_outlined,
            title: "Login Alerts",
            subtitle: "Get alerts for unrecognized logins",
            onTap: () {},
          ),
          _buildSecurityTile(
            icon: Icons.visibility_outlined,
            title: "Recent Security Events",
            subtitle: "View your last password and login changes",
            onTap: () {},
          ),

          const Divider(height: 30),

          // ❌ Danger Zone
          _buildSectionTitle("Danger Zone"),
          ListTile(
            leading: const Icon(Icons.delete_forever, color: Colors.red),
            title: const Text(
              "Delete Account",
              style: TextStyle(fontWeight: FontWeight.w500, color: Colors.red),
            ),
            subtitle: const Text(
              "Permanently delete your shop account",
              style: TextStyle(color: Colors.black54),
            ),
            onTap: () => _showDeleteDialog(context),
          ),
        ],
      ),
    );
  }

  // Section Title Widget
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 8, 4, 4),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 13,
          color: Colors.grey,
        ),
      ),
    );
  }

  // Single Tile
  Widget _buildSecurityTile({
    required IconData icon,
    required String title,
    String? subtitle,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.teal),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  // Delete Confirmation Dialog
  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text(
            "Delete Account?",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: const Text(
            "This will permanently remove your shop data and cannot be undone.",
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Account deleted permanently")),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text("Delete"),
            ),
          ],
        );
      },
    );
  }
}
