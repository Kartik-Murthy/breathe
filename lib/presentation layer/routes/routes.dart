import 'package:breathe/presentation%20layer/screens/apps_list.dart';
import 'package:breathe/presentation%20layer/screens/home.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  Route generatedRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const Home());

      case '/appsList':
        return MaterialPageRoute(builder: (context) => const AppsList());

      default:
        return MaterialPageRoute(builder: (context) => const Home());
    }
  }
}
