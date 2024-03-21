import 'package:flutter/material.dart';
import '../../core/exceptions/route_exception.dart';
import '../home_page.dart';

class AppRouter {
  static const String sip = 'sip';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case sip:
        return MaterialPageRoute(
          builder: (_) => const HomePage(

          ),
        );

      default:
        throw const RouteException('Route not found!');
    }
  }
}