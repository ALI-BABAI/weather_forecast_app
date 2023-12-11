import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_forecast_app/images.dart';
import 'package:weather_forecast_app/main.dart';
import 'package:weather_forecast_app/theme/colors.dart';
import 'package:weather_forecast_app/theme/text.dart';

class HourlyForecastWidget extends StatelessWidget {
  const HourlyForecastWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
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
                  (weatherInSavedCities.first!.timezoneOffset +
                          weatherInSavedCities.first!.hourly.elementAt(index).date) *
                      1000,
                  isUtc: true);
              String temperatureAtHour = weatherInSavedCities.first!.hourly
                  .elementAt(index)
                  .temperature
                  .round()
                  .toString();
              return Padding(
                // отступ между элементами
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: HourlyWidget(
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

class HourlyWidget extends StatelessWidget {
  final String hour;
  final String weather;
  final AssetImage image;

  const HourlyWidget({
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
