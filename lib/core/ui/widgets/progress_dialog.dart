import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> progressDialog(BuildContext context, {String message = ''}){
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) => Center(
      child:   CupertinoActivityIndicator(),
    ),
  );
}
