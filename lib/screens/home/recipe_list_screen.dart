import 'package:flutter/material.dart';
import 'package:zotfeast/components/loading.dart';
import 'package:zotfeast/components/rounded_rectangle.dart';
import 'package:zotfeast/config/color_constants.dart';
import 'package:zotfeast/screens/home/home_screen.dart';
import 'package:zotfeast/screens/home/user_profile_screen.dart';
import 'package:zotfeast/screens/home/map_screen.dart';
import 'package:zotfeast/screens/home/recipe_screen.dart';

import 'package:provider/provider.dart';
import 'package:zotfeast/models/user.dart';
import 'package:zotfeast/services/database.dart';
import 'package:zotfeast/components/recipe_tile.dart';
import 'package:provider/provider.dart';
import 'package:zotfeast/models/recipe.dart';

class RecipeListScreen extends StatefulWidget {
  const RecipeListScreen({super.key});

  @override
  State<RecipeListScreen> createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  @override
  Widget build(BuildContext context) {
    final recipes = Provider.of<List<Recipe>>(context);
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Here Are\nYour Recipes!",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        SizedBox(height: 15),
        Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    RecipeTile(
                      recipe: recipes[index],
                      recipeName: recipes[index].name,
                      recipeImage: 'pasta.png',
                      recipePortion: recipes[index].servings,
                      recipeCalories: recipes[index].calories,
                    ),
                    SizedBox(height: 25.0),
                  ],
                );
              },
            )),
      ]),
    );
  }
}
