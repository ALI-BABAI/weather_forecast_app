import 'package:flutter/material.dart';
import 'package:weather_forecast_app/images.dart';
import 'package:weather_forecast_app/theme/colors.dart';
import 'package:weather_forecast_app/theme/text.dart';

import 'package:simple_gradient_text/simple_gradient_text.dart'; //https://pub.dev/packages/simple_gradient_text

class CurrentDayWeatherWidget extends StatelessWidget {
  final int currentDay;
  final int currentWeekDay;
  final int currentMonth;

  const CurrentDayWeatherWidget(
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
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Image(
              fit: BoxFit.fill,
              image: AppIconsExpanded.sunWithRain,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //const SizedBox(width: 30),
                    GradientText('7',
                        style: const TextStyle(
                            fontSize: 100, fontWeight: FontWeight.w700),
                        colors: const [Color(0xFFA2A4B5), Color(0xFF757784)]),
                  ],
                ),
                const Text(
                  'Sunny',
                  style: AppTextStyles.expandedMainFont,
                )
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: AppTextStyles.secondaryFont,
                  children: <TextSpan>[
                    TextSpan(text: '5°/12° Feels like '),
                    TextSpan(
                      text: '7°C',
                      style: AppTextStyles.mainFont,
                    )
                  ],
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: AppTextStyles.secondaryFont,
                  children: <TextSpan>[
                    TextSpan(text: 'Wind '),
                    TextSpan(text: '9 KM', style: AppTextStyles.mainFont),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Table использовать виджет? - не?

// Элементы идетничны, можно создать список - но...
// Отступы MainAxisAlignment и CrossAxisAlignment всё равно требуют
// подстроки и подстолбцы*
class CurrentDayAllParametersWidget extends StatelessWidget {
  const CurrentDayAllParametersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.wb_cloudy_outlined, color: Colors.white),
                      SizedBox(width: 12),
                      Text(
                        'Precipation: ',
                        style: AppTextStyles.secondaryFont,
                      ),
                      Text('21%', style: AppTextStyles.mainFont),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.wind_power_outlined, color: Colors.white),
                      SizedBox(width: 12),
                      Text(
                        'Wind: ',
                        style: AppTextStyles.secondaryFont,
                      ),
                      Text('10 km/h', style: AppTextStyles.mainFont),
                    ],
                  ),
                ]),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.water_drop_outlined, color: Colors.white),
                    SizedBox(width: 12),
                    Text(
                      'Humidity: ',
                      style: AppTextStyles.secondaryFont,
                    ),
                    Text('59%', style: AppTextStyles.mainFont),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.sunny_snowing, color: Colors.white),
                    SizedBox(width: 12),
                    Text(
                      'Sunset: ',
                      style: AppTextStyles.secondaryFont,
                    ),
                    Text('29%', style: AppTextStyles.mainFont),
                  ],
                ),
              ],
            ),
          ])
        ],
      ),
    );
  }
}
