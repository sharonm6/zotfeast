import 'package:flutter/material.dart';
import 'package:zotfeast/models/recipe.dart';
import 'package:zotfeast/screens/home/recipe_screen.dart';
import 'package:provider/provider.dart';

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
  final recipes = Provider.of<List<Recipe>>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 300.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[400],
            backgroundImage: AssetImage('assets/pasta.png'),
          ),
          title: Text(widget._recipe.name,
          style: TextStyle(fontSize:20.0,
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
          SizedBox(height:10),
          TextButton(
            child: 
            Text(
              'Go back',
            style: TextStyle(fontSize: 15.0,
            color: Color(0xFFF8F2ED),
          ),
          textAlign: TextAlign.center,
          ),
          onPressed: () {
                  Navigator.pop(
                    context,
                    MaterialPageRoute(builder: (context) => RecipeScreen(recipe: recipes[0],)),
                  );
                }
              ),
            ],
          )
        ),
      ),
    );
  }
}
