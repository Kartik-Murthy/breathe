import 'package:azlistview/azlistview.dart';
import 'package:breathe/Widgets/apps_list.dart';
import 'package:breathe/presentation%20layer/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:installed_apps/app_info.dart';

import 'package:installed_apps/installed_apps.dart';

List<AZList> listItems = [];

List<AppInfo> installedItems = [];

bool isLoading = true;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    getApps();
    super.initState();
  }

  getApps() async {
    installedItems = await InstalledApps.getInstalledApps();

    listItems = installedItems
        .map((e) => AZList(
            title: e.name.toString(),
            tag: e.name![0].toString().toUpperCase(),
            package: e.packageName.toString()))
        .toList();

    SuspensionUtil.sortListBySuspensionTag(listItems);
    SuspensionUtil.setShowSuspensionStatus(listItems);

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'SFUI'),
      onGenerateRoute: AppRoutes.generatedRoutes,
    );
  }
}
