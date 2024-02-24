import 'package:flutter/material.dart';
import 'package:weather_forecast_app/presenter/blocs/setting_bloc/settings_screen/widgets/tools/tool_button_items.dart';
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
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            AppTextConstants.tools,
            style: AppTextStyles.settingsScreenHeaderFont,
          ),
        ),
        // Toll-items
        ListView.builder(
          shrinkWrap: true,
          primary: false, // убирает эффект скролла блока
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
      ),
    );
  }
}
