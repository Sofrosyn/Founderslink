import 'package:floor/constants/constants.dart';
import 'package:floor/screens/createchannel/components/create_channel_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateChannelScreen extends StatefulWidget {
  static String routeName = "/create_channel";
  @override
  _CreateChannelScreenState createState() => _CreateChannelScreenState();
}
class _CreateChannelScreenState extends State<CreateChannelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: AppColors.KwhiteColor,
          leading: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.KblackColor,
                  size: 18,
                ),
              ),
              Icon(
                Icons.message,
                color: AppColors.KblackColor,
                size: 18,
              ),
            ],
          ),
          actions: [
            Icon(
              Icons.calendar_today,
              color: AppColors.KblackColor,
              size: 22,
            ),
            Icon(
              Icons.more_vert,
              color: AppColors.KgrayColor,
              size: 22,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                Icons.notifications,
                color: AppColors.KblackColor,
                size: 22,
              ),
            ),
          ],
        ),
        body: CreateChannelBody(),
        backgroundColor: AppColors.KappBackgroundColor
    );
  }
}
