import 'package:flutter/material.dart';

class ProfileActivityPage extends StatefulWidget {
  const ProfileActivityPage({super.key});

  @override
  State<ProfileActivityPage> createState() => _ProfileActivityPageState();
}

class _ProfileActivityPageState extends State<ProfileActivityPage> {
  final List<Map<String, dynamic>> _activities = [
    {
      "icon": Icons.shopping_bag,
      "title": "Order #1023",
      "subtitle": "Purchased from Craft & Co.",
      "time": "2 hours ago",
      "color": Colors.purpleAccent,
    },
    {
      "icon": Icons.comment,
      "title": "You commented on a post",
      "subtitle": "“Loved your latest video!”",
      "time": "5 hours ago",
      "color": Colors.orangeAccent,
    },
    {
      "icon": Icons.favorite,
      "title": "You liked a product",
      "subtitle": "Artisan Wooden Bowl",
      "time": "Yesterday",
      "color": Colors.redAccent,
    },
    {
      "icon": Icons.attach_money,
      "title": "Payment Successful",
      "subtitle": "Subscription renewed for 1 month",
      "time": "2 days ago",
      "color": Colors.greenAccent,
    },
    {
      "icon": Icons.person_add,
      "title": "New Follower",
      "subtitle": "Emily Johnson started following you",
      "time": "3 days ago",
      "color": Colors.blueAccent,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Activity"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _activities.length,
        itemBuilder: (context, index) {
          final activity = _activities[index];
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: activity['color'].withOpacity(0.2),
                child: Icon(activity['icon'], color: activity['color']),
              ),
              title: Text(
                activity['title'],
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(activity['subtitle']),
              trailing: Text(
                activity['time'],
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 12,
                ),
              ),
              onTap: () {
                // Navigate or show more details
              },
            ),
          );
        },
      ),
    );
  }
}