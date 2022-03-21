import 'package:flutter/material.dart';
class HomeScreenApp extends StatefulWidget {
  const HomeScreenApp(this.appName);
  final String appName;

  @override
  State<HomeScreenApp> createState() => _HomeScreenAppState();
}

class _HomeScreenAppState extends State<HomeScreenApp> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text(widget.appName,style: TextStyle(color: Colors.white,fontSize: 25),),
        ),
        SizedBox(height: 25,)
      ],
    );
  }
}