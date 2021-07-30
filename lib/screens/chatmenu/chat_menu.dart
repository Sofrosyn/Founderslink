import 'package:floor/screens/chatmenu/components/chat_menu_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatMenuScreen extends StatefulWidget {
  static String routeName = "/chat_menu";
  @override
  _ChatMenuScreenState createState() => _ChatMenuScreenState();
}
class _ChatMenuScreenState extends State<ChatMenuScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ChatMenuBody(),
      // backgroundColor: AppColors.KappBackgroundColor
    );
  }
}
