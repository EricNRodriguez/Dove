import 'package:flutter/material.dart';

Future<void> alertDialog(BuildContext context, {
    required String title,
    required String message,
  }) async {

  Widget okButton = TextButton(
    child: Text("Ok"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(message),
    actions: [
      okButton,
    ],
  );

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );

}