import 'package:flutter/material.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:breathe/main.dart';

class ClockAndCalendar extends StatefulWidget {
  final bool isTimeWidget;
  final DateFormat timeFormat;
  final DateFormat dateFormat;
  const ClockAndCalendar(
      {Key? key,
      required this.isTimeWidget,
      required this.timeFormat,
      required this.dateFormat})
      : super(key: key);

  @override
  State<ClockAndCalendar> createState() => _ClockAndCalendarState();
}

class _ClockAndCalendarState extends State<ClockAndCalendar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: TimerBuilder.periodic(
          widget.isTimeWidget
              ? const Duration(seconds: 1)
              : const Duration(days: 1), builder: (context) {
        return Text(
          widget.isTimeWidget
              ? widget.timeFormat.format(DateTime.now()).toString()
              : widget.dateFormat.format(DateTime.now()),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        );
      }),
      onTap: () {
        String packageName = '';
        items.any((element) {
          if (element.package.contains('clock') &&
              widget.isTimeWidget == true) {
            packageName = element.package;
            return true;
          } else if (element.package.contains('calendar') &&
              widget.isTimeWidget == false) {
            packageName = element.package;
            return true;
          }
          return false;
        });
        widget.isTimeWidget
            ? InstalledApps.startApp(packageName)
            : InstalledApps.startApp(packageName);
      },
    );
  }
}
