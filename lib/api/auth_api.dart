import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:gocery/common/config/const.dart';
import 'package:gocery/common/helper/network.dart';

import '../common/helper/utility.dart';

class AuthApi {
  final _http = GetIt.I<Network>();

  Future<String> validate(String authToken) async {
    final request = await _http.post(auth, body: {'token': authToken});
    final json = await compute(parseJson, request.body);
    final token = json['token'];

    return token;
  }
}
