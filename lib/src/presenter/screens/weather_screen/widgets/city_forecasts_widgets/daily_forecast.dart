import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:weather_forecast_app/src/domain/models/weather_model.dart';
import 'package:weather_forecast_app/generated/l10n.dart';

import 'package:weather_forecast_app/src/presenter/theme/app_colors.dart';
import 'package:weather_forecast_app/src/presenter/theme/app_text_styles.dart';

/// Погода на 8 дней, учитывая текущий
class DailyForecastWidget extends StatelessWidget {
  const DailyForecastWidget(this.weatherData, {super.key});

  final WeatherModel weatherData;

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
              Row(
                children: [
                  const Expanded(child: Center(child: SizedBox.shrink())),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              S.of(context).day,
                              style: AppTextStyles.mainFont,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              S.of(context).night,
                              style: AppTextStyles.mainFont,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: weatherData.daily
                    .map(
                      (element) => InfoAtDay(
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

class InfoAtDay extends StatelessWidget {
  final DateTime date;
  final int temperatureDay;
  final int temperatureEvening;
  final String weatherImage;

  const InfoAtDay({
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
                  DateFormat(
                    'd MMMM',
                    Localizations.localeOf(context).languageCode,
                  ).format(date),
                  style: AppTextStyles.mainFont,
                ),
              ),
              Center(
                child: SvgPicture.asset(
                  weatherImage,
                  semanticsLabel: S.of(context).dayWeatherIcon,
                ),
              ),
              Center(
                child: Text(
                  '${temperatureDay.toString()}°',
                  style: AppTextStyles.mainFont,
                ),
              ),
              Center(
                child: Text(
                  '${temperatureEvening.toString()}°',
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
