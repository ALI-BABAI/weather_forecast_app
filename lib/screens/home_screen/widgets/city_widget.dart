import 'package:flutter/material.dart';
import 'package:weather_forecast_app/data_handling/network/serialisator/city/cities.dart';
import 'package:weather_forecast_app/data_handling/network/serialisator/weather/weather_data.dart';
import 'package:weather_forecast_app/screens/home_screen/widgets/city_forecasts_widgets/hourly.dart';
import 'package:weather_forecast_app/screens/home_screen/widgets/city_forecasts_widgets/main.dart';
import 'package:weather_forecast_app/screens/home_screen/widgets/city_forecasts_widgets/week.dart';
import 'package:weather_forecast_app/theme/app_bar_button.dart';
import 'package:weather_forecast_app/theme/app_colors.dart';
import 'package:weather_forecast_app/theme/app_decoration.dart';
import 'package:weather_forecast_app/theme/app_text_styles.dart';

class CityWidget extends StatelessWidget {
  final WeatherData weatherData;
  final ApiCity currentCity;
  const CityWidget({
    super.key,
    required this.weatherData,
    required this.currentCity,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DecoratedBox(
      decoration: appDecoration,
      // вертикальный виджет с всей информации
      child: ListView(
        primary: true,
        children: [
          DecoratedBox(
            decoration: const BoxDecoration(
              // color: Color(0xFF32333E),  // потемнее будет
              color: AppColors.widgetBackground,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    // 'Ulyanovsk, RU',
                    '${currentCity.name}, ${currentCity.country}',
                    // style: AppTextStyles.appBarFont,
                    style: theme.textTheme.titleLarge,
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 50,
                  child: IconButton(
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, '/settings'),
                    icon: const Center(
                      child: Icon(
                        Icons.settings,
                        size: 35,
                      ),
                    ),
                    // style: appBarButtonStyle,
                    style: appBarButtonStyle.copyWith(
                      backgroundColor: const MaterialStatePropertyAll(
                        AppColors.widgetBackground,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // const Divider(color: AppColors.gray),
          const SizedBox(height: 15),
          // виджет выводящий информацию о текущей погоде:
          // изображение, текущая погода + доп.параметры
          MainForecastWidget(weatherData: weatherData),
          // виджет, выводящий почасовую информацию (24ч, учитывая текущий)
          HoursForecastWidget(weatherData: weatherData),
          // Костыль для следующего виджета
          const Padding(
            padding: EdgeInsets.only(right: 45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('DAY / NIGHT', style: AppTextStyles.mainFont),
              ],
            ),
          ),
          // виджет, выводящий информацию на 8 дней, учитывая текущий
          WeekForecastWidget(weatherData: weatherData),
          // для доп. дальнейшего функционала
          const Divider(color: AppColors.gray, thickness: 1),
          const SizedBox(height: 20),
          const Placeholder(fallbackHeight: 400, fallbackWidth: 400)
        ],
      ),
    );
  }
}
