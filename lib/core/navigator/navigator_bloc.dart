import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import 'navigator_event.dart';

class NavigatorBloc extends Bloc<NavigatorEvent, dynamic> {

  @override
  dynamic get initialState => 0;

  final GlobalKey<NavigatorState> navigatorKey;
  final BuildContext buildContext;
  NavigatorBloc({this.navigatorKey, this.buildContext});

  @override
  Stream<NavigatorState> mapEventToState(
      NavigatorEvent event,
      ) async* {
    // TODO: Add Logic
    if(event is Pop) navigatorKey.currentState.pop();


  }
}