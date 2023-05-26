import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zotfeast/models/recipe.dart';
import 'package:zotfeast/screens/home/recipe_screen.dart';

class RecipeListScreen extends StatefulWidget {
  const RecipeListScreen({super.key});

  @override
  State<RecipeListScreen> createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  @override
  Widget build(BuildContext context) {
    final recipes = Provider.of<List<Recipe>>(context);

    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                RecipeScreen(recipe: recipes[index]),
                SizedBox(height: 50.0),
              ],
            );
          },
        ));
  }
}
