// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';

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
  List<AppInfo> apps = [];
  @override
  void initState() {
    getAllApps();
    super.initState();
  }

  getAllApps() async {
    apps = await InstalledApps.getInstalledApps();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black.withOpacity(0.3),
        body: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Center(
                child: AppsList(
              homeAppSelection: widget.argument,
            ))));
  }
}
