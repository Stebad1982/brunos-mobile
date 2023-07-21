import 'package:intl/intl.dart';

class DateTimeFormatter {

  static showDate(String dateTime){
    String tempDate = DateFormat.MMMMd().format(DateTime.parse(dateTime));
    return tempDate;
  }

  static showTime(String dateTime){
    String tempDate = DateFormat().add_jm().format(DateTime.parse(dateTime));
    return tempDate;
  }
}