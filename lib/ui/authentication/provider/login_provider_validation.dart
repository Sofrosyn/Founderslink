import 'package:founderslink/core/extensions.dart';

import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  ValidationModel _email = ValidationModel(null, null);
  ValidationModel _password = ValidationModel(null, null);

  ValidationModel get email => _email;

  ValidationModel get password => _password;



  bool obscurePasswordText = false;

  void togglePasswordVisibility(){
    obscurePasswordText=!obscurePasswordText;
    notifyListeners();
  }


  String validateEmail(String val) {
    if (val.isValidEmail) {
      _email = ValidationModel(val, null);
    } else {
      _email = ValidationModel(null, 'Please enter a valid Email');
    }

    notifyListeners();
  }



  String validatePassword(String val) {
    if (val.length<5) {
      _password = ValidationModel(null, 'Invalid Password');

    } else {
      _password = ValidationModel(val, null);
    }

    notifyListeners();
  }






  bool get validate {
    if (_email?.value!=null &&
        _password?.value!=null) {
      return true;
    } else {
      return false;
    }
  }


}


//data class for our validation object
class ValidationModel {
  String value;
  String error;

  ValidationModel(this.value, this.error);
}