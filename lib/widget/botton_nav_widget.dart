import 'package:flutter/material.dart';
import 'package:flutter_project/controller/botton_navigation_controller.dart';

class BottomNavWidget extends StatefulWidget {
  final int currentIndex;
  const BottomNavWidget({super.key, required this.currentIndex});

  @override
  State<BottomNavWidget> createState() => _BottomNavWidgetState();
}

class _BottomNavWidgetState extends State<BottomNavWidget> {
  final BottomNavController _controller = BottomNavController();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF7F00FF), // Purple
              Color(0xFFE100FF), // Pinkish
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(0, -3),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,

          // ✅ Current index
          currentIndex: widget.currentIndex,

          // ✅ Selected state
          selectedItemColor: Colors.white,
          selectedIconTheme: const IconThemeData(color: Colors.white, size: 30),
          selectedLabelStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),

          // ✅ Unselected state
          unselectedItemColor: Colors.white70,
          unselectedIconTheme: const IconThemeData(
            color: Colors.white70,
            size: 25,
          ),
          unselectedLabelStyle: const TextStyle(color: Colors.white70),

          // ✅ Navigation
          onTap: (index) {
            if (index != widget.currentIndex) {
              _controller.onItemTapped(context, index);
            }
          },

          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined),
              activeIcon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              activeIcon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
