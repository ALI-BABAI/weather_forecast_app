import 'package:flutter/material.dart';
import 'package:weather_forecast_app/theme/app_colors.dart';
import 'package:weather_forecast_app/theme/app_decoration.dart';
import 'package:weather_forecast_app/theme/app_text_styles.dart';
import 'package:weather_forecast_app/theme/src/text_constants.dart';

// Иконка приложения + название + опциональный виджет
class LoadingWidget extends StatelessWidget {
  final Widget? widget;
  const LoadingWidget({super.key, this.widget});

  @override
  Widget build(BuildContext context) {
    final Widget infoWidget = widget ?? const CircularProgressIndicator();
    return DecoratedBox(
      decoration: AppDecorations.lightDecorationTheme,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/images/app_logo.png'),
              height: 275,
              width: 275,
            ),
            const SizedBox(height: 5),
            Text(AppTextConstants.weather,
                style: AppTextStyles.poppinsFont(
                  fontSize: 40,
                  color: AppColors.darkBlue,
                  fontWeight: FontWeight.w600,
                )),
            const SizedBox(height: 5),
            Text(AppTextConstants.forecast,
                style: AppTextStyles.poppinsFont(
                  fontSize: 33,
                  color: AppColors.gray,
                  fontWeight: FontWeight.w400,
                )),
            const SizedBox(
              height: 150,
            ),
            infoWidget,
          ],
        ),
      ),
    );
  }
}
