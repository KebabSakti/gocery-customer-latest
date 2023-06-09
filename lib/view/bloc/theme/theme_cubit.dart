import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../controller/theme_controller.dart';

part 'theme_cubit.freezed.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState());

  final _themeController = ThemeController();

  Future<void> load() async {
    emit(state.copyWith(loading: true));

    final theme = await _themeController.show();

    emit(ThemeState(themeMode: theme));
  }

  void toggleTheme() {
    final currentTheme = state.themeMode;

    final updatedTheme =
        currentTheme.name == 'light' ? ThemeMode.dark : ThemeMode.light;

    _themeController.update(updatedTheme);

    emit(ThemeState(themeMode: updatedTheme));
  }
}
