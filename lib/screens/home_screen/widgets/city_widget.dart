import 'package:flutter/material.dart';
import 'package:weather_forecast_app/data_handling/serialisator/cities.dart';
import 'package:weather_forecast_app/data_handling/serialisator/weather_data.dart';
import 'package:weather_forecast_app/screens/home_screen/widgets/city_forecasts_widgets/hourly.dart';
import 'package:weather_forecast_app/screens/home_screen/widgets/city_forecasts_widgets/main.dart';
import 'package:weather_forecast_app/screens/home_screen/widgets/city_forecasts_widgets/week.dart';
import 'package:weather_forecast_app/theme/button.dart';
import 'package:weather_forecast_app/theme/colors.dart';
import 'package:weather_forecast_app/theme/text.dart';

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
    return Scaffold(
      // имя текущего города храниться в свойстве title:
      appBar: AppBar(
        toolbarHeight: 50,
        elevation: 4, // тень
        title: Center(
          child: Text(
            // 'Ulyanovsk, RU',
            '${currentCity.name}, ${currentCity.country}',
            // style: AppTextStyles.appBarFont,
            style: theme.textTheme.titleLarge,
          ),
        ),
        backgroundColor: AppColors.appBackground,
        actions: <Widget>[
          SizedBox(
            height: 50,
            width: 50,
            child: ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => const SettingsScreen()),
                // );
                // удаляет текущую странницу
                //Navigator.pushNamed(context, '/settings');
                Navigator.pushReplacementNamed(context, '/settings');
              },
              style: AppNavigattionButtonStyle.buttonStyle,
              child: const Icon(
                Icons.settings,
                color: AppColors.white,
                size: 40,
              ),
            ),
          ),
        ],
      ),
      // градиентная заливка бэкграунда с информацией по городу
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: AppColors.gradientBackground,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        // вертикальный виджет с всей информации
        child: ListView(
          primary: true,
          children: [
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
      ),
    );
  }
}
