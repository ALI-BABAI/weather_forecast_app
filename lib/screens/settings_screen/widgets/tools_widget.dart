import 'package:flutter/material.dart';
import 'package:weather_forecast_app/theme/colors.dart';
import 'package:weather_forecast_app/theme/text.dart';

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
    //settings_system_daydream_outlined
    //balance_rounded
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
          },
        ),
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
            onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    backgroundColor: AppColors.appBackground,
                    title: const Text(
                      'App unit\'s:',
                      style: AppTextStyles.settingsScreenHeaderFont,
                    ),
                    // content: const Text(
                    //   'Temperature:',
                    //   style: AppTextStyles.mainFont,
                    // ),
                    actionsAlignment: MainAxisAlignment.spaceAround,
                    actions: <Widget>[
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Temperature:',
                              style: AppTextStyles.expandedMainFont,
                            ),
                          ),
                          TextButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(AppColors.orange)),
                            onPressed: () => Navigator.pop(context, '°C'),
                            child: const Text(
                              '°C',
                              style: AppTextStyles.expandedMainFont,
                            ),
                          ),
                          const SizedBox(width: 15),
                          TextButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(AppColors.orange)),
                            onPressed: () => Navigator.pop(context, '°F'),
                            child: const Text(
                              '°F',
                              style: AppTextStyles.expandedMainFont,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Expanded(
                              child: Text(
                            'Pressure:',
                            style: AppTextStyles.expandedMainFont,
                          )),
                          TextButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(AppColors.orange)),
                            onPressed: () => Navigator.pop(context, '°C'),
                            child: const Text(
                              'hPa',
                              style: AppTextStyles.expandedMainFont,
                            ),
                          ),
                          const SizedBox(width: 15),
                          TextButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(AppColors.orange)),
                            onPressed: () => Navigator.pop(context, '°F'),
                            child: const Text(
                              'mmHg',
                              style: AppTextStyles.expandedMainFont,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
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
