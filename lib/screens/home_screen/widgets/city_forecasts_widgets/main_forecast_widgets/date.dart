import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_forecast_app/data_handling/network/models/weather_model.dart';
import 'package:weather_forecast_app/theme/app_colors.dart';
import 'package:weather_forecast_app/theme/app_text_styles.dart';

class DateWidget extends StatelessWidget {
  final WeatherModel weatherData;
  const DateWidget({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DecoratedBox(
          decoration: const BoxDecoration(
            color: AppColors.widgetBackground,
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              '${DateFormat.EEEE().format(weatherData.date)}${AppTextConstants.symbolComma} '
              '${DateFormat.d().format(weatherData.date)} ${DateFormat.MMMM().format(weatherData.date)}',
              style: AppTextStyles.smallestSecondaryFont,
            ),
          ),
        ),
      ],
    );
  }
}
