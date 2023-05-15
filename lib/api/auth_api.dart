import 'package:get_it/get_it.dart';
import 'package:gocery/common/config/const.dart';
import 'package:gocery/common/helper/network.dart';

class AuthApi {
  final _http = GetIt.I<Network>();

  Future<void> validate(String authToken) async {
    await _http.post(auth, body: {'token': authToken});
  }
}
