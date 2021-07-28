
import 'package:flutter/material.dart';
import 'package:founderslink/core/enum/View_state.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  String message = '';

  void setMessage(String value){
    message = value;
    notifyListeners();
  }

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
