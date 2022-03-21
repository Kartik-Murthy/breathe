import 'package:flutter/material.dart';

class AppLongPress extends StatefulWidget {
  final handler;
  Widget textWidget;
  bool isLongPressed;
  AppLongPress(
      {Key? key,
      required this.textWidget,
      this.isLongPressed = false,
      this.handler})
      : super(key: key);

  @override
  State<AppLongPress> createState() => _AppLongPressState();
}

class _AppLongPressState extends State<AppLongPress> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onLongPress: () {
          setState(() {
            widget.isLongPressed = true;
            widget.handler(true);
          });
        },
        child: widget.isLongPressed ? Text('data') : widget.textWidget);
  }
}
