import 'package:floor/constants/constants.dart';
import 'package:floor/screens/chatlobby/components/chat_lobby_body.dart';
import 'package:floor/screens/publiclobby/components/public_lobby_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatLobbyScreen extends StatefulWidget {
  static String routeName = "/chat_lobby";
  @override
  _ChatLobbyScreenState createState() => _ChatLobbyScreenState();
}
class _ChatLobbyScreenState extends State<ChatLobbyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: ChatLobbyBody(),
        backgroundColor: AppColors.KgrayColor
    );
  }
}
