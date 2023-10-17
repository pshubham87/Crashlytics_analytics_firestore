// ignore_for_file: use_build_context_synchronously
import 'package:firebase_auth/firebase_auth.dart';
import 'package:track_flow/feature_1/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:track_flow/feature_2/screens/home.dart';

Future<bool> signup(BuildContext context, String email, String password) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registration successful. ')));

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Home()));

    return true;
  } catch (e) {
    if (e is FirebaseAuthException) {
      if (e.code == 'email-already-in-use') {
        showBottomMsg(
            context: context, msg: 'The email address is already in use.');
      } else {
        showBottomMsg(context: context, msg: '${e.message}');
      }
    } else {
      showBottomMsg(context: context, msg: '$e');
    }
    return false;
  }
}
