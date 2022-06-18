import 'package:breathe/presentation%20layer/screens/apps_list.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: GestureDetector(
          onVerticalDragEnd: ((details) {
            if (details.velocity.pixelsPerSecond.dy < -20) {
              Navigator.push(
                  context,
                  PageTransition(
                      child: const AppsList(),
                      type: PageTransitionType.bottomToTop));
            }
          }),
        ));
  }
}
