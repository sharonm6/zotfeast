import 'package:flutter/material.dart';
import 'package:zotfeast/models/recipe.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({Key? key, required Recipe recipe})
      : _recipe = recipe,
        super(key: key);

  final Recipe _recipe;

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[400],
            backgroundImage: AssetImage('assets/pasta.png'),
          ),
          title: Text(widget._recipe.name),
          subtitle: Text(
            '${widget._recipe.servings} servings\n'
            '${widget._recipe.calories} kcals\n'
            'INGREDIENTS\n'
            '${widget._recipe.ingredients}\n'
            'INSTRUCTIONS\n'
            '${widget._recipe.instructions}\n',
          ),
        ),
      ),
    );
  }
}
