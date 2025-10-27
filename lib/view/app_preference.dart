import 'package:flutter/material.dart';

class AppPreferencePage extends StatefulWidget {
  const AppPreferencePage({super.key});

  @override
  State<AppPreferencePage> createState() => _AppPreferencePageState();
}

class _AppPreferencePageState extends State<AppPreferencePage> {
  bool _darkMode = false;
  bool _notificationsEnabled = true;
  String _language = "English";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Preferences"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
       
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // --- Theme ---
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: SwitchListTile(
              title: const Text("Dark Mode"),
              subtitle: const Text("Enable dark theme throughout the app"),
              value: _darkMode,
              activeColor: Colors.blueAccent,
              onChanged: (value) {
                setState(() {
                  _darkMode = value;
                });
              },
              secondary: const Icon(Icons.dark_mode),
            ),
          ),

          const SizedBox(height: 10),

          // --- Notifications ---
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: SwitchListTile(
              title: const Text("Notifications"),
              subtitle: const Text("Receive updates and alerts"),
              value: _notificationsEnabled,
              activeColor: Colors.blueAccent,
              onChanged: (value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
              secondary: const Icon(Icons.notifications_active),
            ),
          ),

          const SizedBox(height: 10),

          // --- Language Selection ---
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              leading: const Icon(Icons.language),
              title: const Text("Language"),
              subtitle: Text(_language),
              trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
              onTap: () {
                _showLanguageDialog();
              },
            ),
          ),

          const SizedBox(height: 10),

          // --- About ---
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text("About App"),
              subtitle: const Text("Version 1.0.0"),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Select Language"),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildLanguageOption("English"),
              _buildLanguageOption("Hindi"),
              _buildLanguageOption("Spanish"),
              _buildLanguageOption("French"),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLanguageOption(String lang) {
    return RadioListTile<String>(
      title: Text(lang),
      value: lang,
      groupValue: _language,
      onChanged: (value) {
        setState(() {
          _language = value!;
        });
        Navigator.pop(context);
      },
    );
  }
}