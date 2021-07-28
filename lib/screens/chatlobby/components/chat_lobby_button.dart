import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatLobbyButton extends StatelessWidget {
  ChatLobbyButton({this.text, this.btnClr});

  final String text;
  final int btnClr;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 30,
      color: Color(btnClr),
      onPressed: () {},
      child: Text(text ,style: TextStyle(color: Colors.white,fontSize: 15),),
    );
  }
}