import 'package:flutter/material.dart';
import 'package:flutter_project/view/category_page.dart';
import 'package:flutter_project/view/favorite_page.dart';
import 'package:flutter_project/view/profilepage.dart';
import '../view/home_page.dart';

class BottomNavController {
  int selectedIndex = 0;

  // Page navigation logic
  void onItemTapped(BuildContext context, int index) {
    selectedIndex = index;

    Widget page;
    switch (index) {
      case 0:
        page = HomePage();
        break;
      case 1:
        page = CategoryPage();
        break;
      case 2:
        page =  FavoritePage();
        break;
      case 3:
        page = const Profilepage();
        break;
      default:
        page = HomePage();
    }

    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }
}
