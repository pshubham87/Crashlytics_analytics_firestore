import 'package:flutter/material.dart';

class CommonDialog extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;

  const CommonDialog(
      {super.key,
      required this.title,
      required this.message,
      required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: Text(message),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(buttonText),
          ),
        ],
      ),
    );
  }
}
