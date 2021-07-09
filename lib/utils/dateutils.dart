import 'package:intl/intl.dart';

class DateUtil{
  static String format(DateTime dateTime, {String format}){
    var formatter = new DateFormat(format != null ? format : "MMM d, yyyy");
    return formatter.format(dateTime);
  }


}