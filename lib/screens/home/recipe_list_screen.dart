import 'package:flutter/material.dart';
import 'package:zotfeast/components/loading.dart';
import 'package:zotfeast/components/rounded_rectangle.dart';
import 'package:zotfeast/config/color_constants.dart';
import 'package:zotfeast/screens/home/home_screen.dart';
import 'package:zotfeast/screens/home/user_profile_screen.dart';
import 'package:zotfeast/screens/home/map_screen.dart';
import 'package:provider/provider.dart';
import 'package:zotfeast/models/user.dart';
import 'package:zotfeast/services/database.dart';
import 'package:zotfeast/components/recipe_tile.dart';

class RecipeListScreen extends StatefulWidget {
  const RecipeListScreen({super.key});

  @override
  State<RecipeListScreen> createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: FittedBox(
                fit: BoxFit.fitHeight,
                alignment: Alignment.centerLeft,
                child: Text(
                  'Here Are\nYour Recipes!',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Image.asset('food_motif.png'),
          ],
        ),
        RecipeTile(
          recipeName: 'Vodka Pasta',
          recipeImage: 'food_motif.png',
          recipePortion: '1 portion',
          recipeCalories: 600,
        ),
        // add spacing
        const SizedBox(height: 10),
        RecipeTile(
          recipeName: 'Vodka Pasta',
          recipeImage: 'food_motif.png',
          recipePortion: '1 portion',
          recipeCalories: 600,
        ),
        const SizedBox(height: 10),
        RecipeTile(
          recipeName: 'Vodka Pasta',
          recipeImage: 'food_motif.png',
          recipePortion: '1 portion',
          recipeCalories: 600,
        ),
      ]),
    );
  }
}
