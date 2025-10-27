import 'package:flutter/material.dart';

class Notificationpage extends StatefulWidget {
  const Notificationpage({super.key});

  @override
  State<Notificationpage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<Notificationpage> {
  bool orderUpdates = true;
  bool newFollowers = true;
  bool messages = true;
  bool offers = false;
  bool promotions = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Notifications",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: Text(
              "Push Notifications",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                fontSize: 13,
              ),
            ),
          ),
          const Divider(height: 1),

          _buildSwitchTile(
            icon: Icons.shopping_bag_outlined,
            title: "Order Updates",
            subtitle: "Get notified when you receive new orders",
            value: orderUpdates,
            onChanged: (val) => setState(() => orderUpdates = val),
          ),
          _buildSwitchTile(
            icon: Icons.person_add_alt_1_outlined,
            title: "New Followers",
            subtitle: "When someone follows your shop",
            value: newFollowers,
            onChanged: (val) => setState(() => newFollowers = val),
          ),
          _buildSwitchTile(
            icon: Icons.message_outlined,
            title: "Messages",
            subtitle: "Get notifications for new chats",
            value: messages,
            onChanged: (val) => setState(() => messages = val),
          ),

          const Divider(height: 20),

          const Padding(
            padding: EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: Text(
              "Marketing & Promotions",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                fontSize: 13,
              ),
            ),
          ),
          const Divider(height: 1),

          _buildSwitchTile(
            icon: Icons.local_offer_outlined,
            title: "Offers & Discounts",
            subtitle: "Receive alerts for app-wide deals",
            value: offers,
            onChanged: (val) => setState(() => offers = val),
          ),
          _buildSwitchTile(
            icon: Icons.campaign_outlined,
            title: "Promotional Notifications",
            subtitle: "Receive app tips and updates",
            value: promotions,
            onChanged: (val) => setState(() => promotions = val),
          ),
        ],
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Notification settings saved")),
            );
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            minimumSize: const Size(double.infinity, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            "Save",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }

  // 🔹 Reusable Switch Tile Widget
  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return SwitchListTile(
      value: value,
      onChanged: onChanged,
      title: Row(
        children: [
          Icon(icon, color: Colors.teal),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(left: 36),
        child: Text(subtitle),
      ),
      activeColor: Colors.teal,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    );
  }
}
