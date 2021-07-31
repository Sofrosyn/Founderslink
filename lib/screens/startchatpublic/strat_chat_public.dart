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
          elevation: 0.0,
          backgroundColor: AppColors.KwhiteColor,
          leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 18,
            ),
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
              size: 22,
            ),
            Icon(
              Icons.more_vert,
              color: Colors.grey,
              size: 22,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                Icons.notifications,
                color: Colors.black,
                size: 22,
              ),
            ),
          ],
        ),
        body: StartChatPublicBody(),
        backgroundColor: AppColors.KappBackgroundColor
    );
  }
}
