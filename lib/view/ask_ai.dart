import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AskAIPage extends StatefulWidget {
  const AskAIPage({super.key});

  @override
  State<AskAIPage> createState() => _AskAIPageState();
}

class _AskAIPageState extends State<AskAIPage> {
  final TextEditingController _controller = TextEditingController();
  String _response = '';
  bool _loading = false;

  Future<void> askGemini(String question) async {
    if (question.trim().isEmpty) return;

    setState(() => _loading = true);

    const apiKey = 'AIzaSyB3V1KudbVuAoygBz7SbQQYn2FgB1SVfao';
    const url =
        'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=$apiKey';

    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      "contents": [
        {
          "parts": [
            {"text": question},
          ],
        },
      ],
    });

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    log("RESPONSE DATA ${response.body}");
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final answer = data['candidates'][0]['content']['parts'][0]['text'];
      setState(() {
        _response = answer;
        _controller.clear(); //  clears text field after response
      });
    } else {
      setState(() {
        _response = 'Error: ${response.statusCode}\n${response.body}';
        _controller.clear(); // also clears in error case
      });
    }

    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
   // final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ask AI'),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Input Field
            TextField(
              controller: _controller,
              textInputAction: TextInputAction.done,
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(
                hintText: 'Ask me anything...',
                filled: true,
                fillColor: Colors.grey.shade100,
                prefixIcon: const Icon(
                  Icons.chat_bubble_outline,
                  color: Colors.deepPurpleAccent,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Ask Button
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                onPressed: _loading ? null : () => askGemini(_controller.text),
                icon: _loading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : const Icon(Icons.send_rounded, color: Colors.white),
                label: Text(
                  _loading ? 'Thinking...' : 'Ask',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Response Display
            Expanded(
              child: SingleChildScrollView(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: _response.isEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.psychology_outlined,
                              size: 64,
                              color: Colors.deepPurpleAccent,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Ask something to get started!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        )
                      : Text(
                          _response,
                          style: const TextStyle(fontSize: 16, height: 1.5),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
