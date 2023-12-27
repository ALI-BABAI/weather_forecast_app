// Давление, влажность, сила и направление ветра
import 'package:flutter/material.dart';
import 'package:weather_forecast_app/data_handling/network/models/weather_model.dart';
import 'package:weather_forecast_app/theme/app_text_styles.dart';

class ExtendedWeatherInfoWidget extends StatelessWidget {
  final WeatherModel weatherData;
  const ExtendedWeatherInfoWidget({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WeatherParameter(
                name: 'Wind: ',
                info: ' ${weatherData.wind}m/s',
                icon: Icons.air_rounded,
              ),
              WeatherParameter(
                name: 'Pressure: ',
                info: '${weatherData.pressure}hPa',
                icon: Icons.speed_rounded,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WeatherParameter(
                name: 'Visibility: ',
                info: '${weatherData.visibility}km',
                icon: Icons.visibility_outlined,
              ),
              WeatherParameter(
                name: 'Humidity: ',
                info: '${weatherData.humidity}%',
                icon: Icons.water_drop_outlined,
              ),
            ],
          ),
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon),
          const SizedBox(width: 12),
          Text(
            name,
            style: AppTextStyles.secondaryFont,
          ),
          Text(info, style: AppTextStyles.mainFont),
        ],
      ),
    );
  }
}


/*RichText(
    textAlign: TextAlign.center,
    text: const TextSpan(
      style: AppTextStyles.secondaryFont,
      children: <TextSpan>[
        TextSpan(text: '5°/12° Feels like '),
        TextSpan(
          text: '7°C',
          style: AppTextStyles.secondaryFont,
        )
      ],
    ),
  ), 
*/