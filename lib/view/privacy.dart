import 'package:flutter/material.dart';

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({super.key});

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  bool isPrivateAccount = false;
  bool showActivityStatus = true;
  bool allowStorySharing = true;
  bool allowTagging = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: const Text(
          "Privacy",
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
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Manage your privacy settings to control who can see your content and activity.",
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ),
          const Divider(),

          _buildSwitchTile(
            title: "Private Account",
            subtitle: "Only people you approve can see your posts and reels.",
            value: isPrivateAccount,
            onChanged: (val) => setState(() => isPrivateAccount = val),
          ),
          _buildSwitchTile(
            title: "Show Activity Status",
            subtitle: "Allow others to see when you're active.",
            value: showActivityStatus,
            onChanged: (val) => setState(() => showActivityStatus = val),
          ),
          _buildSwitchTile(
            title: "Allow Story Sharing",
            subtitle: "Let others share your stories as messages.",
            value: allowStorySharing,
            onChanged: (val) => setState(() => allowStorySharing = val),
          ),
          _buildSwitchTile(
            title: "Allow Tagging",
            subtitle: "Allow others to tag you in posts and comments.",
            value: allowTagging,
            onChanged: (val) => setState(() => allowTagging = val),
          ),

          const Divider(height: 30),

          ListTile(
            leading: const Icon(Icons.block, color: Colors.redAccent),
            title: const Text(
              "Blocked Accounts",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Blocked accounts page coming soon")),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.comments_disabled_outlined, color: Colors.orange),
            title: const Text(
              "Hidden Comments",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Hidden comments settings coming soon")),
              );
            },
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildSwitchTile({
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return SwitchListTile(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
      ),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
      activeColor: Colors.blueAccent,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }
}
