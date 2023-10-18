import 'package:flutter/material.dart';
import 'package:track_flow/feature_1/screens/authenticate/login.dart';
import 'package:track_flow/feature_1/screens/authenticate/register.dart';

class Handler extends StatefulWidget {
  static const String routeName = '/Handler';

  const Handler({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Handler();
  }
}

class _Handler extends State<Handler> {
  bool showSignin = true;

  void toggleView() {
    setState(() {
      showSignin = !showSignin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignin) {
      return const Login();
    } else {
      return const Register();
    }
  }
}
