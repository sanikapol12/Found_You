import 'package:flutter/material.dart';

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms of Service'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Terms of Service",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Welcome to our app! By using our services, you agree to comply with these Terms of Service.\n\n"
                "1. Acceptance of Terms: By accessing or using the app, you accept these terms in full.\n\n"
                "2. User Responsibilities: You must provide accurate information, maintain the security of your account, "
                "and not misuse the app for illegal purposes.\n\n"
                "3. Intellectual Property: All content in the app, including images, text, and logos, are the property of the company "
                "or its partners and are protected by copyright laws.\n\n"
                "4. Limitation of Liability: We are not responsible for any damages arising from your use of the app, "
                "to the maximum extent permitted by law.\n\n"
                "5. Termination: We reserve the right to suspend or terminate accounts that violate these terms.\n\n"
                "6. Modifications: We may update these terms periodically, and continued use of the app constitutes acceptance of changes.\n\n"
                "By using the app, you acknowledge that you have read and understood these Terms of Service.",
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}