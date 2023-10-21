import 'package:flutter/material.dart';
import 'package:weather_forecast_app/images.dart';
import 'package:weather_forecast_app/theme/colors.dart';
import 'package:weather_forecast_app/theme/text.dart';

// #ГОВНОКОД: -ручное задание высоты строк...
class ForecastPerSevenDaysWidget extends StatelessWidget {
  final int currentDay;
  final int currentMonth; // в цифрах почему то...

  const ForecastPerSevenDaysWidget(
      {super.key, required this.currentDay, required this.currentMonth});

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
    return Padding(
      padding: const EdgeInsets.all(16),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: backgraundColor,
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
          ]),
    );
  }
}

/* 
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: backgraundColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Text('low'), Text('high')]),
          InfoPerDay(
              day: '1 October',
              maxTemperature: '26°',
              minTemperature: '20°',
              weatherImage: 'assets/images/final/1x/sun.png'),
          InfoPerDay(
              day: '2 October',
              maxTemperature: '26°',
              minTemperature: '20°',
              weatherImage: 'assets/images/final/1x/rain.png'),
          InfoPerDay(
              day: '3 October',
              maxTemperature: '26°',
              minTemperature: '20°',
              weatherImage: 'assets/images/final/1x/thunder.png'),
          InfoPerDay(
              day: '4 October',
              maxTemperature: '26°',
              minTemperature: '20°',
              weatherImage: 'assets/images/final/1x/sun + small cloud.png'),
          InfoPerDay(
              day: '5 October',
              maxTemperature: '26°',
              minTemperature: '20°',
              weatherImage: 'assets/images/final/1x/sun + cloud.png'),
          InfoPerDay(
              day: '6 October',
              maxTemperature: '26°',
              minTemperature: '20°',
              weatherImage: 'assets/images/final/1x/thunder.png'),
          InfoPerDay(
              day: '7 October',
              maxTemperature: '26°',
              minTemperature: '20°',
              weatherImage: 'assets/images/final/1x/thunder.png'),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('F°'),
                Text('C°'),
              ]),
        ],
      ),
    );
  }
} */
// kek

/* 
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: backgraundColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: const SizedBox(
        height: 400,
        width: 400,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(' '),
                  Text('1 October'),
                  Text('2 October'),
                  Text('3 October'),
                  Text('4 October'),
                  Text('5 October'),
                  Text('6 October'),
                  Text('7 October'),
                  Text(' '),
                ]),
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Text(''),
              Image(
                image: AssetImage('assets/images/final/1x/sun + rain1.png'),
              ),
              Image(
                image: AssetImage('assets/images/final/1x/sun.png'),
              ),
              Image(
                image: AssetImage('assets/images/final/1x/sun.png'),
              ),
              Image(
                image: AssetImage('assets/images/final/1x/thunder.png'),
              ),
              Image(
                image: AssetImage('assets/images/final/1x/rain.png'),
              ),
              Image(
                image:
                    AssetImage('assets/images/final/1x/sun + small cloud.png'),
              ),
              Image(
                image: AssetImage('assets/images/final/1x/sun + cloud.png'),
              ),
              Text(' '),
            ]),
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Text('low'),
              Text('20°'),
              Text('20°'),
              Text('20°'),
              Text('20°'),
              Text('20°'),
              Text('20°'),
              Text('20°'),
              Text('F°'),
            ]),
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Text('high'),
              Text('25°'),
              Text('25°'),
              Text('25°'),
              Text('25°'),
              Text('25°'),
              Text('25°'),
              Text('25°'),
              Text('C°'),
            ])
          ],
        ),
      ),
    );
  }
}
 */
