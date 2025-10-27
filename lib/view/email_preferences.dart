import 'package:flutter/material.dart';

class EmailPreferencesPage extends StatefulWidget {
  const EmailPreferencesPage({super.key});

  @override
  State<EmailPreferencesPage> createState() => _EmailPreferencesPageState();
}

class _EmailPreferencesPageState extends State<EmailPreferencesPage> {
  // Toggles for different email categories
  bool promotionalEmails = true;
  bool accountUpdates = true;
  bool newsletters = false;
  bool feedbackRequests = false;

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFFE53935);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Email Preferences'),
        centerTitle: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Manage what types of emails you’d like to receive from us.',
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ),
          const SizedBox(height: 20),

          _buildSwitchTile(
            icon: Icons.local_offer_outlined,
            title: "Promotional Emails",
            subtitle: "Get notified about special offers and new features.",
            value: promotionalEmails,
            onChanged: (value) => setState(() => promotionalEmails = value),
          ),

          _buildSwitchTile(
            icon: Icons.update_outlined,
            title: "Account Updates",
            subtitle: "Important notifications about your account and security.",
            value: accountUpdates,
            onChanged: (value) => setState(() => accountUpdates = value),
          ),

          _buildSwitchTile(
            icon: Icons.email_outlined,
            title: "Newsletters",
            subtitle: "Monthly updates with news, tips, and product stories.",
            value: newsletters,
            onChanged: (value) => setState(() => newsletters = value),
          ),

          _buildSwitchTile(
            icon: Icons.feedback_outlined,
            title: "Feedback & Surveys",
            subtitle: "Occasional requests to help us improve our services.",
            value: feedbackRequests,
            onChanged: (value) => setState(() => feedbackRequests = value),
          ),

          const SizedBox(height: 30),

          // --- Save Button ---
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Here you can handle saving preferences to backend or local storage
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Email preferences updated')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text(
                "Save Preferences",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// --- Helper for switch tile ---
  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.redAccent.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.redAccent),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 13)),
        trailing: Switch.adaptive(
          value: value,
          onChanged: onChanged,
          activeColor: const Color(0xFFE53935),
        ),
        onTap: () => onChanged(!value),
      ),
    );
  }
}