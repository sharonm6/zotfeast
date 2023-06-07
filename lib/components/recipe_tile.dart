import 'package:flutter/material.dart';
import 'package:zotfeast/config/color_constants.dart';
import 'package:zotfeast/components/rounded_rectangle.dart';

class RecipeTile extends StatelessWidget {
  final String recipeName;
  final String recipeImage;
  final int recipePortion;
  final int recipeCalories;

  const RecipeTile({
    this.recipeName = "Recipe Name",
    this.recipeImage = "food_motif.png",
    this.recipePortion = 0,
    this.recipeCalories = 0,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedRectangle(
        childWidget: Row(
      children: [
        Expanded(
          flex: 7,
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            // widthFactor: 0.7,
            child: Column(
              children: [
                Text(
                  recipeName,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  recipePortion.toString() + " servings",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                // recipe calories
                Text(
                  recipeCalories.toString() + " calories",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Image.asset(
            recipeImage,
            fit: BoxFit.contain,
          ),
        ),

        // fit: BoxFit.contain,
      ],
    ));
  }
}
