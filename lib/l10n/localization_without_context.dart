import 'package:flutter/material.dart';
import 'package:weather_forecast_app/generated/l10n.dart';

S get tr => _tr!;
S? _tr;

class AppTranslations {
  static void init(BuildContext context) {
    _tr = S.of(context);
  }
}