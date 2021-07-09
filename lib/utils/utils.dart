import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

mixin Utils {
  static bool isLightMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light;
  }

  static Uint8List convertFromBase64(String image) {
    return Base64Decoder().convert(image);
  }

  static Future<void> progressDialog(BuildContext context,
      {String message = ''}) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }

  static String formatDate(String date) =>
      DateFormat("d MMM hh:mm aaa").format(DateTime.parse(date));
  static String get fontFamilySFPro => 'SFProText';

  static double getSizedboxheightwithQuery(BuildContext context, double i) {
    // print(pow(MediaQuery.of(context).size.height / (30 + 30), 2) / 30);
    return pow(MediaQuery.of(context).size.height / (i + i), 2) / i;
  }

  static double blockHeight;
  static double blockWidth;
  static getPhoneQuery(BuildContext context) {
    if (MediaQuery.of(context).size.height <= 640) {
      blockHeight = MediaQuery.of(context).size.height / 80;
      blockWidth = MediaQuery.of(context).size.width / 80;
    } else if (MediaQuery.of(context).size.height <= 800) {
      blockHeight = MediaQuery.of(context).size.height / 93;
      blockWidth = MediaQuery.of(context).size.width / 93;
    } else {
      blockHeight = MediaQuery.of(context).size.height / 100;
      blockWidth = MediaQuery.of(context).size.width / 100;
    }
  }
}
