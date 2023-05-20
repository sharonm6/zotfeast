import 'package:flutter/material.dart';
import 'package:zotfeast/config/color_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// const Color(0xFFF8F2ED)
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.zotfeastBrownLight,
        bottomNavigationBar: SafeArea(
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: ColorConstants.zotfeastBrownDark,
            selectedItemColor: ColorConstants.zotfeastBrownLight,
            unselectedItemColor: ColorConstants.zotfeastBrownLight,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Recipes'),
              BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'User'),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Welcome, Alice!\nHere’s Your Overview\nOf Today",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              const SizedBox(height: 24.0),
              Text(
                "Upcoming Task",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                    color: const Color(0xFFD2C3B3),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                      child: Column(children: [
                        Text("Buy Groceries @ 10AM",
                            style: Theme.of(context).textTheme.titleLarge,
                            textAlign: TextAlign.center),
                        Row(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Container(
                                    color: ColorConstants.zotfeastBrownLight,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          14, 11, 14, 11),
                                      child: Text("More Info",
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: ColorConstants
                                                  .zotfeastBrownDark),
                                          textAlign: TextAlign.center),
                                    ))),
                            const SizedBox(width: 36.0),
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Container(
                                    color: const Color(0xFFF8F2ED),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          14, 11, 14, 11),
                                      child: Text("R | Y",
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: const Color(0xFFB5A599)),
                                          textAlign: TextAlign.center),
                                    )))
                          ],
                        )
                      ]),
                    )),
              ),
              const SizedBox(height: 46.0),
              Text(
                "Your Schedule Today",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                      color: ColorConstants.zotfeastBrown,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
                        child: Image.asset(
                          'example_schedule.png',
                          width: 278,
                          height: 236,
                        ),
                      )))
            ]),
          ),
        ));
  }
}
