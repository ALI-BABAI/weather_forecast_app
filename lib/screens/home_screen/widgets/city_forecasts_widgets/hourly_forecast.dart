import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_forecast_app/data_handling/network/serialisator/weather/weather_data.dart';
import 'package:weather_forecast_app/images.dart';
import 'package:weather_forecast_app/theme/app_colors.dart';
import 'package:weather_forecast_app/theme/app_text_styles.dart';

class HourlyForecastWidget extends StatelessWidget {
  final WeatherData weatherData;
  const HourlyForecastWidget({
    super.key,
    required this.weatherData,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: SizedBox(
          height: 115, // Высота элементов
          child: ListView.builder(
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 24, // Количество элементов
            itemBuilder: (BuildContext context, int index) {
              // Выводим для каждого следующего часа информацию по погоде
              DateTime currentDate = DateTime.fromMillisecondsSinceEpoch(
                  (weatherData.timezoneOffset +
                          weatherData.hourly.elementAt(index).date) *
                      1000,
                  isUtc: true);
              String temperatureAtHour = weatherData.hourly
                  .elementAt(index)
                  .temperature
                  .round()
                  .toString();
              return Padding(
                // отступ между элементами
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: HourItem(
                  hour: DateFormat.Hm().format(currentDate),
                  image: AppIconsMini.strongSnow,
                  weather: temperatureAtHour,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class HourItem extends StatelessWidget {
  final String hour;
  final String weather;
  final AssetImage image;

  const HourItem({
    super.key,
    required this.hour,
    required this.weather,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.widgetBackground,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(25),
          top: Radius.circular(25),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 5),
            Text(
              hour,
              style: AppTextStyles.smallestSecondaryFont,
            ),
            const SizedBox(height: 5),
            Image(
              image: image,
            ),
            const SizedBox(height: 5),
            Text(
              '$weather°',
              style: AppTextStyles.mainFont,
            ),
          ],
        ),
      ),
    );
  }
}
