import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


flutterToast(String message, bool isError){
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 2,
      backgroundColor: isError ? Colors.red : Colors.green,
      textColor: Colors.white,
      fontSize: 15.0

  );
}
