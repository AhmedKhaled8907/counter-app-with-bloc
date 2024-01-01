import 'package:flutter/material.dart';

import 'package:counter_app/presentation/screens/home_screen.dart';
import 'package:counter_app/presentation/screens/second_screen.dart';
import 'package:counter_app/presentation/screens/third_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(
            color: Colors.blueAccent,
          ),
        );

      case '/second':
        return MaterialPageRoute(
          builder: (context) => const SecondScreen(
            color: Colors.red,
          ),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (context) => const ThirdScreen(
            color: Colors.green,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('Page not found'),
            ),
          ),
        );
    }
  }
}
