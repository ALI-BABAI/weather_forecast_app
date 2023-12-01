import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart'; //https://pub.dev/packages/simple_gradient_text
import 'package:weather_forecast_app/api%20and%20json/answer.dart';
import 'package:weather_forecast_app/api%20and%20json/example_json.dart';
import 'package:weather_forecast_app/images.dart';
import 'package:weather_forecast_app/theme/text.dart';

class MainWeatherForecast extends StatelessWidget {
  const MainWeatherForecast({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Image(
            fit: BoxFit.fill,
            image: AppIconsExpanded.sunWithSmallCloud,
          ),
          SizedBox(
            height: 160,
            child: Column(
              children: [
                GradientText('5°',
                    gradientDirection: GradientDirection.ttb,
                    style: const TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.w500,
                    ),
                    colors: const [Color(0xFFA2A4B5), Color(0xFF757784)]),
                const Expanded(
                  child: Text(
                    'Sunny',
                    style: AppTextStyles.expandedMainFont,
                  ),
                ),
                const Text(
                  '-5°/-12° Feels like -7°C',
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
