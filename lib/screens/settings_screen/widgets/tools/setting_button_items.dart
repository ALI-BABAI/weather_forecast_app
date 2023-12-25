import 'package:flutter/material.dart';

final class SettingButtonItem {
  final String buttonName;
  final IconData iconType;
  final void function;

  SettingButtonItem({
    required this.buttonName,
    required this.iconType,
    required this.function,
  });
}

final List settingsItems = [
  SettingButtonItem(
    buttonName: 'Measurement units',
    iconType: Icons.balance_rounded,
    function: () {
      debugPrint('handling...');
    },
  ),
  SettingButtonItem(
    buttonName: 'Notifications',
    iconType: Icons.notifications,
    function: () {
      debugPrint('handling...');
    },
  ),
  SettingButtonItem(
    buttonName: 'Language',
    iconType: Icons.language,
    function: () {
      debugPrint('handling...');
    },
  ),
  SettingButtonItem(
    buttonName: 'Seed fedback',
    iconType: Icons.sms_outlined,
    function: () {
      debugPrint('handling...');
    },
  ),
  SettingButtonItem(
    buttonName: 'Rate this app',
    iconType: Icons.star,
    function: () {
      debugPrint('handling...');
    },
  ),
  SettingButtonItem(
    buttonName: 'Share your weather',
    iconType: Icons.share,
    function: () {
      debugPrint('handling...');
    },
  ),
];