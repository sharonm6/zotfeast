import 'package:flutter/material.dart';
import 'package:zotfeast/config/theme_data.dart';
import 'package:zotfeast/pages/home.dart';
// import 'package:zotfeast/pages/home_screen.dart';
// import 'package:zotfeast/pages/recipe_list_screen.dart';
// import 'package:zotfeast/pages/recipe_screen.dart';
// import 'package:zotfeast/pages/user_profile_screen.dart';
// import 'package:zotfeast/pages/map_screen.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        // '/home': (context) => const HomeScreen(),
        // '/map': (context) => const MapScreen(),
        // '/recipeList': (context) => const RecipeListScreen(),
        // '/recipeScreen': (context) => const RecipeScreen(),
        // '/userProfile': (context) => const UserProfileScreen()
      },
      theme: ThemeConfig.lightTheme,
      themeMode: ThemeMode.light,
    ));