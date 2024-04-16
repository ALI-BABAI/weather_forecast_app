import 'package:flutter/material.dart';
import 'package:weather_forecast_app/domain/models/city_model.dart';
import 'package:weather_forecast_app/domain/models/weather_model.dart';
import 'package:weather_forecast_app/presenter/weather_screen/widgets/city_widget/city_forecasts_widgets/city_panel.dart';
import 'package:weather_forecast_app/presenter/weather_screen/widgets/city_widget/city_forecasts_widgets/daily_forecast.dart';
import 'package:weather_forecast_app/presenter/weather_screen/widgets/city_widget/city_forecasts_widgets/hourly_forecast.dart';
import 'package:weather_forecast_app/presenter/weather_screen/widgets/city_widget/city_forecasts_widgets/main_forecast_widgets/main_forecast.dart';
import 'package:weather_forecast_app/theme/app_colors.dart';
import 'package:weather_forecast_app/theme/app_decoration.dart';

class CityWidget extends StatelessWidget {
  final WeatherModel weatherData;
  final CityModel currentCity;
  const CityWidget({
    super.key,
    required this.weatherData,
    required this.currentCity,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: AppDecorations.darkDecorationTheme,
      child: ListView(
        primary: true,
        children: [
          // Город + кнопка перехода на экран настроек
          CityPanelWidget(currentCity: currentCity),
          // Иконка погоды, текущая погода + доп.параметры
          MainForecastWidget(weatherData: weatherData),
          // Почасовая информация о погоде (24ч, учитывая текущий)
          HourlyForecastWidget(weatherData: weatherData),
          // Погода на 8 дней, учитывая текущий
          DailyForecastWidget(weatherData: weatherData),
          // Для доп. дальнейшего функционала
          const Divider(color: AppColors.gray, thickness: 1),
          const SizedBox(height: 20),
          const Placeholder(fallbackHeight: 400, fallbackWidth: 400),
        ],
      ),
    );
  }
}
