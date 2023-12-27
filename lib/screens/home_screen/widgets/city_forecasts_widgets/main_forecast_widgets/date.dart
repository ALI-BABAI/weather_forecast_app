import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_forecast_app/data_handling/network/models/weather/weather_model.dart';
import 'package:weather_forecast_app/theme/app_colors.dart';
import 'package:weather_forecast_app/theme/app_text_styles.dart';

class DateWidget extends StatelessWidget {
  final WeatherModel weatherData;
  const DateWidget({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    // Преобразование Unix timestamp в объект DateTime
    // Из числа получаем текущее время
    final currentDate = DateTime.fromMillisecondsSinceEpoch(
        (weatherData.timezoneOffset + weatherData.date) * 1000,
        isUtc: true);
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
              '${DateFormat.EEEE().format(currentDate)}, ${DateFormat.d().format(currentDate)} ${DateFormat.MMMM().format(currentDate)}',
              style: AppTextStyles.smallestSecondaryFont,
            ),
          ),
        ),
      ],
    );
  }
}
