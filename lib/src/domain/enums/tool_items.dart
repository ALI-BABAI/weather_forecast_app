import 'package:flutter/material.dart';

import '../../../l10n/localization_without_context.dart';

enum ToolItem {
  measurementUnits,
  notifications,
  language,
  auth,
}

extension ToolItemTypeExtension on ToolItem {
  String get buttonName {
    switch (this) {
      case ToolItem.measurementUnits:
        return tr.measurementUnits;
      case ToolItem.notifications:
        return tr.notifications;
      case ToolItem.language:
        return tr.language;
      case ToolItem.auth:
        return tr.logout;
    }
  }

  IconData get iconType {
    switch (this) {
      case ToolItem.measurementUnits:
        return Icons.balance_rounded;
      case ToolItem.notifications:
        return Icons.notifications;
      case ToolItem.language:
        return Icons.language;
      case ToolItem.auth:
        return Icons.autorenew_sharp;
    }
  }
}
