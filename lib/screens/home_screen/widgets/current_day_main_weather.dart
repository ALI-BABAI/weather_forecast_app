import 'package:flutter/material.dart';
import 'package:weather_forecast_app/theme/text.dart';
import 'package:weather_forecast_app/theme/colors.dart';

import 'package:simple_gradient_text/simple_gradient_text.dart'; //https://pub.dev/packages/simple_gradient_text

class CurrentDayWeatherWidget extends StatelessWidget {
  const CurrentDayWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: const BoxDecoration(
                color: Color(0xFF32333E),
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: Text(
                'Saturday, 1 Oct',
                style: poppinsRegularExtended(12, grayColor, FontWeight.w200),
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
                image: AssetImage('assets/images/final/3x/rain.png')),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GradientText('14°',
                        style: const TextStyle(
                            fontSize: 100, fontWeight: FontWeight.w700),
                        colors: const [Color(0xFFA2A4B5), Color(0xFF757784)]),
                  ],
                ),
                Text(
                  'Sunny',
                  style:
                      poppinsRegularExtended(18, whiteColor, FontWeight.w500),
                )
              ],
            )
          ],
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RichText(
              text: TextSpan(
                style: poppinsRegularExtended(12, grayColor, FontWeight.w300),
                children: <TextSpan>[
                  const TextSpan(text: '29°/27° | Feels like '),
                  TextSpan(
                    text: '39°C',
                    style:
                        poppinsRegularExtended(12, whiteColor, FontWeight.w300),
                  )
                ],
              ),
            ),
            Text('|',
                style: poppinsRegularExtended(12, grayColor, FontWeight.w300)),
            RichText(
              text: TextSpan(
                style: poppinsRegularExtended(12, grayColor, FontWeight.w300),
                children: <TextSpan>[
                  const TextSpan(text: 'Wind '),
                  TextSpan(
                    text: '9 KM',
                    style:
                        poppinsRegularExtended(12, whiteColor, FontWeight.w300),
                  ),
                  const TextSpan(text: '/H WSW'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// Элементы идетничны, можно создать список - но...
// Отступы MainAxisAlignment и CrossAxisAlignment всё равно требуют
// подстроки и подстолбцы*
class CurrentDayAllParametersWidget extends StatelessWidget {
  const CurrentDayAllParametersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(Icons.wb_cloudy_outlined, color: Colors.white),
                Text(
                  '   Precipation: ',
                  style: poppinsRegularExtended(14, grayColor, FontWeight.w300),
                ),
                Text('21%',
                    style: poppinsRegularExtended(
                        14, whiteColor, FontWeight.w300)),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.wind_power_outlined, color: Colors.white),
                Text(
                  '   Wind: ',
                  style: poppinsRegularExtended(14, grayColor, FontWeight.w300),
                ),
                Text('10 km/h',
                    style: poppinsRegularExtended(
                        14, whiteColor, FontWeight.w300)),
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
                    const Icon(Icons.water_drop_outlined, color: Colors.white),
                    Text(
                      '   Humidity: ',
                      style: poppinsRegularExtended(
                          14, grayColor, FontWeight.w300),
                    ),
                    Text('59%',
                        style: poppinsRegularExtended(
                            14, whiteColor, FontWeight.w300)),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.sunny_snowing, color: Colors.white),
                    Text(
                      '   Sunset: ',
                      style: poppinsRegularExtended(
                          14, grayColor, FontWeight.w300),
                    ),
                    Text('29%',
                        style: poppinsRegularExtended(
                            14, whiteColor, FontWeight.w300)),
                  ],
                ),
              ]),
        ])
      ],
    );
  }
}