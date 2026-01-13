import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/controller/user_controller.dart';
import 'package:flutter_project/view/customeSnackBar.dart';
import 'package:flutter_project/view/home_page.dart';
import 'package:flutter_project/view/signup_page.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String name = '';
  bool _obscurePassword = true;
  bool _agreeToTerms = false; // ✅ added checkbox state

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  final FirebaseAuth _firebaseauthObj = FirebaseAuth.instance;
  UserController userControllerobj = UserController();

  void Login(BuildContext context, UserCredential userCredentialObj) {
    Map data = {
      'email': emailController.text.trim(),
      'uid': userCredentialObj.user!.uid,
      'isLogin': true,
    };
    // You may want to save this data using SharedPreferences or similar
    userControllerobj.setSharedPreferedData(data);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 240, 240, 240),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.search, color: Colors.white),
        //     onPressed: () {},
        //   ),
        // ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 240, 240, 240),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) =>
                        const LinearGradient(
                          colors: [
                            Color(0xFF7F00FF),
                            Color(0xFFE100FF),
                          ], // Purple → Pink
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(
                          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                        ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color:
                            Colors.white, // Important: keeps gradient visible
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Join us and explore amazing services!',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  const SizedBox(height: 40),

                  // Email field
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    onSaved: (value) => email = value!,
                  ),
                  const SizedBox(height: 15),

                  // Password field
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                    obscureText: _obscurePassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    onSaved: (value) => password = value!,
                  ),
                  SizedBox(height: 20),

                  SizedBox(height: 20),
                  CheckboxListTile(
                    title: const Text(
                      "I agree to the Terms & Privacy Policy",
                      style: TextStyle(fontSize: 14),
                    ),
                    value: _agreeToTerms,
                    activeColor: Colors.blue[900],
                    onChanged: (value) {
                      setState(() {
                        _agreeToTerms = value ?? false;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),

                  SizedBox(height: 60),

                  // Login button
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF7F00FF), // Purple
                            Color(0xFFE100FF), // Pink
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            if (_agreeToTerms) {
                              try {
                                UserCredential userCredentialObj =
                                    await _firebaseauthObj
                                        .signInWithEmailAndPassword(
                                          email: emailController.text.trim(),
                                          password: passwordController.text
                                              .trim(),
                                        );

                                log("User Credentials:$userCredentialObj");
                                log("User: ${userCredentialObj.user}");
                                log("User Id:${userCredentialObj.user!.uid}");

                                CustomSnackBars().showCustomSnackbar(
                                  context,
                                  "Login Successful",
                                );

                                Login(context, userCredentialObj);

                                confirmpasswordController.clear();
                              } on FirebaseAuthException catch (error) {
                                CustomSnackBars().showCustomSnackbar(
                                  context,
                                  error.message!,
                                  bgColor: Colors.red,
                                );
                              }
                            } else {
                              CustomSnackBars().showCustomSnackbar(
                                context,
                                "You must agree to the Terms & Privacy Policy",
                                bgColor: Colors.red,
                              );
                            }
                          } else {
                            CustomSnackBars().showCustomSnackbar(
                              context,
                              "Enter Valid Data",
                              bgColor: Colors.red,
                            );
                          }
                          emailController.clear();
                          passwordController.clear();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.transparent, // allows gradient to show
                          shadowColor:
                              Colors.transparent, // removes extra shadow
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: const Text(
                          'Log In',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Signuppage(),
                            ),
                          );
                        },
                        child: Text(
                          "  Sign up",
                          style: TextStyle(color: Colors.blue[900]),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
