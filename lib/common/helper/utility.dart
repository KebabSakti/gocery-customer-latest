import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:uuid/uuid.dart';

dynamic parseJson(String json) {
  final parsed = jsonDecode(json);
  return parsed;
}

void removeNullFromMap(Map object) {
  object.removeWhere((key, value) => value == null);
}

void showToast(String message, {Toast? toastLength = Toast.LENGTH_SHORT}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    fontSize: 16.0,
  );
}

void errorSnackbar(BuildContext context, {required void Function() onPressed}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.redAccent,
      duration: const Duration(hours: 1),
      content: Text(
        'Oops!! Something went wrong',
        style: TextStyle(
          color: Colors.white,
          fontSize: 10.sp,
        ),
      ),
      action: SnackBarAction(
        label: 'Refresh',
        textColor: Colors.white,
        onPressed: () {},
      ),
    ),
  );
}

String uuid() {
  const uuid = Uuid();

  return uuid.v1();
}

String money(double value) {
  final formatter = NumberFormat.simpleCurrency(locale: 'id', decimalDigits: 0);

  return formatter.format(value);
}
