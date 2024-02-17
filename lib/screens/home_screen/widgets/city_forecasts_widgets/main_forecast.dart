import 'package:flutter/material.dart';
import 'package:weather_forecast_app/domain/models/weather_model.dart';
import 'package:weather_forecast_app/screens/home_screen/widgets/city_forecasts_widgets/main_forecast_widgets/date.dart';
import 'package:weather_forecast_app/screens/home_screen/widgets/city_forecasts_widgets/main_forecast_widgets/dotted_divider.dart';
import 'package:weather_forecast_app/screens/home_screen/widgets/city_forecasts_widgets/main_forecast_widgets/extended_weather_info.dart';
import 'package:weather_forecast_app/screens/home_screen/widgets/city_forecasts_widgets/main_forecast_widgets/basic_weather_info.dart';

class MainForecastWidget extends StatelessWidget {
  final WeatherModel weatherData;
  const MainForecastWidget({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        // День недели и дата
        DateWidget(weatherData: weatherData),
        // Текущая информация о погоде
        BasicWeatherInfoWidget(weatherData: weatherData),
        // Пунктирный разделитель
        const DottedDivederWidget(),
        // Давление, влажность, сила и направление ветра
        ExtendedWeatherInfoWidget(weatherData: weatherData),
      ],
    );
  }
}
