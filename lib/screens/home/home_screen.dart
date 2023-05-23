import 'package:flutter/material.dart';
import 'package:zotfeast/config/color_constants.dart';
import 'package:zotfeast/components/rounded_rectangle.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int navBarIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
        RoundedRectangle(
          borderRadiusAmt: 10.0,
          containerColor: ColorConstants.zotfeastBrown,
          paddingInset: const EdgeInsets.fromLTRB(40, 20, 40, 20),
          childWidget: Column(children: [
            Text("Buy Groceries @ 10AM",
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center),
            Row(
              children: [
                RoundedRectangle(
                  borderRadiusAmt: 10.0,
                  containerColor: ColorConstants.zotfeastBrownLight,
                  paddingInset: const EdgeInsets.fromLTRB(14, 11, 14, 11),
                  childWidget: Text("More Info",
                      style: TextStyle(
                          fontSize: 15.0,
                          color: ColorConstants.zotfeastBrownDark),
                      textAlign: TextAlign.center),
                ),
                const SizedBox(width: 36.0),
                RoundedRectangle(
                    borderRadiusAmt: 10.0,
                    containerColor: ColorConstants.zotfeastBrownLight,
                    paddingInset: const EdgeInsets.fromLTRB(14, 11, 14, 11),
                    childWidget: Text("R | Y",
                        style: TextStyle(
                            fontSize: 15.0,
                            color: ColorConstants.zotfeastBrownDark),
                        textAlign: TextAlign.center)),
              ],
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
