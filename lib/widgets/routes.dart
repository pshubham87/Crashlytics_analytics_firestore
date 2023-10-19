import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:track_flow/feature_1/screens/authenticate/register.dart';
import 'package:track_flow/feature_1/screens/authenticate/splash_screen.dart';
import 'package:track_flow/feature_1/screens/home/home.dart';
import 'package:track_flow/feature_2/screens/form_screen.dart';
import 'package:track_flow/feature_1/screens/authenticate/login.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    String path = settings.name!;
    switch (path) {
      case Home.routeName:
        return PageTransition(
            child: const Home(),
            settings: settings,
            type: PageTransitionType.fade);
      case Login.routeName:
        return PageTransition(
            child: const Login(),
            settings: settings,
            type: PageTransitionType.rightToLeft);
      case Register.routeName:
        return PageTransition(
            child: const Register(),
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
