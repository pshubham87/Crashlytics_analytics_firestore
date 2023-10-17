import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:track_flow/feature_1/widgets/toast.dart';

Future<bool> signIn(BuildContext context, String email, String password) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  } catch (e) {
    if (e is FirebaseAuthException) {
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        showBottomMsg(context: context, msg: "Invalid Username Or Password");
      } else {
        showBottomMsg(context: context, msg: '${e.message}');
      }
    } else {
      showBottomMsg(context: context, msg: '$e');
    }
  }
  return false;
}
