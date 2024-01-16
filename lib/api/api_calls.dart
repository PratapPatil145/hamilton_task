import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class ApiCall {
  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  showLoaderDialog(BuildContext context, {String text = 'Loading...'}) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          SizedBox(
            width: 10,
          ),
          CircularProgressIndicator(
            strokeWidth: 5,
          ),
          SizedBox(
            width: 20,
          ),
          Container(
              margin: EdgeInsets.only(left: 7),
              child: Text(
                text,
                style: TextStyle(fontSize: 18, color: Colors.black),
              )),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget LoadingDialog(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade400,
              ),
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget welcomeDialog(BuildContext context) {
  //   return AlertDialog(
  //     content: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       mainAxisSize: MainAxisSize.min,
  //       children: <Widget>[
  //         Padding(
  //           padding: EdgeInsets.only(top: 10),
  //           child: Container(
  //             padding: EdgeInsets.all(10),
  //             decoration: BoxDecoration(
  //               shape: BoxShape.circle,
  //               color: Colors.grey.shade400,
  //             ),
  //             child: Center(
  //               child: CircleAvatar(
  //                 minRadius: 40,
  //                 maxRadius: 40,
  //                 backgroundImage: AssetImage("assets/bank/welcome_imogi.png"),
  //               ),
  //             ),
  //           ),
  //         ),
  //         Padding(
  //           padding: EdgeInsets.only(top: 10),
  //           child: SharedPrefrence().getUserName() != null ||
  //                   SharedPrefrence().getUserName() != ""
  //               ? Text(
  //                   "Hey ${SharedPrefrence().getUserName().toString()}",
  //                   style: SafeGoogleFont(
  //                     'Inter',
  //                     fontSize: 12,
  //                     fontWeight: FontWeight.w400,
  //                     color: Color(0xff000000),
  //                   ),
  //                 )
  //               : Text(
  //                   "",
  //                   style: SafeGoogleFont(
  //                     'Inter',
  //                     fontSize: 12,
  //                     fontWeight: FontWeight.w400,
  //                     color: Color(0xff000000),
  //                   ),
  //                 ),
  //         ),
  //         Padding(
  //           padding: EdgeInsets.only(top: 10),
  //           child: Text(
  //             "Welcome to Classpoint",
  //             style: SafeGoogleFont(
  //               'Inter',
  //               fontSize: 16,
  //               fontWeight: FontWeight.w600,
  //               color: Color(0xff000000),
  //             ),
  //           ),
  //         ),
  //         Padding(
  //           padding: EdgeInsets.only(top: 10),
  //           child: Text(
  //             "Classpoint in an education app for class 8 - 12 as per West Bengal Board Syllabus,JEE,NEET",
  //             style: SafeGoogleFont(
  //               'Inter',
  //               fontSize: 10,
  //               fontWeight: FontWeight.w400,
  //               color: Color(0xff000000),
  //             ),
  //           ),
  //         ),
  //         Container(
  //           margin: EdgeInsets.only(top: 10, bottom: 10),
  //           width: double.infinity,
  //           child: TextButton(
  //             onPressed: () {
  //               Navigator.pop(context);
  //             },
  //             child: Text(
  //               'Go to Home',
  //               style:
  //                   TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
  //             ),
  //             style: ButtonStyle(
  //                 backgroundColor: MaterialStatePropertyAll(
  //               Color(0xff470048),
  //             )),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

 
 
 
 
 
  void showToast(String message, BuildContext context) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
    );
  }

  String formatDate(String date, String format) {
    log("Date -> $date   format -> $format");
    String formattedDate = DateFormat(format).format(DateTime.parse(date));

    print(formattedDate);
    return formattedDate;
  }

  bool validateEmail1(String value) {
    RegExp regex = new RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return (!regex.hasMatch(value)) ? false : true;
  }

  bool validateEmail(String value) {
    /*   Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';*/
    RegExp regex = new RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    return (!regex.hasMatch(value)) ? false : true;
  }
}
