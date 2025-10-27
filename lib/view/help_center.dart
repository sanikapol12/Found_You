import 'package:flutter/material.dart';

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    //const Color primaryColor = Color(0xFFE53935); // Red theme

    return Scaffold(
      appBar: AppBar(
        title: const Text('Help Center'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // --- Intro Section ---
            const Text(
              'How can we help you?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Find answers to common questions or contact our support team.",
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),

            const SizedBox(height: 25),

            // --- FAQ Section ---
            const Text(
              'Frequently Asked Questions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),

            _buildFaqTile(
              "How do I reset my password?",
              "You can reset your password from the 'Forgot Password' page on the login screen. Follow the instructions to create a new password.",
            ),
            _buildFaqTile(
              "How can I edit my profile?",
              "Go to Settings → Edit Profile to update your personal information.",
            ),
            _buildFaqTile(
              "How do I contact customer support?",
              "You can contact our support team by using the 'Contact Support' option below or by emailing us directly.",
            ),

            const SizedBox(height: 25),

            // --- Contact Support Section ---
            const Text(
              'Contact Support',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.email_outlined, color: Colors.blue),
              title: const Text('Email Us'),
              subtitle: const Text('support@foundyou.com'),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Opening email app...")),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.chat_bubble_outline, color: Colors.green),
              title: const Text('Chat with Us'),
              subtitle: const Text('Get instant help from our team'),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Chat feature coming soon!")),
                );
              },
            ),

            const SizedBox(height: 25),

            // --- Feedback Section ---
            const Text(
              'Send Feedback',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Feedback form coming soon!")),
                  );
                },
                icon: const Icon(Icons.feedback_outlined),
                label: const Text("Give Feedback",style: TextStyle(
                  color: Colors.white
                ),),
                style: ElevatedButton.styleFrom(
                  backgroundColor:Color.fromARGB(255, 61, 61, 61),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// --- Helper widget for FAQ Expansion Tiles ---
  Widget _buildFaqTile(String question, String answer) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 1,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ExpansionTile(
        title: Text(
          question,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(answer, style: const TextStyle(color: Colors.black87)),
          ),
        ],
      ),
    );
  }
}