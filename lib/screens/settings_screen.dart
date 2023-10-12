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
        // alignment: Alignment.center,
        child: Column(children: [
          const LocationWidget(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            alignment: Alignment.centerLeft,
            child: Text(
              'Tools',
              style: poppinsRegularExtended(
                  28, const Color(0xFFFFC100), FontWeight.w600),
            ),
          ),
          const Expanded(child: ToolsWidget()),
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
