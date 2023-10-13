// можно сделать через DRAWER компонент
// https://api.flutter.dev/flutter/material/Drawer-class.html

import 'package:flutter/material.dart';
import 'package:weather_forecast_app/screens/home_screen/home_screen.dart';
import 'package:weather_forecast_app/theme/colors.dart';
import 'package:weather_forecast_app/theme/text.dart';

void exitScreen() {}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4, // тень
        titleSpacing: 30,
        title: Text(
          'Settings',
          style: poppinsRegularExtended(36, whiteColor, FontWeight.w600),
        ),
        backgroundColor: const Color(0xFF484B5B),
        automaticallyImplyLeading:
            false, // убираем автоматически созданную кнопку "назад"
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 30),
            child: IconButton(
              padding: const EdgeInsets.only(right: 1),
              splashRadius: 20,
              icon: const Icon(Icons.close, size: 40),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              },
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF484B5B),
        ),
        child: ListView(children: [
          // Добавить вывод textField-а  при нажатии на кнопку.
          const LocationWidget(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            alignment: Alignment.centerLeft,
            child: Text(
              'Tools',
              style: poppinsRegularExtended(28, orangeColor, FontWeight.w600),
            ),
          ),
          const Expanded(child: ToolsWidget()),
        ]),
      ),
    );
  }
}

// Добавить вывод textField-а  при нажатии на кнопку.
class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Location',
              style: poppinsRegularExtended(28, orangeColor, FontWeight.w600),
            ),
          ),
          TextField(
            readOnly: false,
            autocorrect: true,
            keyboardAppearance: Brightness.dark,
            textCapitalization: TextCapitalization.words,
            style: poppinsRegularExtended(20, whiteColor, FontWeight.w300),
            cursorColor: Colors.cyan,
            // событие при нажатии на кнопку клавиатуры == продолжить
            onSubmitted: (String text) {
              print('on submitted --> $text');
            },
            // стили
            decoration: InputDecoration(
              isCollapsed: true,
              // костыль,  текст прижимается к верху
              contentPadding: const EdgeInsets.only(left: 20, top: 16),
              hintText: 'Enter a city name',
              hintStyle: poppinsRegularExtended(18, grayColor, FontWeight.w300),
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                      style: const ButtonStyle(
                        fixedSize:
                            MaterialStatePropertyAll(Size.fromHeight(45)),
                      ),
                      onPressed: () {},
                      child: const Icon(
                        Icons.add_location_alt_outlined,
                        color: orangeColor,
                        size: 30,
                      )),
                  TextButton(
                    style: const ButtonStyle(
                        // костыль, но красиво)
                        fixedSize:
                            MaterialStatePropertyAll(Size.fromHeight(45)),
                        backgroundColor: MaterialStatePropertyAll(orangeColor)),
                    onPressed: () {
                      // поиск города, сборка данных по городу и добавление в список городов приложения
                    },
                    child: Text(
                      'add',
                      style:
                          // poppinsRegularExtended(22, Color(0xFF484B5B), FontWeight.bold),
                          poppinsRegularExtended(
                              22, Colors.black, FontWeight.bold),
                    ),
                  ),
                ],
              ),
              /*  suffixIcon: TextButton(
                  style: const ButtonStyle(
                    fixedSize: MaterialStatePropertyAll(Size.fromHeight(45)),
                  ),
                  onPressed: () {},
                  child: const Icon(
                    Icons.add_location_alt_outlined,
                    color: orangeColor,
                    size: 30,
                  )), */
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: orangeColor),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: orangeColor),
              ),
            ),
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
        const SizedBox(height: 25),
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
                const SizedBox(height: 10),
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

class ToolsWidget extends StatelessWidget {
  const ToolsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Column(children: [
          ToolsElementWidget(
              buttonName: 'Notifications', iconType: Icons.notifications),
          ToolsElementWidget(buttonName: 'Language', iconType: Icons.language),
          ToolsElementWidget(
              buttonName: 'Seed fedback', iconType: Icons.sms_outlined),
          ToolsElementWidget(buttonName: 'Rate this app', iconType: Icons.star),
          ToolsElementWidget(
              buttonName: 'Share your weather', iconType: Icons.share),
        ])
      ],
    );
  }
}

class ToolsElementWidget extends StatelessWidget {
  final String buttonName;
  final IconData iconType;

  const ToolsElementWidget(
      {super.key, required this.buttonName, required this.iconType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextButton(
          onPressed: () {},
          child: Row(
            children: [
              Icon(iconType, color: whiteColor, size: 30),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  buttonName,
                  style:
                      poppinsRegularExtended(20, whiteColor, FontWeight.w500),
                ),
              ),
            ],
          )),
    );
  }
}
