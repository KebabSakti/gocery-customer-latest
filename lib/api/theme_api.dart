import 'package:flutter/material.dart';

import '../common/helper/storage.dart';

class ThemeApi {
  final _storage = Storage();

  Future<ThemeMode> show() async {
    ThemeMode initialTheme = ThemeMode.light;
    final theme = await _storage.read('theme');

    if (theme != null) {
      if (theme == 'light') {
        initialTheme = ThemeMode.light;
      }

      if (theme == 'dark') {
        initialTheme = ThemeMode.dark;
      }
    }

    return initialTheme;
  }

  Future<void> update(ThemeMode themeMode) async {
    await _storage.write('theme', themeMode.name);
  }
}
