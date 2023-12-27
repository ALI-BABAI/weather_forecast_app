import 'package:flutter/material.dart';
import 'package:weather_forecast_app/data_handling/network/models/city/city_model.dart';
import 'package:weather_forecast_app/theme/app_bar_button.dart';
import 'package:weather_forecast_app/theme/app_colors.dart';

class CityPanelWidget extends StatelessWidget {
  final ApiCity currentCity;
  const CityPanelWidget({super.key, required this.currentCity});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.widgetBackground,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                '${currentCity.name}, ${currentCity.country}',
                style:
                    theme.textTheme.titleLarge, // или AppTextStyles.appBarFont,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          // кнопка перехода на экран настроек
          SizedBox(
            height: 55,
            width: 55,
            child: IconButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, '/settings'),
              icon: const Center(
                child: Icon(
                  Icons.settings,
                  size: 35,
                ),
              ),
              style: appBarButtonStyle.copyWith(
                backgroundColor: const MaterialStatePropertyAll(
                  AppColors.widgetBackground,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}