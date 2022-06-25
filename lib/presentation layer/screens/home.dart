import 'package:breathe/Widgets/clock_and_calendar_app.dart';
import 'package:breathe/presentation%20layer/screens/all_apps.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragEnd: ((details) {
        if (details.velocity.pixelsPerSecond.dy < -20) {
          Navigator.push(
              context,
              PageTransition(
                  child: const AllApps(),
                  type: PageTransitionType.bottomToTop));
        }
      }),
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClockAndCalendar(
                isTimeWidget: true,
                dateFormat: DateFormat.MMMEd(),
                timeFormat: DateFormat.jm(),
              ),
              ClockAndCalendar(
                isTimeWidget: false,
                dateFormat: DateFormat.MMMEd(),
                timeFormat: DateFormat.jm(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
