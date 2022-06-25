import 'dart:ui';
import 'package:azlistview/azlistview.dart';
import 'package:breathe/Widgets/apps_list.dart';
import 'package:flutter/material.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';

class AllApps extends StatefulWidget {
  const AllApps({Key? key}) : super(key: key);

  @override
  State<AllApps> createState() => _AllAppsState();
}

class _AllAppsState extends State<AllApps> {
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
            child: const Center(child: AppsList())));
  }
}
