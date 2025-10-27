import 'package:flutter/material.dart';

class HelpCenterpage extends StatelessWidget {
  const HelpCenterpage({super.key});

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
          "Help Center",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          _buildCategory(
            title: "Account & Login",
            icon: Icons.person_outline,
            onTap: () {
              // Navigate to detailed page if needed
            },
          ),
          _buildCategory(
            title: "Orders & Payments",
            icon: Icons.shopping_bag_outlined,
            onTap: () {},
          ),
          _buildCategory(
            title: "Shipping & Returns",
            icon: Icons.local_shipping_outlined,
            onTap: () {},
          ),
          _buildCategory(
            title: "Promotions & Offers",
            icon: Icons.campaign_outlined,
            onTap: () {},
          ),
          _buildCategory(
            title: "Technical Issues",
            icon: Icons.build_outlined,
            onTap: () {},
          ),
          _buildCategory(
            title: "Privacy & Security",
            icon: Icons.lock_outline,
            onTap: () {},
          ),
          const SizedBox(height: 30),
          Center(
            child: TextButton(
              onPressed: () {
                // Could open contact/support form
              },
              child: const Text(
                "Contact Support",
                style: TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Category Tile
  Widget _buildCategory({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.teal),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    );
  }
}
