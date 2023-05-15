import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';

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
