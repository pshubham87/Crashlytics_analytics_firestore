import 'package:flutter/material.dart';
import 'package:track_flow/feature_1/screens/login_screen.dart';
import 'package:track_flow/feature_1/screens/signup_screen.dart';
import 'package:track_flow/feature_1/screens/splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:track_flow/feature_2/screens/home.dart';
import 'package:track_flow/feature_3/models/screens/form_screen.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    String path = settings.name!;
    switch (path) {
      case Home.routeName:
        return PageTransition(
            child: const Home(),
            settings: settings,
            type: PageTransitionType.fade);
      case LoginScreen.routeName:
        return PageTransition(
            child: const LoginScreen(),
            settings: settings,
            type: PageTransitionType.rightToLeft);
      case SignUpScreen.routeName:
        return PageTransition(
            child: const SignUpScreen(),
            settings: settings,
            type: PageTransitionType.leftToRight);
      case FormScreen.routeName:
        return PageTransition(
            child: const FormScreen(),
            settings: settings,
            type: PageTransitionType.rightToLeft);

      default:
        return PageTransition(
            child: const SplashScreen(),
            settings: settings,
            type: PageTransitionType.fade);
    }
  }
}
