import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  final _secureStorage = const FlutterSecureStorage();

  Storage._();

  static final Storage _instance = Storage._();

  factory Storage() {
    return _instance;
  }

  Future<void> write(String key, dynamic value) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<dynamic> read(String key) async {
    final data = await _secureStorage.read(key: key);

    return data;
  }
}
