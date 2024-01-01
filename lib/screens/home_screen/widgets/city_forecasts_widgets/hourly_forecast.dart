import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:weather_forecast_app/data_handling/network/models/weather_model.dart';
import 'package:weather_forecast_app/theme/app_colors.dart';
import 'package:weather_forecast_app/theme/app_text_styles.dart';
import 'package:weather_forecast_app/theme/src/text_constants.dart';

class HourlyForecastWidget extends StatelessWidget {
  final WeatherModel weatherData;
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
              String temperatureAtHour = weatherData.hourly
                  .elementAt(index)
                  .temperature
                  .round()
                  .toString();
              return Padding(
                // отступ между элементами
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: HourItem(
                  hour: DateFormat.Hm().format(weatherData.hourly.elementAt(index).date),
                  image:
                      'assets/images/weather_conditions/${weatherData.hourly.elementAt(index).iconID}.svg',
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
  final String image;

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
            SvgPicture.asset(
              image,
              semanticsLabel: AppTextConstants.semanticLabelHourWeatherIcon,
              // не работает
              // fit: BoxFit.fill,
              height: 25,
              width: 25,
            ),
            const SizedBox(height: 5),
            Text(
              '$weather${AppTextConstants.symbolDegree}',
              style: AppTextStyles.mainFont,
            ),
          ],
        ),
      ),
    );
  }
}
