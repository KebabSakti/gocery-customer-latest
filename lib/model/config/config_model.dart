import 'package:flutter/material.dart';
import "package:freezed_annotation/freezed_annotation.dart";

part 'config_model.freezed.dart';
part 'config_model.g.dart';

@freezed
class ConfigModel with _$ConfigModel {
  const factory ConfigModel({
    String? authToken,
    @Default(ThemeMode.light) ThemeMode theme,
  }) = _ConfigModel;

  factory ConfigModel.fromJson(Map<String, dynamic> json) =>
      _$ConfigModelFromJson(json);
}
