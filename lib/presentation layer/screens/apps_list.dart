import 'dart:ui';
import 'package:breathe/Widgets/apps.dart';
import 'package:flutter/material.dart';

class AppsList extends StatefulWidget {
  const AppsList({Key? key}) : super(key: key);

  @override
  State<AppsList> createState() => _AppsListState();
}

class _AppsListState extends State<AppsList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragEnd: ((details) {
        if (details.velocity.pixelsPerSecond.dy > 20) {
          Navigator.pop(context);
        }
      }),
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.3),
        body: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: const Center(
              child: Apps(),
            )),
      ),
    );
  }
}
