import 'package:flutter/material.dart';
import 'package:zotfeast/components/loading.dart';
import 'package:zotfeast/config/color_constants.dart';
import 'package:zotfeast/screens/home/home_screen.dart';
import 'package:zotfeast/screens/home/recipe_list_screen.dart';
import 'package:zotfeast/screens/home/user_profile_screen.dart';
import 'package:zotfeast/screens/home/map_screen.dart';
import 'package:provider/provider.dart';
import 'package:zotfeast/models/user.dart';
import 'package:zotfeast/services/database.dart';

class Home extends StatefulWidget {
  Home({super.key, required this.user, required this.databaseService});
  final User user;
  final DatabaseService databaseService;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int navBarIdx = 0;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
        stream: widget.databaseService.user,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            User userInfo = snapshot.data!;
            List<Widget> pages = [
              HomeScreen(user: userInfo),
              const RecipeListScreen(),
              const MapScreen(),
              UserProfileScreen(user: userInfo),
            ];
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
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home), label: 'Home'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.list), label: 'Recipes'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.map), label: 'Map'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.person), label: 'User'),
                    ],
                  ),
                ),
                body: SingleChildScrollView(child: pages[navBarIdx]));
          } else {
            return Scaffold(
              backgroundColor: ColorConstants.zotfeastBrownLight,
              body: Center(
                child: Loading(),
              ),
            );
          }
        });
  }
}
