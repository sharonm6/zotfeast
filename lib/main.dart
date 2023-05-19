import 'package:flutter/material.dart';
import 'package:zotfeast/pages/home_screen.dart';
import 'package:zotfeast/pages/recipe_list_screen.dart';
import 'package:zotfeast/pages/recipe_screen.dart';
import 'package:zotfeast/pages/user_profile_screen.dart';
import 'package:zotfeast/pages/map_screen.dart';

void main() => runApp(MaterialApp(initialRoute: '/', routes: {
      '/': (context) => HomeScreen(),
      '/home': (context) => HomeScreen(),
      '/map': (context) => MapScreen(),
      '/recipeList': (context) => RecipeListScreen(),
      '/recipeScreen': (context) => RecipeScreen(),
      '/userProfile': (context) => UserProfileScreen()
    }));
