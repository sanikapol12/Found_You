import 'package:flutter/material.dart';

class YourActivityPage extends StatelessWidget {
  const YourActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: const Text(
          "Your Activity",
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
            "Insights for your shop performance",
            style: TextStyle(color: Colors.black54, fontSize: 14),
          ),
          const SizedBox(height: 16),

          // 🧩 Overview Card
          _buildOverviewCard(),

          const SizedBox(height: 20),

          // 📊 Engagement Section
          const Text(
            "Engagement",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          _buildStatTile(Icons.remove_red_eye_outlined, "Profile Visits", "1.2k visits this week"),
          _buildStatTile(Icons.shopping_bag_outlined, "Product Clicks", "863 clicks on products"),
          _buildStatTile(Icons.favorite_border, "Likes", "420 likes on your posts"),
          _buildStatTile(Icons.comment_outlined, "Comments", "187 comments this month"),
          _buildStatTile(Icons.share_outlined, "Shares", "95 shares of your posts"),

          const Divider(height: 30),

          // 💰 Sales Insights
          const Text(
            "Sales Insights",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          _buildStatTile(Icons.monetization_on_outlined, "Total Sales", "₹47,500 this month"),
          _buildStatTile(Icons.shopping_cart_outlined, "Orders", "320 orders placed"),
          _buildStatTile(Icons.people_alt_outlined, "Returning Customers", "54% retention rate"),

          const Divider(height: 30),

          // 🕓 Time Spent Section
          const Text(
            "Time Spent",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          _buildProgressTile(
            title: "Average daily time spent",
            subtitle: "2h 15m per day",
            progress: 0.7,
          ),
          _buildProgressTile(
            title: "Time spent managing orders",
            subtitle: "45m per day",
            progress: 0.5,
          ),
          _buildProgressTile(
            title: "Time spent replying to DMs",
            subtitle: "30m per day",
            progress: 0.3,
          ),

          const SizedBox(height: 30),

          // 🔁 Clear History
          ElevatedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Activity data cleared")),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              minimumSize: const Size(double.infinity, 45),
            ),
            icon: const Icon(Icons.delete_outline, color: Colors.white),
            label: const Text(
              "Clear Activity History",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  // 🧩 Overview Card
  Widget _buildOverviewCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildOverviewItem("Reach", "8.3k"),
            _buildOverviewItem("Engagement", "2.5k"),
            _buildOverviewItem("Followers", "4.1k"),
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewItem(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(fontSize: 13, color: Colors.grey),
        ),
      ],
    );
  }

  // 📊 Stat Tile
  Widget _buildStatTile(IconData icon, String title, String subtitle) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Colors.teal),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: Text(subtitle, style: const TextStyle(color: Colors.black54)),
    );
  }

  // ⏱ Progress Tile
  Widget _buildProgressTile({
    required String title,
    required String subtitle,
    required double progress,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
          Text(subtitle, style: const TextStyle(color: Colors.black54, fontSize: 13)),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey.shade300,
            color: Colors.purpleAccent,
            minHeight: 6,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      ),
    );
  }
}
