import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:track_flow/widgets/toast.dart';

formScreen(BuildContext context, String amountFrom, String amountTo,
    String amountController, String userId, String timestamp) async {
  try {
    double amount = double.parse(amountController.toString());

    CollectionReference userCollRef =
        FirebaseFirestore.instance.collection('client');

    await userCollRef.add({
      "From Account": amountFrom,
      'To Account': amountTo,
      'Amount': amount,
      'userId': userId.toString(),
      'timestamp': timestamp.toString(),
    });
    return true;
  } catch (e) {
    FirebaseCrashlytics.instance.recordError(e, StackTrace.current);
    showBottomMsg(
      context: context,
      msg: "Invalid amount entered: $amountController",
    );
  }
  return false;
}
