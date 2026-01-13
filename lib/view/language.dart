import 'package:flutter/material.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  String _selectedLanguage = "English";

  final List<String> _languages = [
    "English",
    "Hindi",
    "Marathi",
    "Gujarati",
    "Tamil",
    "Telugu",
    "Kannada",
    "Malayalam",
    "Bengali",
    "Punjabi",
    "Urdu",
  ];

  // 🔹 Your app’s gradient theme
  final LinearGradient appGradient = const LinearGradient(
    colors: [
      Color(0xFF7F00FF), // Purple
      Color(0xFFE100FF), // Pink
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

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
        // title: ShaderMask(
        //   shaderCallback: (bounds) => appGradient.createShader(bounds),
        //   child: const Text(
        //     "Language",
        //     style: TextStyle(
        //       color: Colors.white, // overridden by ShaderMask
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        // ),
        title: Text("Language", style: TextStyle(fontWeight: FontWeight.bold)),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Text(
              "Choose your preferred language",
              style: TextStyle(color: Colors.black54, fontSize: 14),
            ),
          ),
          const Divider(),

          // 🔹 Language List
          Expanded(
            child: ListView.builder(
              itemCount: _languages.length,
              itemBuilder: (context, index) {
                final lang = _languages[index];
                final isSelected = lang == _selectedLanguage;

                return ListTile(
                  title: Text(lang, style: const TextStyle(fontSize: 16)),
                  trailing: isSelected
                      ? ShaderMask(
                          shaderCallback: (bounds) =>
                              appGradient.createShader(bounds),
                          child: const Icon(
                            Icons.check_circle,
                            color: Colors.white,
                          ),
                        )
                      : const Icon(Icons.circle_outlined, color: Colors.grey),
                  onTap: () {
                    setState(() {
                      _selectedLanguage = lang;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Language changed to $_selectedLanguage"),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),

      // 🔹 Gradient "Save" Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            gradient: appGradient,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFE100FF).withOpacity(0.4),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "App language set to $_selectedLanguage successfully",
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              minimumSize: const Size(double.infinity, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              "Save",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
