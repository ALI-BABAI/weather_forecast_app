import 'package:flutter/material.dart';
import 'package:weather_forecast_app/theme/text.dart';
import 'package:weather_forecast_app/theme/colors.dart';

import 'package:simple_gradient_text/simple_gradient_text.dart'; //https://pub.dev/packages/simple_gradient_text

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFF484B5B), Color(0xFF2C2D35)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  tileMode: TileMode.decal),
            ),
            alignment: Alignment.center,
            child: ListView(
              children: [
                // const SizedBox(
                //     height:
                //         50), // ГОВНОКОД (как сделать отступ от верхней части экрана?)
                const Divider(color: grayColor, thickness: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        'Moscow, Russia',
                        style: poppinsRegularExtended(
                            24, whiteColor, FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const IconButton(
                      onPressed: settingButtonPressed,
                      icon: Icon(
                        Icons.settings,
                        color: whiteColor,
                        size: 24,
                      ),
                    )
                  ],
                ),
                const Divider(color: grayColor, thickness: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: const BoxDecoration(
                        color: Color(0xFF32333E),
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      child: Text(
                        'Saturday, 1 Oct',
                        style: poppinsRegularExtended(
                            12, grayColor, FontWeight.w200),
                      ),
                    ),
                  ],
                ),
                const Divider(color: grayColor, thickness: 1),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Image(
                      image:
                          AssetImage('assets/images/homeScreenMainWeather.png'),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 30), // ГОВНОКОД
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              GradientText('33',
                                  style: const TextStyle(
                                      fontSize: 72,
                                      fontWeight: FontWeight.w700),
                                  colors: const [
                                    Color(0xFFA2A4B5),
                                    Color(0xFF757784)
                                  ]),
                              const Text('°',
                                  style: TextStyle(
                                      fontSize: 64,
                                      fontWeight: FontWeight.w200,
                                      color: Color(0xFF757784))),
                            ],
                          ),
                          Text(
                            'Partly cloudy',
                            style: poppinsRegularExtended(
                                14, whiteColor, FontWeight.w300),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const Divider(color: grayColor, thickness: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RichText(
                        text: TextSpan(
                            style: poppinsRegularExtended(
                                14, grayColor, FontWeight.w300),
                            children: <TextSpan>[
                          const TextSpan(text: '29°/27° | Feels like '),
                          TextSpan(
                            text: '39°C',
                            style: poppinsRegularExtended(
                                14, whiteColor, FontWeight.w300),
                          ),
                          const TextSpan(text: '          |          Wind '),
                          TextSpan(
                            text: '9 KM',
                            style: poppinsRegularExtended(
                                14, whiteColor, FontWeight.w300),
                          ),
                          const TextSpan(text: '/H WSW'),
                        ])),
                    // Text(
                    //   '29°/27° | Feels like 39°C          |          Wind 9 KM/H WSW',
                    //   style: poppinsRegularExtended(14, grayColor, FontWeight.w300),
                    // )
                  ],
                ),
                const Divider(color: grayColor, thickness: 1),
                const SizedBox(height: 25),
                // Уверен что есть иной способ обернуть это... каждый блок идентичен
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Icon(Icons.wb_cloudy_outlined,
                                    color: Colors.white),
                                Text(
                                  '   Precipation: ',
                                  style: poppinsRegularExtended(
                                      14, grayColor, FontWeight.w300),
                                ),
                                Text('21%',
                                    style: poppinsRegularExtended(
                                        14, whiteColor, FontWeight.w300)),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(Icons.wind_power_outlined,
                                    color: Colors.white),
                                Text(
                                  '   Wind: ',
                                  style: poppinsRegularExtended(
                                      14, grayColor, FontWeight.w300),
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
                                const Icon(Icons.water_drop_outlined,
                                    color: Colors.white),
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
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.sunny_snowing,
                                    color: Colors.white),
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
                    ]),
                // Разделитель должен быть пунктирным...
                const Divider(
                    color: Color(0x10979797), // цвет 979797 с заполнением 16процентов == 0x10979797
                    thickness: 1,
                    indent: 20,
                    endIndent: 20),
                const Center(
                  child: Text(
                    'Разделитель должен быть пунктирным',
                    style: TextStyle(
                        color: Color(0xFF0A0A22),
                        decoration: TextDecoration.underline,
                        decorationColor: whiteColor,
                        decorationThickness: 1,
                        decorationStyle: TextDecorationStyle.dashed),
                  ),
                ),

                const SizedBox(
                  height: 50,
                ),
                const Placeholder(
                  fallbackHeight: 100,
                  fallbackWidth: 400,
                ),
                const SizedBox(
                  height: 50,
                ),
                const Placeholder(
                  fallbackHeight: 1000,
                  fallbackWidth: 400,
                ),
              ],
            )));
  }
}

void settingButtonPressed() {}
