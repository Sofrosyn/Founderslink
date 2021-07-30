import 'package:floor/constants/constants.dart';
import 'package:floor/screens/startchatpublic/components/start_chat_public_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartChatPublicScreen extends StatefulWidget {
  static String routeName = "/start_chat_public";
  @override
  _StartChatPublicScreenState createState() => _StartChatPublicScreenState();
}
class _StartChatPublicScreenState extends State<StartChatPublicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 18,
          ),
          title: Text(
            'Start Public Lobby',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          titleSpacing: 0,
          actions: [
            Icon(
              Icons.calendar_today,
              color: Colors.black,
              size: 18,
            ),
            Icon(
              Icons.more_vert,
              color: Colors.pink[300],
              size: 18,
            ),
            Icon(
              Icons.notifications,
              color: Colors.black,
              size: 18,
            ),
          ],
        ),
        body: StartChatPublicBody(),
        backgroundColor: AppColors.KappBackgroundColor
    );
  }
}
