import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../common/helper/utility.dart';
import '../model/config/config_model.dart';

class ConfigApi {
  final _secureStorage = const FlutterSecureStorage();

  Future<ConfigModel> show() async {
    ConfigModel results = const ConfigModel();
    final jsonString = await _secureStorage.read(key: 'config');

    if (jsonString != null) {
      final parsed = await compute(parseJson, jsonString);
      results = ConfigModel.fromJson(parsed);
    }

    return results;
  }

  Future<void> update(ConfigModel configModel) async {
    await _secureStorage.write(
        key: 'config', value: jsonEncode(configModel.toJson()));
  }
}
