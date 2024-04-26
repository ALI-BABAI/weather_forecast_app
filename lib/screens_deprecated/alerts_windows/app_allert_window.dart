import 'package:flutter/material.dart';
import 'package:weather_forecast_app/generated/l10n.dart';
import 'package:weather_forecast_app/presenter/theme/app_colors.dart';
import 'package:weather_forecast_app/presenter/theme/app_text_styles.dart';

abstract class AppAllertWindow {
  static changeMeasurementUnits(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: AppColors.mainBackground,
        title: Text(
          S.of(context).appUnits,
          style: AppTextStyles.settingsScreenHeaderFont,
        ),
        actionsAlignment: MainAxisAlignment.spaceAround,
        actions: <Widget>[
          Row(
            children: [
              Text(
                S.of(context).temperatureUnit,
                style: AppTextStyles.expandedMainFont,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('°C', style: AppTextStyles.mainFont),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('°F', style: AppTextStyles.mainFont),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                S.of(context).pressureUnit,
                style: AppTextStyles.expandedMainFont,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  S.of(context).hpaUnit,
                  style: AppTextStyles.mainFont,
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  S.of(context).mmhgUnit,
                  style: AppTextStyles.mainFont,
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
        title: Row(
          children: [
            const Icon(Icons.error_outline, color: Colors.black),
            Text(S.of(context).haveProblem),
          ],
        ),
        backgroundColor: AppColors.orange,
        content: Text(S.of(context).notFoundCityPleaseCheckInputAndTryAgain),
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
            child: Text(S.of(context).ok),
          ),
        ],
      ),
    );
  }

  static warningCityAlreadyExist(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Row(
          children: [
            const Icon(Icons.error_outline, color: Colors.black),
            Text(S.of(context).haveProblem),
          ],
        ),
        backgroundColor: AppColors.orange,
        content: Text(S.of(context).theCityHasAlreadyBeenSaved),
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
            child: Text(S.of(context).ok),
          ),
        ],
      ),
    );
  }
}
