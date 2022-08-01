import 'package:breathe/Widgets/battery.dart';
import 'package:breathe/Widgets/clock_and_calendar_app.dart';
import 'package:breathe/Widgets/home_screen_apps.dart';
import 'package:breathe/main.dart';
import 'package:breathe/presentation%20layer/screens/apps_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:status_bar_control/status_bar_control.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map settings = {};
  var appCount = 3;
  var autoShowKeyboard = 'On';
  var appAlignment = 'Left';
  var showStatus = 'Off';
  var showDateTime = 'On';
  var showBattery = 'On';
  List<dynamic> leftGestureValue = ['Camera', null];
  List<dynamic> rightGestureValue = ['Contacts and dialer', null];

  @override
  void initState() {
    statusBar();
    super.initState();
  }

  void statusBar() async {
    await StatusBarControl.setHidden(true, animation: StatusBarAnimation.NONE);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: GestureDetector(
        onVerticalDragEnd: ((details) {
          if (details.velocity.pixelsPerSecond.dy < -20) {
            Navigator.push(
                context,
                PageTransition(
                    child: AppsScreen(
                      argument: autoShowKeyboard,
                    ),
                    type: PageTransitionType.bottomToTop));
          }
        }),
        onLongPress: () async {
          final data =
              await Navigator.pushNamed(context, '/settings', arguments: {
            'appCount': appCount,
            'autoShowKeyboard': autoShowKeyboard,
            'appAlignment': appAlignment,
            'showStatus': showStatus,
            'showDateTime': showDateTime,
            'leftGestureValue': leftGestureValue,
            'rightGestureValue': rightGestureValue,
            'showBattery': showBattery
          });
          setState(() {
            settings = data as Map;
            if (settings.isNotEmpty) {
              appCount = settings['appCount'] ?? appCount;
              autoShowKeyboard =
                  settings['autoShowKeyboard'] ?? autoShowKeyboard;
              appAlignment = settings['appAlignment'] ?? appAlignment;
              showStatus = settings['showStatus'] ?? showStatus;
              showDateTime = settings['showDateTime'] ?? showDateTime;
              leftGestureValue =
                  settings['leftGestureValue'] ?? leftGestureValue;
              rightGestureValue =
                  settings['rightGestureValue'] ?? rightGestureValue;
              showBattery = settings['showBattery'] ?? showBattery;
            }
          });
        },
        onHorizontalDragEnd: ((details) async {
          if (details.velocity.pixelsPerSecond.dx < -20) {
            if (leftGestureValue[0].toString() == 'Camera') {
              String packageName = '';
              listItems.any((element) {
                if (element.package.contains('camera')) {
                  packageName = element.package;
                  return true;
                }
                return false;
              });

              InstalledApps.startApp(packageName);
            } else {
              InstalledApps.startApp(leftGestureValue[1].toString());
            }
          }
          if (details.velocity.pixelsPerSecond.dx > 20) {
            if (rightGestureValue[0].toString() == 'Contacts and dialer') {
              String packageName = '';
              listItems.any((element) {
                if (element.package.contains('call')) {
                  packageName = element.package;
                  return true;
                } else if (element.package.contains('contacts')) {
                  packageName = element.package;
                  return true;
                }
                return false;
              });

              InstalledApps.startApp(packageName);
            } else {
              InstalledApps.startApp(rightGestureValue[1].toString());
            }
          }
        }),
        child: Scaffold(
          appBar: AppBar(backgroundColor: Colors.transparent),
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(18),
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: appAlignment == 'Left'
                    ? CrossAxisAlignment.start
                    : appAlignment == 'Center'
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.end,
                children: [
                  ClockAndCalendar(
                    isVisible: (showDateTime == 'On') ? true : false,
                    isTimeWidget: true,
                    dateFormat: DateFormat.MMMEd(),
                    timeFormat: DateFormat.jm(),
                  ),
                  ClockAndCalendar(
                    isVisible: (showDateTime == 'On') ? true : false,
                    isTimeWidget: false,
                    dateFormat: DateFormat.MMMEd(),
                    timeFormat: DateFormat.jm(),
                  ),
                  showBattery.toString() == 'On'
                      ? BatteryInfo(
                          appAlignment: appAlignment.toString(),
                        )
                      : Container(),
                  const SizedBox(height: 140),
                  for (int i = 0; i < appCount; i++) const HomeScreenApps(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
