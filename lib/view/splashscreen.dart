import 'package:flutter/material.dart';
import 'package:flutter_project/controller/user_controller.dart';
import 'package:flutter_project/view/home_page.dart';
import 'package:flutter_project/view/login_page.dart';
import 'package:flutter_project/view/onboarding_screen.dart';

class SplashscreenPage extends StatefulWidget {
  const SplashscreenPage({super.key});

  @override
  State<SplashscreenPage> createState() => _SplashscreenPageState();
}

class _SplashscreenPageState extends State<SplashscreenPage> {
  void getPage(BuildContext context) async {
    UserController usercontrollerObj = UserController();
    await usercontrollerObj.getSharePrefrenceData();

    if (usercontrollerObj.isLogin) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return OnboardingPage();
          },
        ),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return OnboardingPage();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      getPage(context);
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Main content in the center
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/jpg/splash.jpeg"),
                const SizedBox(height: 10),
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [
                      Color(0xFF7F00FF), // Purple
                      Color(0xFFE100FF), // Pink
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds),
                  child: const Text(
                    "FOUND YOU",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // must be white for gradient to show
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Bottom "from incubators --- by core2web"
          // const Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Padding(
          //     padding: EdgeInsets.only(bottom: 40),
          //     child: Column(
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //         Text(
          //           "from",
          //           style: TextStyle(color: Colors.black54, fontSize: 14),
          //         ),
          //         SizedBox(height: 4),
          //         Text(
          //           "incubators",
          //           style: TextStyle(
          //             color: Colors.redAccent,
          //             fontSize: 22,
          //             fontWeight: FontWeight.bold,
          //             letterSpacing: 1,
          //           ),
          //         ),
          //         SizedBox(height: 4),
          //         Text(
          //           "by core2web ",
          //           style: TextStyle(
          //             color: Colors.blueAccent,
          //             fontSize: 14,
          //             fontWeight: FontWeight.w500,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
