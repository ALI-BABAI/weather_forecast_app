import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:weather_forecast_app/data_handling/network/models/weather/weather_model.dart';

import 'package:weather_forecast_app/theme/app_colors.dart';
import 'package:weather_forecast_app/theme/app_text_styles.dart';

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
          padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: weatherData.daily
                      .map(
                        (element) => SizedBox(
                          height: 38,
                          child: InfoPerDay(
                            date: element.date,
                            temperatureDay:
                                element.dayTemperature,
                            temperatureEvening:
                                element.eveTemperature,
                            weatherImage:
                                'assets/images/weather_conditions/${element.iconID}.svg',
                          ),
                        ),
                      )
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InfoPerDay extends StatelessWidget {
  final int date;
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
    final currentDate =
        DateTime.fromMillisecondsSinceEpoch(date * 1000, isUtc: true);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: const {
          0: FixedColumnWidth(120),
          1: FixedColumnWidth(120),
          2: FixedColumnWidth(50),
          3: FixedColumnWidth(50),
        },
        children: [
          TableRow(
            children: [
              Text(
                  '${DateFormat.d().format(currentDate)} ${DateFormat.MMMM().format(currentDate)}',
                  style: AppTextStyles.mainFont),
              SvgPicture.asset(
                weatherImage,
                semanticsLabel: 'Main weather icon',
                // не работает
                // fit: BoxFit.fill,
                height: 30,
                width: 30,
              ),
              Text(
                '${temperatureDay.toString()}°',
                style: AppTextStyles.mainFont,
              ),
              Text(
                '${temperatureEvening.toString()}°',
                style: AppTextStyles.mainFont,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
