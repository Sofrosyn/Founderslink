import 'package:founderslink/core/extensions.dart';

import 'package:flutter/material.dart';

class SignUpFormProvider extends ChangeNotifier {
  ValidationModel _email = ValidationModel(null, null);
  ValidationModel _password = ValidationModel(null, null);
  ValidationModel _phone = ValidationModel(null, null);
  ValidationModel _fname = ValidationModel(null, null);
  ValidationModel _lName = ValidationModel(null, null);
  ValidationModel _confirmPassword = ValidationModel(null, null);

  ValidationModel get email => _email;

  ValidationModel get password => _password;

  ValidationModel get phone => _phone;

  ValidationModel get fName => _fname;

  ValidationModel get lName => _lName;


  bool obscurePasswordText = false;

  void togglePasswordVisibility(){
    obscurePasswordText=!obscurePasswordText;
    notifyListeners();
  }


  ValidationModel get confirmPassword => _confirmPassword;




  String validateEmail(String val) {
    if (val.isValidEmail) {
      _email = ValidationModel(val, null);
    } else {
      _email = ValidationModel(null, 'Please enter a valid Email');
    }

    notifyListeners();
  }
  String validateFName(String val) {
    if (val.isNotEmpty!=null&& val.length>2) {
      _fname = ValidationModel(val, null);
    } else {
      _fname = ValidationModel(null, 'Please enter a valid First Name');
    }

    notifyListeners();
  }


  String validatePassword(String val) {
    if (val.isGoodPassword) {
      _password = ValidationModel(val, null);
    } else {
      _password = ValidationModel(null, 'Password must contain some letters, and a number');
    }

    notifyListeners();
  }


  String validateConfirmPassword(String val) {
    if (val==_password.value) {
      _confirmPassword = ValidationModel(val, null);
    } else {
      _confirmPassword = ValidationModel(null, 'Passwords do not match');
    }

    notifyListeners();
  }

  String validateLName(String val) {
    if  (val.isNotEmpty!=null&& val.length>2) {
      _lName = ValidationModel(val, null);
    } else {
      _lName = ValidationModel(null, 'Please enter a valid Last Name');
    }

    notifyListeners();
  }

  String validatePhone(String val) {
    if (val.isValidPhone) {
      _phone = ValidationModel(val, null);
    } else {
      _phone = ValidationModel(null, 'Phone Number must be up to 11 digits');
    }
    notifyListeners();
  }

  bool get validate {
    if (_email.value!=null &&
        _password.value!=null &&
        _confirmPassword.value!=null&&
        _fname.value!=null &&
        _lName.value!=null) {
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