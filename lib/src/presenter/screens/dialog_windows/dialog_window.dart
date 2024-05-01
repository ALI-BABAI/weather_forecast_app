import 'package:flutter/material.dart';
import 'package:weather_forecast_app/src/domain/enums/app_languages.dart';
import 'package:weather_forecast_app/src/presenter/screens/dialog_windows/dialog_windows/language_setting_dialog.dart';
import 'package:weather_forecast_app/src/presenter/screens/dialog_windows/dialog_windows/unit_setting_dialog.dart';

import '../../../domain/enums/measurement_units.dart';

abstract class DialogWindow {
  static showUnitSettingDialog({
    required BuildContext context,
    required String title,
    required TemperatureUnit selectedValue,
  }) {
    showDialog(
      context: context,
      builder: (context) => UnitSettingDialog(
        title: title,
        selectedValue: selectedValue,
      ),
    );
  }

  static showLanguageSettingDialog({
    required BuildContext context,
    required String title,
    required AppLanguages selectedValue,
  }) {
    showDialog(
      context: context,
      builder: (context) => LanguageSettingDialog(
        title: title,
        selectedValue: selectedValue,
      ),
    );
  }
}
