import 'package:flutter/material.dart';
import 'package:weather_forecast_app/theme/app_colors.dart';
import 'package:weather_forecast_app/theme/app_text_styles.dart';

// Всплывающие окна приложения
abstract class AppAllertWindow {
  // Переключение единиц измерения
  static changeMeasurementUnits(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: AppColors.mainBackground,
        title: const Text(
          'App unit\'s:',
          style: AppTextStyles.settingsScreenHeaderFont,
        ),
        actionsAlignment: MainAxisAlignment.spaceAround,
        actions: <Widget>[
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Temperature:',
                  style: AppTextStyles.expandedMainFont,
                ),
              ),
              TextButton(
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(AppColors.orange)),
                onPressed: () => Navigator.pop(context, '°C'),
                child: const Text(
                  '°C',
                  style: AppTextStyles.expandedMainFont,
                ),
              ),
              const SizedBox(width: 15),
              TextButton(
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(AppColors.orange)),
                onPressed: () => Navigator.pop(context, '°F'),
                child: const Text(
                  '°F',
                  style: AppTextStyles.expandedMainFont,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Expanded(
                  child: Text(
                'Pressure:',
                style: AppTextStyles.expandedMainFont,
              )),
              TextButton(
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(AppColors.orange)),
                onPressed: () => Navigator.pop(context, '°C'),
                child: const Text(
                  'hPa',
                  style: AppTextStyles.expandedMainFont,
                ),
              ),
              const SizedBox(width: 15),
              TextButton(
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(AppColors.orange)),
                onPressed: () => Navigator.pop(context, '°F'),
                child: const Text(
                  'mmHg',
                  style: AppTextStyles.expandedMainFont,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Нет соответсвия введённого города пользователем с списком сервера
  static warningCityNotFound(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.error_outline, color: Colors.black),
            Text(' ПРОБЛЕМОЧКА'),
          ],
        ),
        backgroundColor: AppColors.orange,
        content: const Text('Не удалось найти город. \nПопробуй заново!'),
        actions: <Widget>[
          TextButton(
            style: const ButtonStyle(
              shape: MaterialStatePropertyAll(
                CircleBorder(
                  side: BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
  //
}
