import 'package:flutter/material.dart';
import 'package:weather_forecast_app/theme/colors.dart';
import 'package:weather_forecast_app/theme/text.dart';

final class SettingButtonItem {
  final String buttonName;
  final IconData iconType;

  SettingButtonItem({required this.buttonName, required this.iconType});
}

final List settingsItems = [
  SettingButtonItem(
    buttonName: 'Measurement units',
    iconType: Icons.balance_rounded,  
    //settings_system_daydream_outlined
    //balance_rounded
  ),
  SettingButtonItem(
    buttonName: 'Notifications',
    iconType: Icons.notifications,
  ),
  SettingButtonItem(
    buttonName: 'Language',
    iconType: Icons.language,
  ),
  SettingButtonItem(
    buttonName: 'Seed fedback',
    iconType: Icons.sms_outlined,
  ),
  SettingButtonItem(
    buttonName: 'Rate this app',
    iconType: Icons.star,
  ),
  SettingButtonItem(
    buttonName: 'Share your weather',
    iconType: Icons.share,
  ),
];

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
              return ToolsElementWidget(
                setting: settingUnit,
              );
            }),
      ],
    );
  }
}

class ToolsElementWidget extends StatelessWidget {
  final SettingButtonItem setting;

  const ToolsElementWidget({super.key, required this.setting});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Icon(setting.iconType, color: AppColors.white, size: 30),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    setting.buttonName,
                    style: AppTextStyles.expandedMainFont,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
