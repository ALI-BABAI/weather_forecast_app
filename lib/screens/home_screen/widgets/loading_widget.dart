import 'package:flutter/material.dart';
import 'package:weather_forecast_app/theme/app_colors.dart';
import 'package:weather_forecast_app/theme/app_text_styles.dart';

// Иконка приложения + название + опциональный виджет
class LoadingWidget extends StatelessWidget {
  final Widget Function() infoWidget;
  const LoadingWidget({super.key, required this.infoWidget});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.white,
          gradient: LinearGradient(
            colors: [Color(0xFFBCC8D6), Color(0xFFF2F4F7)],
            begin: Alignment.bottomCenter,
            end: Alignment.center,
          ),
        ),
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
              Text(
                'Weather',
                style: poppinsRegularExtended(
                    40, AppColors.darkBlue, FontWeight.w600),
              ),
              const SizedBox(height: 5),
              Text(
                'Forecast',
                style:
                    poppinsRegularExtended(33, AppColors.gray, FontWeight.w400),
              ),
              const SizedBox(
                height: 150,
              ),
              // опциональный виджет
              infoWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
