import 'package:intl/intl.dart';

class DateTimeUtils {
  static String getYearString(String dateTime) {
    return DateFormat("yyyy")
        .format(DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateTime));
  }

  static String getHourMintsFromDateString(String dateTime) {
    return DateFormat("HH:mm")
        .format(DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(dateTime));
  }

  static String getYearMonthDayString(String dateTime) {
    return DateFormat("dd MMM yyyy")
        .format(DateFormat("yyyy-MM-dd").parse(dateTime));
  }

  static String getHourMintsFromTimeString(String dateTime) {
    return DateFormat("HH:mm").format(DateFormat("HH:mm:ss").parse(dateTime));
  }

  static String getDateFromDateTime(String dateTime) {
    return DateFormat('yyyy-MM-dd').format(DateTime.parse(dateTime));
  }

  static String getDayFromDateTime(String dateTime) {
    return DateFormat("EEE")
        .format(DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateTime));
  }

  static String getDateWithMonthNameFromDateTime(String dateTime) {
    return DateFormat('dd MMM yyyy').format(DateTime.parse(dateTime));
  }

  static DateTime getDateTimeFromString(String dateTime) {
    return DateTime.parse(
        DateFormat('yyyy-MM-dd').format(DateTime.parse(dateTime)));
  }

  static DateTime getTimeFromString(String time) {
    return DateTime.parse(DateFormat('HH:mm:ss').format(DateTime.parse(time)));
  }
}

extension StringExtension on String {
  DateTime getDateFromDateTimeString() {
    return DateTime.parse(DateFormat('yyyy-MM-dd')
        .format(DateFormat('yyyy-MM-dd HH:mm:ss').parse(this)));
  }

  DateTime getDateFromDateString() {
    return DateTime.parse(
        DateFormat('yyyy-MM-dd').format(DateFormat('yyyy-MM-dd').parse(this)));
  }

  DateTime getDateTimeFromDateTimeString() {
    return DateTime.parse(DateFormat('yyyy-MM-dd HH:mm:ss')
        .format(DateFormat('yyyy-MM-dd HH:mm:ss').parse(this)));
  }

  DateTime getTime() {
    return DateTime.parse(DateFormat('HH:mm:ss').parse(this).toString());
  }

  String getDateStringFromDateTimeString() {
    return DateFormat('yyyy-MM-dd')
        .format(DateFormat('yyyy-MM-dd HH:mm:ss').parse(this));
  }

  String getTimeStringFromDateTimeString() {
    return DateFormat('HH:mm')
        .format(DateFormat('yyyy-MM-dd HH:mm:ss').parse(this));
  }

  String getHoursMinutesFromDateTimeString() {
    return DateFormat("HH:mm")
        .format(DateFormat("yyyy-MM-dd HH:mm:ss").parse(this));
  }

  String getHoursMinutesFromTimeString() {
    return DateFormat("HH:mm").format(DateFormat("HH:mm:ss").parse(this));
  }

  String getDayMonthFromDateTimeString() {
    return DateFormat('dd MMMM')
        .format(DateFormat("yyyy-MM-dd HH:mm:ss").parse(this));
  }

  String getMonthFromDateString() {
    return DateFormat('MMMM').format(DateFormat("yyyy-MM-dd").parse(this));
  }

  String getDayMonthShortFormFromDateTimeString() {
    return DateFormat('dd MMM')
        .format(DateFormat("yyyy-MM-dd HH:mm:ss").parse(this));
  }
}

extension DateTimeExtension on DateTime {}
