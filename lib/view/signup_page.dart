import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/view/customeSnackBar.dart';
import 'package:flutter_project/view/login_page.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String name = '';
  bool _obscurePassword = true;
  bool _agreeToTerms = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  final FirebaseAuth _firebaseauthObj = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 32, 20, 18),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            );
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),

        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
        //  backgroundColor: Colors.white,
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
                  const Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 16, 17, 17),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Join us and explore amazing services!',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  const SizedBox(height: 40),
                  //name
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_2_outlined),
                      labelText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),

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
                  TextFormField(
                    controller: confirmpasswordController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: 'Confirm Password',
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

                  SizedBox(height: 30),

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
                    child: ElevatedButton(
                      onPressed: () async {
                        if (emailController.text.trim().isNotEmpty &&
                            passwordController.text.trim().isNotEmpty) {
                          try {
                            UserCredential userCredentialObj =
                                await _firebaseauthObj
                                    .createUserWithEmailAndPassword(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );

                            log("User Credentials:$userCredentialObj");

                            CustomSnackBars().showCustomSnackbar(
                              context,
                              "Register Successful",
                            );

                            emailController.clear();
                            passwordController.clear();

                            Navigator.of(context).pop();
                          } on FirebaseAuthException catch (error) {
                            log("Error Code: ${error.code}");
                            log("Error Message: ${error.message}");
                            if (error.code.toString() == "invalid-email") {
                              CustomSnackBars().showCustomSnackbar(
                                context,
                                "Enter Valid Email",
                                bgColor: Colors.red,
                              );
                            } else {
                              CustomSnackBars().showCustomSnackbar(
                                context,
                                error.message!,
                                bgColor: Colors.red,
                              );
                            }
                          }
                        } else {
                          CustomSnackBars().showCustomSnackbar(
                            context,
                            "Enter Valid Data",
                            bgColor: Colors.red,
                          );
                        }

                        log("${nameController}");
                        log("${emailController}");
                        log("${passwordController}");
                        log("${confirmpasswordController}");

                        nameController.clear();
                        emailController.clear();
                        passwordController.clear();
                        confirmpasswordController.clear();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[900],
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}