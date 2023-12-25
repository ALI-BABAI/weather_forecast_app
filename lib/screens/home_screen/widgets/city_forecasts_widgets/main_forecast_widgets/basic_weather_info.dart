import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart'; //https://pub.dev/packages/simple_gradient_text
import 'package:weather_forecast_app/data_handling/network/models/weather/weather_data.dart';

import 'package:weather_forecast_app/theme/app_text_styles.dart';

class BasicWeatherInfoWidget extends StatelessWidget {
  final WeatherData weatherData;
  const BasicWeatherInfoWidget({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(
            'assets/images/weather_conditions/${weatherData.current.weather.first.id}.svg',
            semanticsLabel: 'Main weather icon',
            // не работает
            // fit: BoxFit.fill,
            height: 125,
            width: 125,
          ),
          SizedBox(
            height: 160,
            child: Column(
              children: [
                // Градиентный текст с текущей температурой
                Expanded(
                  child: GradientText(
                      '${weatherData.current.temperature.round()}°',
                      gradientDirection: GradientDirection.ttb,
                      style: const TextStyle(
                        fontSize: 100,
                        fontWeight: FontWeight.w500,
                      ),
                      colors: const [Color(0xFFA2A4B5), Color(0xFF757784)]),
                ),
                // Описание
                Text(
                  weatherData.current.weather.first.description,
                  style: AppTextStyles.expandedMainFont,
                ),
                // Отступ
                const SizedBox(height: 5),
                // Доп.температурные параметры по текущему дню
                Text(
                  '${weatherData.daily.first.dailyTemperature.max.round()}°/${weatherData.daily.first.dailyTemperature.min.toInt()}° Feels like ${weatherData.current.temperatureFillsLike.round()}°C',
                  style: AppTextStyles.secondaryFont,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
