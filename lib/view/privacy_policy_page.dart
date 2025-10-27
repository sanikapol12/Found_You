import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Privacy Policy",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "We respect your privacy and are committed to protecting your personal information. "
                "This Privacy Policy explains how we collect, use, and safeguard your data when you use our app.\n\n"
                "1. Information Collection: We may collect personal information such as your name, email address, "
                "and usage data to improve our services.\n\n"
                "2. Information Use: Collected information is used to provide and improve app features, "
                "send updates, and ensure security.\n\n"
                "3. Data Sharing: We do not sell your personal information. It may only be shared with trusted "
                "partners or as required by law.\n\n"
                "4. Data Security: We implement reasonable security measures to protect your information from "
                "unauthorized access.\n\n"
                "5. Changes to Policy: We may update this policy periodically. Any changes will be notified "
                "within the app.\n\n"
                "By using the app, you agree to this Privacy Policy.",
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}