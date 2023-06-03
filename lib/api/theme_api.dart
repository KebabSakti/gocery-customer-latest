import 'package:flutter/material.dart';

import '../common/helper/storage.dart';

class ThemeApi {
  final _storage = Storage();

  Future<ThemeMode> show() async {
    final theme = await _storage.read('theme') ?? ThemeMode.light;

    return theme;
  }

  Future<void> update(ThemeMode themeMode) async {
    await _storage.write('theme', themeMode);
  }
}
