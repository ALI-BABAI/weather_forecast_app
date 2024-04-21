import 'package:flutter/material.dart';
import 'package:weather_forecast_app/theme/app_colors.dart';
import 'package:weather_forecast_app/theme/app_text_styles.dart';
import 'package:weather_forecast_app/theme/src/text_constants.dart';

abstract class AppAllertWindow {
  static changeMeasurementUnits(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: AppColors.mainBackground,
        title: const Text(
          TextConstants.allertTitleAppUnits,
          style: AppTextStyles.settingsScreenHeaderFont,
        ),
        actionsAlignment: MainAxisAlignment.spaceAround,
        actions: <Widget>[
          Row(
            children: [
              const Expanded(
                child: Text(
                  TextConstants.allertPointTemperature,
                  style: AppTextStyles.expandedMainFont,
                ),
              ),
              TextButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(AppColors.orange),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text('°C', style: AppTextStyles.expandedMainFont),
              ),
              const SizedBox(width: 15),
              TextButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(AppColors.orange),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text('°F', style: AppTextStyles.expandedMainFont),
              ),
            ],
          ),
          Row(
            children: [
              const Expanded(
                  child: Text(TextConstants.allertPointPressure,
                      style: AppTextStyles.expandedMainFont)),
              TextButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(AppColors.orange),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  TextConstants.unitHPa,
                  style: AppTextStyles.expandedMainFont,
                ),
              ),
              const SizedBox(width: 15),
              TextButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(AppColors.orange),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  TextConstants.unitMmHg,
                  style: AppTextStyles.expandedMainFont,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static warningCityNotFound(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.error_outline, color: Colors.black),
            Text(TextConstants.allertTitleProblem),
          ],
        ),
        backgroundColor: AppColors.orange,
        content: const Text(TextConstants.allertMessageCantFindCity),
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
            onPressed: () => Navigator.pop(context),
            child: const Text(TextConstants.ok),
          ),
        ],
      ),
    );
  }

  static warningCityAlreadyExist(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.error_outline, color: Colors.black),
            Text(TextConstants.allertTitleProblem),
          ],
        ),
        backgroundColor: AppColors.orange,
        content: const Text(TextConstants.allertMessageCityAlreadyExiset),
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
            onPressed: () => Navigator.pop(context),
            child: const Text(TextConstants.ok),
          ),
        ],
      ),
    );
  }
}
