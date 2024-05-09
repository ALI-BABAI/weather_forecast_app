import 'package:flutter/material.dart';
import 'package:weather_forecast_app/generated/l10n.dart';
import 'package:weather_forecast_app/src/presenter/theme/app_colors.dart';
import 'package:weather_forecast_app/src/presenter/theme/app_text_styles.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key, this.widget});

  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    final Widget infoWidget = widget ?? const CircularProgressIndicator();
    return Center(
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
          Text(S.of(context).Weather,
              style: AppTextStyles.loadingScreenFont.copyWith(
                fontSize: 40,
                fontWeight: FontWeight.w600,
              )),
          const SizedBox(height: 5),
          Text(S.of(context).Forecast,
              style: AppTextStyles.loadingScreenFont.copyWith(
                fontSize: 33,
                color: AppColors.gray,
                fontWeight: FontWeight.w400,
              )),
          const SizedBox(
            height: 50,
          ),
          infoWidget
        ],
      ),
    );
  }
}