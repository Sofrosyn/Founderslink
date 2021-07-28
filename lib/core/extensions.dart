import 'package:intl/intl.dart';

extension extString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName{
    final nameRegExp = new RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword{
    final passwordRegExp = new RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return passwordRegExp.hasMatch(this);
  }

  bool get isGoodPassword{
    final passwordRegExp = new RegExp(r'^(?=.*?[A-Za-z])(?=.*?[0-9]).{8,}$');
    return passwordRegExp.hasMatch(this);
  }


  bool get isNotNull{
    return this!=null;
  }


  bool get isValidPhone{
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }

//
//   extension formatDollarCurrency on String {
//   String get toDollarCurrency {
//     var format = new NumberFormat("#,###,###");
//     return "\$" + format.format(double.parse(this));
//   }
// }
}
