import 'package:flutter/material.dart';
import 'package:weather_forecast_app/theme/app_colors.dart';
import 'package:weather_forecast_app/theme/app_text_styles.dart';
import 'package:weather_forecast_app/theme/src/text_constants.dart';

// Всплывающие окна приложения
abstract class AppAllertWindow {
  // Переключение единиц измерения
  static changeMeasurementUnits(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: AppColors.mainBackground,
        title: const Text(
          AppTextConstants.allertTitleAppUnits,
          style: AppTextStyles.settingsScreenHeaderFont,
        ),
        actionsAlignment: MainAxisAlignment.spaceAround,
        actions: <Widget>[
          Row(
            children: [
              const Expanded(
                child: Text(AppTextConstants.allertPointTemperature,
                    style: AppTextStyles.expandedMainFont),
              ),
              TextButton(
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(AppColors.orange)),
                onPressed: () => Navigator.pop(context),
                child: const Text(AppTextConstants.celsiumDegree,
                    style: AppTextStyles.expandedMainFont),
              ),
              const SizedBox(width: 15),
              TextButton(
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(AppColors.orange)),
                onPressed: () => Navigator.pop(context),
                child: const Text(AppTextConstants.fahrenheitDegree,
                    style: AppTextStyles.expandedMainFont),
              ),
            ],
          ),
          Row(
            children: [
              const Expanded(
                  child: Text(AppTextConstants.allertPointPressure,
                      style: AppTextStyles.expandedMainFont)),
              TextButton(
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(AppColors.orange)),
                onPressed: () => Navigator.pop(context),
                child: const Text(AppTextConstants.unitHPa,
                    style: AppTextStyles.expandedMainFont),
              ),
              const SizedBox(width: 15),
              TextButton(
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(AppColors.orange)),
                onPressed: () => Navigator.pop(context),
                child: const Text(AppTextConstants.unitMmHg,
                    style: AppTextStyles.expandedMainFont),
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
            Text(AppTextConstants.allertTitleProblem),
          ],
        ),
        backgroundColor: AppColors.orange,
        content: const Text(AppTextConstants.allertMessageCantFindCity),
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
            child: const Text(AppTextConstants.ok),
          ),
        ],
      ),
    );
  }
  // Город уже существует в списке сохранённых
  static warningCityAlreadyExist(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.error_outline, color: Colors.black),
            Text(AppTextConstants.allertTitleProblem),
          ],
        ),
        backgroundColor: AppColors.orange,
        content: const Text(AppTextConstants.allertMessageCityAlreadyExiset),
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
            child: const Text(AppTextConstants.ok),
          ),
        ],
      ),
    );
  }
}
