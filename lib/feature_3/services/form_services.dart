import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:track_flow/feature_1/widgets/toast.dart';

formScreen(BuildContext context, String amountFrom, String amountTo,
    String amountController, String userId, String timestamp) async {
  try {
    var amount = double.parse(amountController.toString());

    CollectionReference userCollRef =
        FirebaseFirestore.instance.collection('client');
    await userCollRef.add({
      "From Account": amountFrom,
      'To Account': amountTo,
      'Amount': "20",
      'userId': userId.toString(),
      'timestamp': timestamp.toString(),
    });

    return true;
  } catch (e, stackTrace) {
    FirebaseCrashlytics.instance.recordError(e, stackTrace);
    FirebaseCrashlytics.instance.crash();
    showBottomMsg(
      context: context,
      msg: "Invalid amount entered: $amountController",
    );

    return false;
  }
}
