import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  final String titleMessage;
   const ForgotPasswordPage({super.key, required this.titleMessage});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
   final _formKey = GlobalKey<FormState>();
  String email = '';
  String titleMessage="";
 
  bool isLoading = false;

  void resetPassword() async {
    //final email = emailController.text.trim();
   

    

    setState(() {
      isLoading = true;
    });

    
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Password reset OTP sent to your email!"),
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE3F2FD), Color(0xFFB3E5FC), Color(0xFF81D4FA)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 6,
             child: Padding(
  padding: const EdgeInsets.all(24),
  child: Form( // Today's change Added Form here
    key: _formKey, // Today's change Connects to validator
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        

                    const Icon(Icons.lock_reset, size: 60, color: Colors.teal),
                    const SizedBox(height: 20),
                    Text(titleMessage,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Enter your registered email to receive OTP",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black54),
                    ),
                    const SizedBox(height: 30),
                    // ✅ EMAIL FIELD WITH VALIDATION
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter email id'; //  Today's change red text appears below field
                          }
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                        onSaved: (value) => email = value!,
                      ),

                      const SizedBox(height: 30),
                    TextField(
                      controller: otpController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email_outlined),
                        labelText: "OTP",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                     SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              resetPassword();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: isLoading
                              ? const CircularProgressIndicator(color: Colors.white)
                              : const Text(
                                  'Send Reset OTP',
                                  style: TextStyle(fontSize: 18, color: Colors.white),
                                ),
                        ),
                      ),
                    
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}