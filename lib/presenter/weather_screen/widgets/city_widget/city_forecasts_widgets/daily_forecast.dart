import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:weather_forecast_app/domain/models/weather_model.dart';

import 'package:weather_forecast_app/theme/app_colors.dart';
import 'package:weather_forecast_app/theme/app_text_styles.dart';
import 'package:weather_forecast_app/theme/src/text_constants.dart';

class DailyForecastWidget extends StatelessWidget {
  final WeatherModel weatherData;
  const DailyForecastWidget({
    super.key,
    required this.weatherData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: AppColors.widgetBackground,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const Row(
                children: [
                  Expanded(child: Center(child: SizedBox.shrink())),
                  Expanded(child: Center(child: SizedBox.shrink())),
                  Expanded(
                    child: Center(
                      child: Text('day', style: AppTextStyles.mainFont),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text('night', style: AppTextStyles.mainFont),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: weatherData.daily
                    .map(
                      (element) => InfoPerDay(
                        date: element.date,
                        temperatureDay: element.dayTemperature,
                        temperatureEvening: element.eveTemperature,
                        weatherImage:
                            'assets/images/weather_conditions/${element.iconID}.svg',
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoPerDay extends StatelessWidget {
  final DateTime date;
  final int temperatureDay;
  final int temperatureEvening;
  final String weatherImage;

  const InfoPerDay({
    super.key,
    required this.date,
    required this.temperatureDay,
    required this.temperatureEvening,
    required this.weatherImage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(
            children: [
              Center(
                child: Text(
                    '${DateFormat.d().format(date)} ${DateFormat.MMMM().format(date)}',
                    style: AppTextStyles.mainFont),
              ),
              Center(
                child: SvgPicture.asset(
                  weatherImage,
                  semanticsLabel:
                      AppTextConstants.semanticLabelDayWeatherIcon,
                ),
              ),
              Center(
                child: Text(
                  '${temperatureDay.toString()}${AppTextConstants.symbolDegree}',
                  style: AppTextStyles.mainFont,
                ),
              ),
              Center(
                child: Text(
                  '${temperatureEvening.toString()}${AppTextConstants.symbolDegree}',
                  style: AppTextStyles.mainFont,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
