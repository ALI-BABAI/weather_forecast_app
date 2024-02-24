import 'package:flutter/material.dart';
import 'package:weather_forecast_app/theme/src/text_constants.dart';

final class ToolButtonItem {
  final String buttonName;
  final IconData iconType;
  final void function;

  ToolButtonItem({
    required this.buttonName,
    required this.iconType,
    required this.function,
  });
}

final List toolsItemsList = [
  ToolButtonItem(
    buttonName: AppTextConstants.measurementUnits,
    iconType: Icons.balance_rounded,
    function: () {
      debugPrint('handling...');
    },
  ),
  ToolButtonItem(
    buttonName: AppTextConstants.notifications,
    iconType: Icons.notifications,
    function: () {
      debugPrint('handling...');
    },
  ),
  ToolButtonItem(
    buttonName: AppTextConstants.language,
    iconType: Icons.language,
    function: () {
      debugPrint('handling...');
    },
  ),
  ToolButtonItem(
    buttonName: AppTextConstants.seedFedback,
    iconType: Icons.sms_outlined,
    function: () {
      debugPrint('handling...');
    },
  ),
  ToolButtonItem(
    buttonName: AppTextConstants.rateThisApp,
    iconType: Icons.star,
    function: () {
      debugPrint('handling...');
    },
  ),
  ToolButtonItem(
    buttonName: AppTextConstants.shareYourWeather,
    iconType: Icons.share,
    function: () {
      debugPrint('handling...');
    },
  ),
];
