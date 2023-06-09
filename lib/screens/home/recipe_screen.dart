import 'package:flutter/material.dart';
import 'package:zotfeast/models/recipe.dart';
import 'package:zotfeast/models/user.dart';
import 'package:zotfeast/screens/home/recipe_screen.dart';
import 'package:provider/provider.dart';
import 'package:zotfeast/config/color_constants.dart';
import '../../services/database.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({Key? key, required Recipe recipe, required User user})
      : _recipe = recipe,
        _user = user,
        super(key: key);

  final Recipe _recipe;
  final User _user;

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  @override
  Widget build(BuildContext context) {
    final recipes = Provider.of<List<Recipe>>(context);
    return Scaffold(
        backgroundColor: ColorConstants.zotfeastBrownLight,
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Card(
            margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 20.0),
            child: ListTile(
                leading: CircleAvatar(
                  radius: 25.0,
                  backgroundColor: Colors.brown[400],
                  backgroundImage: AssetImage('assets/pasta.png'),
                ),
                title: Text(
                  widget._recipe.name,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color(0xFFF8F2ED),
                  ),
                ),
                subtitle: Column(
                  children: [
                    Text(
                      '${widget._recipe.servings} servings\n'
                      '${widget._recipe.calories} kcals\n'
                      'INGREDIENTS\n'
                      '${widget._recipe.ingredients}\n'
                      'INSTRUCTIONS\n'
                      '${widget._recipe.instructions}\n',
                    ),
                    SizedBox(height: 10),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      TextButton(
                          child: Text(
                            'Go back',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Color(0xFFF8F2ED),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      SizedBox(width: 10),
                      TextButton(
                          child: Text(
                            'Select Recipe',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Color(0xFFF8F2ED),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          onPressed: () {
                            DatabaseService(uid: widget._user.uid)
                                .updateUserData(
                              widget._user.name,
                              widget._user.email,
                              hasCar: widget._user.hasCar,
                              isDarkMode: widget._user.isDarkMode,
                              cookiesSaved: widget._user.cookiesSaved,
                              localStorageSaved: widget._user.localStorageSaved,
                              geolocationEnabled:
                                  widget._user.geolocationEnabled,
                              isVegetarian: widget._user.isVegetarian,
                              isVegan: widget._user.isVegan,
                              selectedRecipe: widget._recipe.rid,
                              schedule: widget._user.schedule,
                              task: widget._user.task,
                            );
                            Navigator.pop(context);
                          })
                    ])
                  ],
                )),
          ),
        ));
  }
}
