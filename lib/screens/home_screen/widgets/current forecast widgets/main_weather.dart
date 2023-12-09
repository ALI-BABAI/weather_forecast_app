import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart'; //https://pub.dev/packages/simple_gradient_text
import 'package:weather_forecast_app/data_handling/serialisator/weather_data.dart';
import 'package:weather_forecast_app/images.dart';
import 'package:weather_forecast_app/theme/text.dart';

class MainWeatherForecast extends StatelessWidget {
  final WeatherData weatherData;
  const MainWeatherForecast({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Image(
            fit: BoxFit.fill,
            image: AppIconsExpanded.windWithSnow,
          ),
          SizedBox(
            height: 160,
            child: Column(
              children: [
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
                Text(
                  weatherData.current.weather.first.description,
                  style: AppTextStyles.expandedMainFont,
                ),
                const SizedBox(height: 5),
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
