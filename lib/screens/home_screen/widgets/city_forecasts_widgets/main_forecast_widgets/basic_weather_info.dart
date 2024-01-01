import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart'; //https://pub.dev/packages/simple_gradient_text
import 'package:weather_forecast_app/data_handling/network/models/weather_model.dart';
import 'package:weather_forecast_app/theme/app_colors.dart';

import 'package:weather_forecast_app/theme/app_text_styles.dart';
import 'package:weather_forecast_app/theme/src/text_constants.dart';

class BasicWeatherInfoWidget extends StatelessWidget {
  final WeatherModel weatherData;
  const BasicWeatherInfoWidget({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(
            'assets/images/weather_conditions/${weatherData.iconID}.svg',
            semanticsLabel: AppTextConstants.semanticLabelCurrentWeatherIcon,
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
                    '${weatherData.temperature}'
                    '${AppTextConstants.symbolDegree}',
                    gradientDirection: GradientDirection.ttb,
                    style: const TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.w500,
                    ),
                    colors: AppColors.grayGradientText,
                  ),
                ),
                // Описание
                Text(
                  weatherData.description,
                  style: AppTextStyles.expandedMainFont,
                ),
                // Отступ
                const SizedBox(height: 5),
                // Доп.температурные параметры по текущему дню
                Text(
                  '${weatherData.daily.first.maxTemperature}${AppTextConstants.symbolDegree}${AppTextConstants.symbolSlash}'
                  '${weatherData.daily.first.minTemperature}${AppTextConstants.symbolDegree}'
                  ' ${AppTextConstants.feelsLike} ${weatherData.temperatureFillsLike}${AppTextConstants.celsiumDegree}',
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
