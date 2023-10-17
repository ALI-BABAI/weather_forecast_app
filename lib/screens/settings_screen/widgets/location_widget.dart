import 'package:flutter/material.dart';
import 'package:weather_forecast_app/theme/text.dart';

import '../../../theme/colors.dart';

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
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
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
