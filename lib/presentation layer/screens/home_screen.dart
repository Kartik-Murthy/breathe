import 'package:battery_plus/battery_plus.dart';
import 'package:breathe/Widgets/battery.dart';
import 'package:breathe/Widgets/clock_and_calendar_app.dart';
import 'package:breathe/Widgets/home_screen_apps.dart';
import 'package:breathe/presentation%20layer/screens/apps_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var appCount = 3;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragEnd: ((details) {
        if (details.velocity.pixelsPerSecond.dy < -20) {
          Navigator.push(
              context,
              PageTransition(
                  child: const AppsScreen(),
                  type: PageTransitionType.bottomToTop));
        }
      }),
      onLongPress: () async {
        final data = await Navigator.pushNamed(context, '/settings');
        setState(() {
          if (data != null) {
            appCount = data as int;
            print(appCount);
          }
        });
      },
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
              ),
              const BatteryInfo(),
              const SizedBox(height: 180),
              for (int i = 0; i < appCount; i++) const HomeScreenApps(),
            ],
          ),
        ),
      ),
    );
  }
}
