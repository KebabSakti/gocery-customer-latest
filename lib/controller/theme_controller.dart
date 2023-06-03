import 'package:flutter/material.dart';
import 'package:gocery/api/theme_api.dart';

class ThemeController {
  final _themeApi = ThemeApi();

  Future<ThemeMode> show() async {
    final theme = await _themeApi.show();

    return theme;
  }

  Future<void> update(ThemeMode themeMode) async {
    await _themeApi.update(themeMode);
  }
}
