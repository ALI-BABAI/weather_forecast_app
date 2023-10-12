import 'package:flutter/material.dart';
import 'package:weather_forecast_app/theme/colors.dart';
import 'package:weather_forecast_app/theme/text.dart';

// #ГОВНОКОД: -ручное задание высоты строк...
class PerSevenDaysForecastWidget extends StatelessWidget {
  const PerSevenDaysForecastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Color(0x1F000000),
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
                for (int i = 1; i < 8; i++)
                  InfoPerDay(
                    day: '$i October',
                    weatherImage: 'assets/images/final/1x/sun.png',
                  ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 38,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'low',
                        style: poppinsRegularExtended(
                            15, whiteColor, FontWeight.w300),
                      ),
                      Text(
                        'high',
                        style: poppinsRegularExtended(
                            15, whiteColor, FontWeight.w300),
                      )
                    ],
                  ),
                ),
                for (int i = 0; i < 7; i++)
                  SizedBox(
                    height: 38,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '26°',
                          style: poppinsRegularExtended(
                              15, whiteColor, FontWeight.w300),
                        ),
                        Text(
                          '28°',
                          style: poppinsRegularExtended(
                              15, whiteColor, FontWeight.w300),
                        )
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InfoPerDay extends StatelessWidget {
  final String day;
  final String weatherImage;

  const InfoPerDay({super.key, required this.day, required this.weatherImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(day,
                style: poppinsRegularExtended(15, whiteColor, FontWeight.w300)),
            Image(
              image: AssetImage(weatherImage),
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
        color: Color(0x1F000000),
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
        color: Color(0x1F000000),
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