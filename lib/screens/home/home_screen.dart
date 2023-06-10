import 'package:flutter/material.dart';
import 'package:zotfeast/config/color_constants.dart';
import 'package:zotfeast/components/rounded_rectangle.dart';
import 'package:zotfeast/models/user.dart';
import 'package:zotfeast/screens/home/recipe_screen.dart';
import 'package:provider/provider.dart';
import 'package:zotfeast/models/recipe.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:intl/intl.dart';
import 'package:zotfeast/services/database.dart';

String getTimeFromIndex(int index) {
  int hour = 8 + (index ~/ 2);
  int minute = (index % 2) * 30;
  return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
}

List<Widget> buildTimeSlots(List<int> schedule) {
  List<Widget> timeSlots = [];

  for (int i = 0; i < schedule.length; i++) {
    Color slotColor = schedule[i] == 1
        ? const Color.fromARGB(255, 172, 197, 143)
        : Colors.transparent;
    String time = getTimeFromIndex(i);

    timeSlots.add(Row(children: [
      Expanded(
        child: Container(
          width: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: slotColor,
          ),
          child: Center(
            child: Text(
              time,
              style: TextStyle(
                color: Colors.white,
                //fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    ]));
  }
  return timeSlots;
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required User user, required DatabaseService dbService})
      : _user = user,
        _dbService = dbService,
        super(key: key);

  final User _user;
  final DatabaseService _dbService;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late User _user;
  late DatabaseService _dbService;
  @override
  void initState() {
    _user = widget._user;
    _dbService = widget._dbService;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final recipes = Provider.of<List<Recipe>>(context);
    final List<int> schedule = _user.schedule.split('').map(int.parse).toList();
    final startTime = TimeOfDay(hour: 8, minute: 0);
    final interval = const Duration(minutes: 30);

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
                      onPressed: () async {
                        if (_user.selectedRecipe == '') {
                          return;
                        }
                        Recipe recipe = await widget._dbService
                            .getRecipeFromId(_user.selectedRecipe);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                RecipeScreen(recipe: recipe, user: _user),
                          ),
                        );
                      },
                    ),
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
        const SizedBox(height: 30.0),
        Text(
          "Your Schedule Today",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(height: 3.0),
        Text(
          'Today\'s Date: ${DateFormat('yyyy-MM-dd').format(DateTime.now())}',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5.0),
        Container(
          width: 110,
          height: 240,
          child: RoundedRectangle(
            borderRadiusAmt: 10.0,
            containerColor: ColorConstants.zotfeastBrown,
            paddingInset: const EdgeInsets.fromLTRB(25, 15, 25, 15),
            childWidget: GridView.count(
              crossAxisCount: 1,
              children: buildTimeSlots(schedule),
            ),
          ),
        ),
      ]),
    );
  }
}
