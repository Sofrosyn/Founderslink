
// We use name route
// All our routes will be available here
import 'package:floor/screens/chatlobby/chat_lobby.dart';
import 'package:floor/screens/chatmenu/chat_menu.dart';
import 'package:floor/screens/createchannel/create_channel.dart';
import 'package:floor/screens/frameone/frame_one.dart';
import 'package:floor/screens/home/home.dart';
import 'package:floor/screens/startchatprivate/start_chat_private.dart';
import 'package:floor/screens/startchatpublic/strat_chat_public.dart';
import 'package:floor/screens/userfilter/user_filter.dart';
import 'package:floor/screens/usersofficehours/users_office_hours.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  ChatLobbyScreen.routeName: (context) => ChatLobbyScreen(),
  CreateChannelScreen.routeName: (context) => CreateChannelScreen(),
  StartChatPublicScreen.routeName: (context) => StartChatPublicScreen(),
  FrameOneScreen.routeName: (context) => FrameOneScreen(),
  StartChatPrivateScreen.routeName: (context) => StartChatPrivateScreen(),
  UsersOfficeHoursScreen.routeName: (context) => UsersOfficeHoursScreen(),
  ChatMenuScreen.routeName: (context) => ChatMenuScreen(),
  UserFilterScreen.routeName: (context) => UserFilterScreen(),

};