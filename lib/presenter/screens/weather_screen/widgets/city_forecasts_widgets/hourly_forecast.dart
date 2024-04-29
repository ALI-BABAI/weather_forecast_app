import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:weather_forecast_app/domain/models/weather_model.dart';
import 'package:weather_forecast_app/generated/l10n.dart';
import 'package:weather_forecast_app/presenter/theme/app_colors.dart';
import 'package:weather_forecast_app/presenter/theme/app_text_styles.dart';

/// Почасовая информация о погоде (24ч, учитывая текущий)
class HourlyForecastWidget extends StatelessWidget {
  const HourlyForecastWidget(this.weatherData, {super.key});

  final WeatherModel weatherData;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: SizedBox(
          height: 115,
          child: ListView.builder(
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 24,
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
                  hour: DateFormat.Hm()
                      .format(weatherData.hourly.elementAt(index).date),
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
      decoration: BoxDecoration(
        color: AppColors.widgetBackground,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: SizedBox(
          width: 35,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(hour, style: AppTextStyles.smallestSecondaryFont),
              SvgPicture.asset(
                image,
                semanticsLabel: S.of(context).hourWeatherIcon,
              ),
              Text(
                '$weather°',
                style: AppTextStyles.mainFont,
              ),
            ],
          ),
        ),
      ),
    );
  }
}