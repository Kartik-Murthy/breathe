import 'package:flutter/material.dart';

class Apps extends StatefulWidget {
  const Apps({Key? key}) : super(key: key);

  @override
  State<Apps> createState() => _AppsState();
}

class _AppsState extends State<Apps> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {},
      onTap: () {},
      child: const Text('data',
          style: TextStyle(fontSize: 32, color: Colors.white)),
    );
  }
}
