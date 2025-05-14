import 'package:flutter/material.dart';
import 'package:tap_news/screen/categories_screen.dart';
import 'package:tap_news/screen/home_content.dart';
import 'package:tap_news/screen/liked_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  

  final List<Widget> screens = [
    HomeContentScreen(),
    CategoriesScreen(),
    LikedScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        iconSize: 25,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.list_outlined), label: ""),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            label: "",
          ),
        ],
      ),
      body: IndexedStack(index: _currentIndex, children: screens),
    );
  }
}
