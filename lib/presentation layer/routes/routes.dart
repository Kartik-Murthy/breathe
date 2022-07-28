import 'package:breathe/presentation%20layer/screens/apps_screen.dart';
import 'package:breathe/presentation%20layer/screens/home_screen.dart';
import 'package:breathe/presentation%20layer/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> generatedRoutes(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      case '/appsList':
        return MaterialPageRoute(
            builder: (context) => AppsScreen(argument: args));

      case '/settings':
        return MaterialPageRoute(builder: (context) => const SettingsScreen());

      default:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
    }
  }
}
