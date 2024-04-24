import 'package:flutter/material.dart';
import 'package:weather_forecast_app/generated/l10n.dart';
import 'package:weather_forecast_app/screens_deprecated/alerts_windows/app_allert_window.dart';
import 'package:weather_forecast_app/theme/app_colors.dart';
import 'package:weather_forecast_app/theme/app_text_styles.dart';
import 'package:weather_forecast_app/theme/src/text_constants.dart';

class ToolsWidget extends StatelessWidget {
  const ToolsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).tools,
          style: AppTextStyles.settingsScreenHeaderFont,
        ),
        const SizedBox(height: 10),
        // Toll-items
        ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: _toolsItems.length,
          itemBuilder: (context, index) {
            final toolItem = _toolsItems[index];
            return ToolItemWidget(
              toolButtonItem: toolItem,
              context: context,
            );
          },
        ),
      ],
    );
  }
}

class ToolItemWidget extends StatelessWidget {
  final ToolButtonItem toolButtonItem;
  final BuildContext context;

  const ToolItemWidget({
    super.key,
    required this.toolButtonItem,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextButton(
        onPressed: () => AppAllertWindow.changeMeasurementUnits(context),
        child: Row(
          children: [
            Icon(
              toolButtonItem.iconType,
              color: AppColors.white,
            ),
            const SizedBox(width: 10),
            Text(
              toolButtonItem.buttonName,
              style: AppTextStyles.expandedMainFont,
            ),
          ],
        ),
      ),
    );
  }
}

final class ToolButtonItem {
  final String buttonName;
  final IconData iconType;
  final VoidCallback function;

  ToolButtonItem({
    required this.buttonName,
    required this.iconType,
    required this.function,
  });
}

final List _toolsItems = [
  ToolButtonItem(
    buttonName: TextConstants.measurementUnits,
    iconType: Icons.balance_rounded,
    function: () {
      debugPrint('handling...');
    },
  ),
  ToolButtonItem(
    buttonName: TextConstants.notifications,
    iconType: Icons.notifications,
    function: () {
      debugPrint('handling...');
    },
  ),
  ToolButtonItem(
    buttonName: TextConstants.language,
    iconType: Icons.language,
    function: () {
      debugPrint('handling...');
    },
  ),
];
