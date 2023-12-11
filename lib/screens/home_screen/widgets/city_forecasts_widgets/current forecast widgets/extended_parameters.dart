// Давление, влажность, сила и направление ветра
import 'package:flutter/material.dart';
import 'package:weather_forecast_app/data_handling/serialisator/weather_data.dart';

import '../../../../../theme/text.dart';

class WeatherExtendedParameters extends StatelessWidget {
  final WeatherData weatherData;
  const WeatherExtendedParameters({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WeatherParameter(
                    name: 'Wind: ',
                    info:
                        ' ${weatherData.current.windSpeed}m/s',
                    icon: Icons.air_rounded,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  WeatherParameter(
                    name: 'Pressure: ',
                    info:
                        '${weatherData.current.pressure.toInt()}hPa',
                    icon: Icons.speed_rounded,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WeatherParameter(
                    name: 'Visibility: ',
                    info:
                        '${weatherData.current.visibility / 1000}km',
                    icon: Icons.visibility_outlined,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  WeatherParameter(
                    name: 'Humidity: ',
                    info:
                        '${weatherData.current.humidity}%',
                    icon: Icons.water_drop_outlined,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class WeatherParameter extends StatelessWidget {
  final String name;
  final IconData icon;
  final String info;

  const WeatherParameter(
      {super.key, required this.name, required this.icon, required this.info});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(icon, color: Colors.white),
        const SizedBox(width: 12),
        Text(
          name,
          style: AppTextStyles.secondaryFont,
        ),
        Text(info, style: AppTextStyles.mainFont),
      ],
    );
  }
}
