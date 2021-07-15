import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class toast_diet {
  static void showMyToast({String message}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 12.0);
  }
}
