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
        body: CreateChannelBody(),
        backgroundColor: AppColors.KappBackgroundColor
    );
  }
}
