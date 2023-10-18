import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:track_flow/feature_1/screens/authenticate/handler.dart';
import 'package:track_flow/feature_1/screens/home/home.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/SplashScreen';

  const SplashScreen({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkUser(context);
  }

  Future<void> checkUser(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));

    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      if (mounted) {
        Navigator.of(context).pushNamed(Handler.routeName);
      }
    } else {
      if (mounted) {
        Navigator.of(context).pushNamed(Home.routeName);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }

  Widget initWidget(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xffF5591F),
              gradient: LinearGradient(
                colors: [Color(0xffF5591F), Color(0xffF2861E)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: Image.asset("assets/images/app_logo.png"),
          ),
        ],
      ),
    );
  }
}
