import 'package:flutter/material.dart';
import 'package:weather_forecast_app/images.dart';
import 'package:weather_forecast_app/theme/colors.dart';
import 'package:weather_forecast_app/theme/text.dart';

class ForecastPerSevenDaysWidget extends StatelessWidget {
  final int currentDay;
  final int currentMonth; // из DateTime.now() выводится дд.мм.гггг

  const ForecastPerSevenDaysWidget(
      {super.key, required this.currentDay, required this.currentMonth});

  @override
  Widget build(BuildContext context) {
    // для преобразования (int)мм в (string)месяц
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
    return Padding(
      padding: const EdgeInsets.all(16),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: AppColors.widgetBackground,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 38,
                  ),
                  for (int i = 0; i < 7; i++)
                    InfoPerDay(
                      day: currentDay + i,
                      month: monthNames[currentMonth - 1],
                      weatherImage: AppIconsMini.thunder,
                    ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 38,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'low',
                          style: AppTextStyles.mainFont,
                        ),
                        Text(
                          'high',
                          style: AppTextStyles.mainFont,
                        )
                      ],
                    ),
                  ),
                  for (int i = 0; i < 7; i++)
                    const SizedBox(
                      height: 38,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            '26°',
                            style: AppTextStyles.mainFont,
                          ),
                          Text(
                            '28°',
                            style: AppTextStyles.mainFont,
                          )
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoPerDay extends StatelessWidget {
  final int day;
  final String month;
  final AssetImage weatherImage;

  const InfoPerDay(
      {super.key,
      required this.day,
      required this.weatherImage,
      required this.month});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('$day $month', style: AppTextStyles.mainFont),
          Image(
            image: weatherImage,
          ),
        ],
      ),
    );
  }
}
