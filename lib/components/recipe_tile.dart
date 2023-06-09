import 'package:flutter/material.dart';
import 'package:zotfeast/config/color_constants.dart';
import 'package:zotfeast/components/rounded_rectangle.dart';
import 'package:zotfeast/models/user.dart';
import 'package:zotfeast/screens/home/recipe_screen.dart';
import 'package:zotfeast/models/recipe.dart';

class RecipeTile extends StatelessWidget {
  final Recipe recipe;
  final String recipeName;
  final String recipeImage;
  final int recipePortion;
  final int recipeCalories;
  final User user;

  const RecipeTile(
      {required this.recipe,
      required this.user,
      this.recipeName = "Recipe Name",
      this.recipeImage = "food_motif.png",
      this.recipePortion = 0,
      this.recipeCalories = 0});

  @override
  Widget build(BuildContext context) {
    dynamic textColor;
    print(recipe.name);
    print(recipe.rid);
    print(user.selectedRecipe);
    print('');
    print('');
    if (recipe.rid == user.selectedRecipe) {
      textColor = Color(0xFF7C924E);
    } else {
      textColor = Color(0xFFF8F2ED);
    }

    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RecipeScreen(
                      recipe: recipe,
                      user: user,
                    )),
          );
        },
        child: RoundedRectangle(
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
                      style: TextStyle(
                        fontSize: 23,
                        color: textColor,
                        //Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    Text(
                      recipePortion.toString() + " servings",
                      style: TextStyle(
                        fontSize: 20,
                        color: textColor,
                      ),
                    ),
                    // recipe calories
                    Text(
                      recipeCalories.toString() + " calories",
                      style: TextStyle(
                        fontSize: 20,
                        color: textColor,
                      ),
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
        )));
  }
}
