import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_forecast_app/data_handling/serialisator/weather_data.dart';
import 'package:weather_forecast_app/images.dart';
import 'package:weather_forecast_app/theme/colors.dart';
import 'package:weather_forecast_app/theme/text.dart';

class WeekForecastWidget extends StatelessWidget {
final WeatherData weatherData;
  const WeekForecastWidget({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: AppColors.widgetBackground,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children:
                    // for (int i = 0; i < 7; i++)
                    //   InfoPerDay(
                    //     // day: currentDay + i,
                    //     // month: monthNames[currentMonth - 1],
                    //     date: weatherData?.daily.elementAt(i).date,
                    //     weatherImage: AppIconsMini.thunder,
                    //   ),
                    // спред-оператор
                    weatherData.daily
                        .map(
                          (e) => SizedBox(
                            height: 38,
                            child: InfoPerDay(
                              date: e.date,
                              temperatureDay: e.dailyTemperature.day.round(),
                              temperatureEvening:
                                  e.dailyTemperature.eve.round(),
                              weatherImage: AppIconsMini.windWithSnow,
                            ),
                          ),
                        )
                        .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class InfoPerDay extends StatelessWidget {
  final int date;
  final int temperatureDay;
  final int temperatureEvening;
  final AssetImage weatherImage;

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
              '${DateFormat.d().format(currentDate)} ${DateFormat.MMMM().format(currentDate)}',
              style: AppTextStyles.mainFont),
          Image(
            image: weatherImage,
          ),
          Text(
            '${temperatureDay.toString()}°',
            style: AppTextStyles.mainFont,
          ),
          Text(
            '${temperatureEvening.toString()}°',
            style: AppTextStyles.mainFont,
          )
        ],
      ),
    );
  }
}
