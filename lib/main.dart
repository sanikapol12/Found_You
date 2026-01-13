import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/view/home_page.dart';
import 'package:flutter_project/view/onboarding_screen.dart';
import 'package:flutter_project/view/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyC2S1hZCyWkHc4WXU8JwHBI-_pRwAZMTS0",
      appId: "1:378478114101:android:d9af825851a8292157087c",
      messagingSenderId: "378478114101",
      projectId: "flutterproject-90c6b",
      storageBucket: "flutterproject-90c6b.firebasestorage.app",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'conneting the people',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: SplashscreenPage(),
    );
  }
}
