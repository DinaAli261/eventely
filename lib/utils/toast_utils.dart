import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'app_colors.dart';

class ToastUtils {
  static Future<bool?> showToastMsg({
    required String msg,
    required Color color,
  }) {
    return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.blue,
      textColor: color,
      fontSize: 16.0,
    );
  }
}
