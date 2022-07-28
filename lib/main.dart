import 'package:azlistview/azlistview.dart';
import 'package:breathe/Widgets/apps_list.dart';
import 'package:breathe/presentation%20layer/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:status_bar_control/status_bar_control.dart';

List<AZList> items = [];
bool isLoading = true;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StatusBarControl.setHidden(true, animation: StatusBarAnimation.SLIDE);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    systemNavigationBarColor: Colors.transparent,
    statusBarColor: Colors.transparent,
  ));

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
    var item = await InstalledApps.getInstalledApps();
    items = item
        .map((e) => AZList(
            title: e.name.toString(),
            tag: e.name![0].toString().toUpperCase(),
            package: e.packageName.toString()))
        .toList();

    SuspensionUtil.sortListBySuspensionTag(items);
    SuspensionUtil.setShowSuspensionStatus(items);
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
