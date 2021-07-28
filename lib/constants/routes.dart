
// We use name route
// All our routes will be available here
import 'package:floor/screens/createchannel/create_channel.dart';
import 'package:floor/screens/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  CreateChannelScreen.routeName: (context) => CreateChannelScreen(),




};