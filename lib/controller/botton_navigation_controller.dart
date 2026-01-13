import 'package:flutter/material.dart';
import 'package:flutter_project/view/category_page.dart';
import 'package:flutter_project/view/favorite_page.dart';
import 'package:flutter_project/view/profilepage.dart';
import '../view/home_page.dart';

class BottomNavController {
  void onItemTapped(BuildContext context, int index) {
    Widget page;

    switch (index) {
      case 0:
        page = const HomePage();
        break;
      case 1:
        page = const CategoryPage();
        break;
      case 2:
        page = const FavoritePage();
        break;
      case 3:
        page = ProfilePage();
        break;
      default:
        page = const HomePage();
    }

    // ✅ Use pushReplacement so only one page stays in stack
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => page,
        transitionDuration: const Duration(milliseconds: 300),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }
}
