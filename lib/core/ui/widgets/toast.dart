import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

flutterToast(String message, bool isError) {
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 2,
      backgroundColor: isError ? Colors.red : Colors.green,
      textColor: Colors.white,
      fontSize: 15.0);
}

showCupertinoAlertDialog(
    {BuildContext context,
    String message,
    error = false,
    title = "Message",
    VoidCallback callback, String actionText="Ok"}) {
  showDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
            title: Column(
              children: <Widget>[
                Text(title),
                new Icon(
                  error ? Icons.error_outline : Icons.info,
                  color: error ? Colors.red : Colors.blue,
                ),
              ],
            ),
            content: Text(message ?? "Test"),
            actions: <Widget>[
              TextButton(
                  onPressed: (callback != null)
                      ? () {
                          callback();
                        }
                      : () {
                          Navigator.of(context).pop();
                        },
                  child: new Text(actionText))
            ],
          ));
}
