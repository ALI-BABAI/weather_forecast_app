import 'package:flutter/material.dart';
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
        // label
        const Text(
          AppTextConstants.tools,
          style: AppTextStyles.settingsScreenHeaderFont,
        ),
        // Toll-items
        ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: toolsItemsList.length,
          itemBuilder: (context, index) {
            final toolItem = toolsItemsList[index];
            return ToolItemWidget(toolButtonItem: toolItem);
          },
        ),
      ],
    );
  }
}

class ToolItemWidget extends StatelessWidget {
  final ToolButtonItem toolButtonItem;

  const ToolItemWidget({super.key, required this.toolButtonItem});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextButton(
        onPressed: () => AppAllertWindow.changeMeasurementUnits(context),
        // иконка и название итема
        child: Row(
          children: [
            Icon(
              toolButtonItem.iconType,
              color: AppColors.white,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                toolButtonItem.buttonName,
                style: AppTextStyles.expandedMainFont,
              ),
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
