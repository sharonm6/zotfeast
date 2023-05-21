import 'package:flutter/material.dart';
import 'package:zotfeast/config/color_constants.dart';
import 'package:zotfeast/pages/home_screen.dart';
import 'package:zotfeast/pages/recipe_list_screen.dart';
import 'package:zotfeast/pages/user_profile_screen.dart';
import 'package:zotfeast/pages/map_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

// const Color(0xFFF8F2ED)
class _HomeState extends State<Home> {
  int navBarIdx = 0;
  final pages = [
    HomeScreen(),
    RecipeListScreen(),
    MapScreen(),
    UserProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.zotfeastBrownLight,
        bottomNavigationBar: SafeArea(
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: ColorConstants.zotfeastBrownDark,
            selectedItemColor: ColorConstants.zotfeastBrownLight,
            unselectedItemColor: ColorConstants.zotfeastBrownLight,
            currentIndex: navBarIdx,
            onTap: (int idx) {
              setState(() {
                navBarIdx = idx;
              });
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Recipes'),
              BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'User'),
            ],
          ),
        ),
        body: SingleChildScrollView(child: pages[navBarIdx]));
  }
}
