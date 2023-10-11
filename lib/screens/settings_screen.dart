import 'package:flutter/material.dart';
import 'package:weather_forecast_app/screens/home_screen/home_screen.dart';
import 'package:weather_forecast_app/theme/colors.dart';
import 'package:weather_forecast_app/theme/text.dart';

void exitScreen() {}

// Адаптивное изменение отступов в поле 'TOOLS'
// Создать список кнопок и добавить оптимизацию кода
// Виджет IconButton теряет свои визуальные эффекты при нажатии
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF484B5B),
        ),
        alignment: Alignment.center,
        child: ListView(children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Settings',
                          style: poppinsRegularExtended(
                              36, whiteColor, FontWeight.w900),
                        ),
                        IconButton(
                          onPressed: () {
                            // Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()));
                          },
                          icon: const Icon(
                            //Icons.cancel_rounded,
                            Icons.menu_open,
                            color: whiteColor,
                            size: 36,
                          ),
                        )
                      ]),
                ),
                const Divider(color: grayColor, thickness: 0.1),
                const LocationWidget(),
                const Divider(color: grayColor, thickness: 0.1),
                Column(children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Tools',
                      style: poppinsRegularExtended(
                          28, const Color(0xFFFFC100), FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            const Icon(Icons.notifications,
                                color: whiteColor, size: 30),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Notifications',
                                style: poppinsRegularExtended(
                                    20, whiteColor, FontWeight.w500),
                              ),
                            ),
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            const Icon(Icons.language,
                                color: whiteColor, size: 30),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Language',
                                style: poppinsRegularExtended(
                                    20, whiteColor, FontWeight.w500),
                              ),
                            ),
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            const Icon(Icons.sms_outlined,
                                color: whiteColor, size: 30),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Seed fedback',
                                style: poppinsRegularExtended(
                                    20, whiteColor, FontWeight.w500),
                              ),
                            ),
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            const Icon(Icons.star, color: whiteColor, size: 30),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Rate this app',
                                style: poppinsRegularExtended(
                                    20, whiteColor, FontWeight.w500),
                              ),
                            ),
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            const Icon(Icons.share,
                                color: whiteColor, size: 30),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Share your weather',
                                style: poppinsRegularExtended(
                                    20, whiteColor, FontWeight.w500),
                              ),
                            ),
                          ],
                        )),
                  ),
                ])
              ]),
        ]),
      ),
    );
  }
}

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                'Location',
                style: poppinsRegularExtended(
                    28, const Color(0xFFFFC100), FontWeight.w600),
              )),
              Text(
                '|',
                style: poppinsRegularExtended(16, Colors.cyan, FontWeight.w300),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'add',
                  style:
                      poppinsRegularExtended(20, Colors.cyan, FontWeight.w300),
                ),
              )
            ],
          ),
          // Добавить лист выбранных городов и распарсив его выводить виджет
          const InfoPerCity(cityName: 'Moscow, RU', cityWeather: '29° , Clear'),

          const InfoPerCity(
              cityName: 'Naples, ITA', cityWeather: '39° , Partly cloudy'),
        ],
      ),
    );
  }
}

// Добавить лист выбранных городов
class InfoPerCity extends StatelessWidget {
  final String cityName;
  final String cityWeather;
  const InfoPerCity(
      {super.key, required this.cityName, required this.cityWeather});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.location_on,
              size: 40,
              color: whiteColor,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cityName,
                  style:
                      poppinsRegularExtended(18, whiteColor, FontWeight.w600),
                ),
                Text(
                  cityWeather,
                  style: poppinsRegularExtended(14, grayColor, FontWeight.w500),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
