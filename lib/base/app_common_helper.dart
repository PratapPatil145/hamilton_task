import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:fluttertoast/fluttertoast.dart';

abstract class AppCommonHelper {
  static String formatNumericValue(dynamic value,
      {required NumberFormat formatStyle}) {
    String appDir = "s2w";
    NumberFormat numFormat;
    if (formatStyle == null) {
      numFormat = NumberFormat("#,##0", "en_US");
    } else {
      numFormat = formatStyle;
    }
    if (value != null || (value is int || value is double)) {
      return numFormat.format(value);
    } else {
      return "0";
    }
  }

  static bool isTablet(BuildContext context) {
    bool isTablet = false;
    if (MediaQuery.of(context).size.width > 600) {
      isTablet = true;
    } else {
      isTablet = false;
    }
    return isTablet;
  }

  static String formatDate(String date, {required String dateFormat}) {
    DateFormat formattedDate;
    if (date == null || date == "") {
      return "";
    }
    if (dateFormat == null) {
      formattedDate = DateFormat("yyyy-MM-dd");
    }
    formattedDate = DateFormat(dateFormat);
    return formattedDate.format(DateTime.parse(date).toLocal());
  }

  static String formatTime(TimeOfDay time, {required String timeFormat}) {
    DateFormat formattedTime;
    if (time == null) {
      return "";
    }
    DateTime now = DateTime.now();
    formattedTime = DateFormat(timeFormat ?? "hh:mm a");
    return formattedTime.format(
      DateTime(now.year, now.month, now.day, time.hour, time.minute),
    );
  }

  static String formatTimeData(String time, {required String timeFormat}) {
    DateTime tempDate = DateFormat("hh:mm").parse(time);
    var dateFormat = DateFormat("h:mm a"); // you can change the format here
    var utcDate = dateFormat.format(tempDate); // pass the UTC time here
    var localDate = dateFormat.parse(utcDate, true).toLocal().toString();
    String createdDate = dateFormat.format(DateTime.parse(localDate));
    print("------------$createdDate");
    return createdDate;
  }

  static String format24Time(TimeOfDay time, {required String timeFormat}) {
    DateFormat formattedTime;
    if (time == null) {
      return "";
    }
    DateTime now = DateTime.now();
    formattedTime = DateFormat(timeFormat ?? "HH:mm:ss");
    return formattedTime.format(
      DateTime(now.year, now.month, now.day, time.hour, time.minute),
    );
  }

  /* static Future<AttachmentInfo> getFileContent(String filePath) async {
    if (filePath == null || !await File(filePath).exists()) {
      return null;
    }
    File file = File(filePath);
    String fileNameWithExt = file.path.split("/").last;
    String fileName = fileNameWithExt.split(".").first;
    String extention = fileNameWithExt.split(".").last;

    var bytes = file.readAsBytesSync();

    return AttachmentInfo(
        name: fileName, type: extention, content: base64Encode(bytes));
  }
*/
  static String mergeDateTime(String targetDate, int minute,
      {required String dateFormat}) {
    DateTime dt = DateTime.parse(targetDate);
    DateTime newDate =
        DateTime(dt.year, dt.month, dt.day, (minute / 60).floor(), minute % 60);
    return newDate.toString();
  }

  static String timeAgoCustom(String date) {
    DateTime d = DateTime.parse(date);
    // <-- Custom method Time Show  (Display Example  ==> 'Today 7:00 PM')     // WhatsApp Time Show Status Shimila
    Duration diff = DateTime.now().difference(d);
    if (diff.inDays > 365)
      return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "year" : "years"} ago";
    if (diff.inDays > 30)
      return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "month" : "months"} ago";
    if (diff.inDays > 7)
      return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "week" : "weeks"} ago";
    if (diff.inDays > 0) return "${DateFormat.E().add_jm().format(d)}";
    if (diff.inHours > 0) return "Today ${DateFormat('jm').format(d)}";
    if (diff.inMinutes > 0)
      return "${diff.inMinutes} ${diff.inMinutes == 1 ? "minute" : "minutes"} ago";
    return "just now";
  }

  static String capitalize(String text) {
    if (text == null || text == "") {
      return "";
    }
    return "${text[0].toUpperCase()}${text.substring(1).toLowerCase()}";
  }

  static void push(BuildContext context, Widget page) {
    Navigator.of(context).push(
      CupertinoPageRoute(builder: (context) => page),
    );
  }

  static void pushReplacement(BuildContext context, Widget page) {
    Navigator.of(context).pushReplacement(
      CupertinoPageRoute(builder: (context) => page),
    );
  }

  static void customToast(String message) {
    // Fluttertoast.showToast(
    //     msg: message ?? "",
    //     toastLength: Toast.LENGTH_LONG,
    //     textColor: Colors.white,
    //     backgroundColor: Colors.red.shade600);
  }

  static void printWarning(String text) {
    print('\x1B[33m$text\x1B[0m');
  }

  static void printError(String text) {
    print('\x1B[31m$text\x1B[0m');
  }
}
