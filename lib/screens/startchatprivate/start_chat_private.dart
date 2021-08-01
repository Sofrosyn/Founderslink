import 'package:floor/constants/constants.dart';
import 'package:floor/screens/startchatprivate/components/start_chat_private_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartChatPrivateScreen extends StatefulWidget {
  static String routeName = "/start_chat_private";
  @override
  _StartChatPrivateScreenState createState() => _StartChatPrivateScreenState();
}
class _StartChatPrivateScreenState extends State<StartChatPrivateScreen> {
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
        actions: [
          Icon(
            Icons.calendar_today,
            color: AppColors.KblackColor,
            size: 18,
          ),
          Icon(
            Icons.more_vert,
            color: AppColors.KgrayColor,
            size: 18,
          ),
          Icon(
            Icons.notifications,
            color: AppColors.KblackColor,
            size: 18,
          ),
        ],
      ),
        body: StartChatPrivateBody(),
        // backgroundColor: AppColors.KappBackgroundColor
    );
  }
}
