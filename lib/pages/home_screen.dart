import 'package:flutter/material.dart';

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
        backgroundColor: const Color(0xFFF8F2ED),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Welcome, Alice!\nHere’s your overview\nof today",
                style: TextStyle(fontSize: 32.0, color: Colors.black),
              ),
            ),
            SizedBox(height: 24.0),
            Text(
              "Upcoming Task",
              style: TextStyle(fontSize: 23.0, color: Colors.black),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                  color: const Color(0xFFD2C3B3),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                    child: Column(children: [
                      Text("Buy Groceries @ 10AM",
                          style: TextStyle(fontSize: 23.0, color: Colors.black),
                          textAlign: TextAlign.center),
                      Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Container(
                                  color: const Color(0xFFF8F2ED),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        14, 11, 14, 11),
                                    child: Text("More Info",
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: const Color(0xFFB5A599)),
                                        textAlign: TextAlign.center),
                                  ))),
                          SizedBox(width: 36.0),
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
            SizedBox(height: 46.0),
            Text(
              "Your Schedule Today",
              style: TextStyle(fontSize: 23.0, color: Colors.black),
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                    color: const Color(0xFFD2C3B3),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
                      child: Image.asset(
                        'example_schedule.png',
                        width: 278,
                        height: 236,
                      ),
                    )))
          ]),
        ));
  }
}
