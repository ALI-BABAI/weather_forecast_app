import 'package:flutter/material.dart';
import 'package:weather_forecast_app/screens/home_screen/widgets/current%20forecast%20widgets/dotted_divider.dart';
import 'package:weather_forecast_app/screens/home_screen/widgets/current%20forecast%20widgets/extended_parameters.dart';
import 'package:weather_forecast_app/screens/home_screen/widgets/current%20forecast%20widgets/main_weather.dart';
import 'package:weather_forecast_app/theme/colors.dart';
import 'package:weather_forecast_app/theme/text.dart';

class MainForecastWidget extends StatelessWidget {
  final int currentDay;
  final int currentWeekDay;
  final int currentMonth;

  const MainForecastWidget(
      {super.key,
      required this.currentDay,
      required this.currentWeekDay,
      required this.currentMonth});

  @override
  Widget build(BuildContext context) {
    final List<String> monthNames = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    final List<String> dayNames = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];

    final String month = monthNames[currentMonth - 1];
    final String dayOfWeek = dayNames[currentWeekDay - 1];

    return Column(
      children: [
        // День недели и месяц
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: const BoxDecoration(
                // color: Color(0xFF32333E),  // потемнее будет
                color: AppColors.widgetBackground,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: Text(
                '$dayOfWeek, $currentDay $month',
                style: AppTextStyles.smallestSecondaryFont,
              ),
            ),
          ],
        ),
        // Текущая информация о погоде
        const MainWeatherForecast(),
        // Пунктирный разделитель
        const Row(
          children: [
            Expanded(child: DottedDivederWidget()),
          ],
        ),
        // Давление, влажность, сила и направление ветра
        const WeatherExtendedParameters(),
      ],
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