import 'package:flutter/material.dart';
import 'package:weather_forecast_app/screens/settings_screen/widgets/tools/setting_button_items.dart';
import 'package:weather_forecast_app/theme/app_colors.dart';
import 'package:weather_forecast_app/theme/app_text_styles.dart';

class ToolElementWidget extends StatelessWidget {
  final SettingButtonItem setting;

  const ToolElementWidget({super.key, required this.setting});

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
              backgroundColor: AppColors.mainBackground,
              title: const Text(
                'App unit\'s:',
                style: AppTextStyles.settingsScreenHeaderFont,
              ),
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
              Icon(
                setting.iconType,
                color: AppColors.white,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  setting.buttonName,
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
