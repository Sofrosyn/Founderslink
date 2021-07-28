import 'package:floor/constants/constants.dart';
import 'package:floor/screens/publiclobby/components/public_lobby_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PublicLobbyScreen extends StatefulWidget {
  static String routeName = "/public_lobby";
  @override
  _PublicLobbyScreenState createState() => _PublicLobbyScreenState();
}
class _PublicLobbyScreenState extends State<PublicLobbyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: PublicLobbyBody(),
        backgroundColor: AppColors.KappBackgroundColor
    );
  }
}
