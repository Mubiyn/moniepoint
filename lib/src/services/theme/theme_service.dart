// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:moniepoint_test/src/core/containers/app_injection_container.dart';

class MoniepointSettingsService {
  MoniepointSettingsService();

  ValueNotifier<ThemeMode> themeMode = ValueNotifier(getThemeModeFromString(
      sharedPrefs.getString('theme_mode') ?? 'ThemeMode.system'));

  void setThemeMode(String val) {
    sharedPrefs.setString('theme_mode', val);
    themeMode.value = getThemeModeFromString(val);
  }

  static ThemeMode getThemeModeFromString(String val) {
    return ThemeMode.values.firstWhere((e) => e.toString() == val);
  }
}
