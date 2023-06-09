import 'package:flutter/material.dart';
import 'package:zotfeast/config/color_constants.dart';
import 'package:zotfeast/components/rounded_rectangle.dart';
import 'package:zotfeast/models/user.dart';
import 'package:zotfeast/screens/home/recipe_screen.dart';
import 'package:provider/provider.dart';
import 'package:zotfeast/models/recipe.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late User _user;
  @override
  void initState() {
    _user = widget._user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final recipes = Provider.of<List<Recipe>>(context);
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Welcome, ${_user.name}!\nHere’s Your Overview\nOf Today",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const SizedBox(height: 24.0),
        Text(
          "Upcoming Task",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(height: 10),
        RoundedRectangle(
          borderRadiusAmt: 10.0,
          containerColor: ColorConstants.zotfeastBrown,
          paddingInset: const EdgeInsets.fromLTRB(40, 20, 40, 20),
          childWidget: Column(children: [
            Text(
              "Buy Groceries @ 10AM",
              style: TextStyle(fontSize: 23.0, color: Color(0xFF7C924E)),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundedRectangle(
                    borderRadiusAmt: 10.0,
                    containerColor: ColorConstants.zotfeastBrownLight,
                    paddingInset: const EdgeInsets.fromLTRB(14, 11, 14, 11),
                    childWidget: TextButton(
                        child: Text(
                          'More Info',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: ColorConstants.zotfeastBrownDark,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () async => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RecipeScreen(
                                        recipe: recipes[0], user: _user)),
                              )
                            }),
                  ),
                  const SizedBox(width: 36.0),
                  RoundedRectangle(
                      borderRadiusAmt: 10.0,
                      containerColor: ColorConstants.zotfeastBrownLight,
                      paddingInset: const EdgeInsets.fromLTRB(14, 11, 14, 11),
                      childWidget: Row(children: [
                        InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.refresh,
                            size: 23,
                            color: Color(0xFFD2C3B3),
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          '|',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: ColorConstants.zotfeastBrownDark,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(width: 8.0),
                        InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.check,
                            size: 23,
                            color: Color(0xFFD2C3B3),
                          ),
                        ),
                      ])),
                ],
              ),
            )
          ]),
        ),
        const SizedBox(height: 46.0),
        Text(
          "Your Schedule Today",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        RoundedRectangle(
          borderRadiusAmt: 10.0,
          containerColor: ColorConstants.zotfeastBrown,
          paddingInset: const EdgeInsets.fromLTRB(25, 15, 25, 15),
          childWidget: Image.asset(
            'example_schedule.png',
            width: 278,
            height: 236,
          ),
        )
      ]),
    );
  }
}
