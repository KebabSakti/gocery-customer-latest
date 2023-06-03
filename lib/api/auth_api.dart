import 'package:flutter/foundation.dart';
import '../common/config/const.dart';
import '../common/helper/network.dart';

import '../common/helper/utility.dart';

class AuthApi {
  final _http = NetworkClient();

  Future<String> validate(String authToken) async {
    final request = await _http.post(auth, body: {'token': authToken});
    final json = await compute(parseJson, request.body);
    final token = json['token'];

    return token;
  }
}
