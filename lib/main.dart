import 'package:breathe/presentation%20layer/routes/routes.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:status_bar_control/status_bar_control.dart';

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
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'SFUI'),
      onGenerateRoute: AppRoutes().generatedRoutes,
    );
  }
}
