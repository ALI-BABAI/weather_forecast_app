import 'package:flutter/material.dart';
import 'package:weather_forecast_app/screens/settings_screen/widgets/tools/setting_button_items.dart';
import 'package:weather_forecast_app/screens/settings_screen/widgets/tools/tool_element_widget.dart';
import 'package:weather_forecast_app/theme/app_text_styles.dart';

class ToolsWidget extends StatelessWidget {
  const ToolsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            'Tools',
            style: AppTextStyles.settingsScreenHeaderFont,
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          primary: false, // убирает эффект скролла блока
          itemCount: settingsItems.length,
          itemBuilder: (context, index) {
            final settingUnit = settingsItems[index];
            return ToolElementWidget(
              setting: settingUnit,
            );
          },
        ),
      ],
    );
  }
}
