// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:breathe/Widgets/apps_list.dart';

class AppsScreen extends StatefulWidget {
  final Object? argument;
  const AppsScreen({
    Key? key,
    this.argument,
  }) : super(key: key);

  @override
  State<AppsScreen> createState() => _AppsScreenState();
}

class _AppsScreenState extends State<AppsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black.withOpacity(0.4),
        body: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
            child: Center(
                child: AppsList(
              argumentReceived: widget.argument,
            ))));
  }
}
