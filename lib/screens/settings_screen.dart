// можно сделать через DRAWER компонент
// https://api.flutter.dev/flutter/material/Drawer-class.html

import 'package:flutter/material.dart';
import 'package:weather_forecast_app/screens/home_screen/home_screen.dart';
import 'package:weather_forecast_app/theme/button.dart';
import 'package:weather_forecast_app/theme/colors.dart';
import 'package:weather_forecast_app/theme/text.dart';

void exitScreen() {}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // скрытие клавиатуры при нажатии на свободную область экрана
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          elevation: 4, // тень
          titleSpacing: 30,
          title: Text(
            'Settings',
            style: poppinsRegularExtended(36, whiteColor, FontWeight.bold),
          ),
          backgroundColor: const Color(0xFF484B5B),
          automaticallyImplyLeading:
              false, // убираем автоматически созданную кнопку "назад"
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: ElevatedButton(
                  onPressed: () {
                    //  Navigator.pushNamed(context, '/second');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                    );
                  },
                  style: AppNavigattionButtonStyle.buttonStyle,
                  child: const Expanded(
                    child: Icon(
                      Icons.close,
                      size: 40,
                    ),
                  )),
            ),
          ],
        ),
        body: DecoratedBox(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF484B5B), Color(0xFF2C2D35)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: ListView(children: [
            LocationWidget(),
            const ToolsWidget(),
          ]),
        ),
      ),
    );
  }
}

class Cities {
  final String cityName;
  final String cityWeather;

  Cities({required this.cityName, required this.cityWeather});
}

class LocationWidget extends StatelessWidget {
  final _cities = [
    Cities(cityName: 'Moscow, Ru', cityWeather: '29° , Clear'),
    Cities(cityName: 'Naples, ITA', cityWeather: '39° , Partly cloudy'),
    Cities(cityName: 'Vorkuta, Ru', cityWeather: '-40° , Warm'),
  ];

  LocationWidget({super.key});

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
              style: poppinsRegularExtended(28, orangeColor, FontWeight.w500),
            ),
          ),
          TextField(
            // можно ограничить ввод "левых" символов в текстбокс
            // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
              contentPadding: const EdgeInsets.only(left: 20),
              hintText: 'Enter a city name',
              hintStyle: poppinsRegularExtended(18, grayColor, FontWeight.w300),
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                      style: const ButtonStyle(
                        fixedSize:
                            MaterialStatePropertyAll(Size.fromHeight(46)),
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
                            MaterialStatePropertyAll(Size.fromHeight(46)),
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
/*               suffixIcon: TextButton(
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
          ListView.builder(
            itemCount: _cities.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final city = _cities[index];
              return InfoPerCity(currentCity: city);
            },
          ),
        ],
      ),
    );
  }
}

class InfoPerCity extends StatelessWidget {
  final Cities currentCity;

  const InfoPerCity({super.key, required this.currentCity});

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
                  currentCity.cityName,
                  style:
                      poppinsRegularExtended(18, whiteColor, FontWeight.w600),
                ),
                Text(
                  currentCity.cityWeather,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            'Tools',
            style: poppinsRegularExtended(28, orangeColor, FontWeight.w500),
          ),
        ),
        const ToolsElementWidget(
            buttonName: 'Notifications', iconType: Icons.notifications),
        const ToolsElementWidget(
            buttonName: 'Language', iconType: Icons.language),
        const ToolsElementWidget(
            buttonName: 'Seed fedback', iconType: Icons.sms_outlined),
        const ToolsElementWidget(
            buttonName: 'Rate this app', iconType: Icons.star),
        const ToolsElementWidget(
            buttonName: 'Share your weather', iconType: Icons.share)
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
    return SizedBox(
      height: 50,
      child: Padding(
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
      ),
    );
  }
}
