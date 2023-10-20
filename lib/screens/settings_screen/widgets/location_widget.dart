import 'package:flutter/material.dart';
import 'package:weather_forecast_app/theme/text.dart';

import '../../../theme/colors.dart';

final List<Cities> _cities = []; // global is not reccomended
// final Set<Cities> _cities = {}; // global is not reccomended

class Cities {
  final String cityName;
  final String cityWeather;

  Cities({required this.cityName, required this.cityWeather});
}

class LocationWidget extends StatefulWidget {
  const LocationWidget({super.key});

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
// final List<Cities> _cities = [
//      Cities(cityName: 'Moscow, Ru', cityWeather: '29° , Clear'),
//      Cities(cityName: 'Naples, ITA', cityWeather: '39° , Partly cloudy'),
//      Cities(cityName: 'Vorkuta, Ru', cityWeather: '-40° , Warm'),
// ];
  String _userAddedCity = '';
  // late String _userAddedCity;

  @override
  void initState() {
    super.initState();

// дебаг
    if (_cities.isEmpty) {
      _cities.addAll([
        Cities(cityName: 'Moscow, Ru', cityWeather: '29° , Clear'),
        Cities(cityName: 'Naples, ITA', cityWeather: '39° , Partly cloudy'),
        Cities(cityName: 'Vorkuta, Ru', cityWeather: '-40° , Warm'),
      ]);
    }
  }

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
            onSubmitted: (String text) {
              print('on submitted --> $text');
              if (text.isNotEmpty) {
                setState(() {
                  _userAddedCity = text;
                  _cities.add(
                    Cities(
                        cityName: _userAddedCity, cityWeather: 'время покажет'),
                  );
                });
              }
            },
            onChanged: (String text) => _userAddedCity = text,

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
                      if (_userAddedCity.isNotEmpty) {
                        setState(() {
                          _cities.add(
                            Cities(
                                cityName: _userAddedCity,
                                cityWeather: 'время покажет'),
                          );
                          FocusScope.of(context).unfocus();
                        });
                      }
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
              return Dismissible(
                // a dismissed Dissmissible widget is still part of the three
                // key: Key(city.toString()), // не работает
                // key: Key(city.cityName),   // работает
                key: UniqueKey(),
                child: InfoPerCity(
                  currentCity: city,
                  indexToDelete: index,
                ),
                onDismissed: (direction) {
                  setState(() {
                    _cities.removeAt(index);
                  });
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class InfoPerCity extends StatelessWidget {
  final Cities currentCity;
  final int indexToDelete;

  const InfoPerCity(
      {super.key, required this.currentCity, required this.indexToDelete});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
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
                      style: poppinsRegularExtended(
                          18, whiteColor, FontWeight.w600),
                    ),
                    Text(
                      currentCity.cityWeather,
                      style: poppinsRegularExtended(
                          14, grayColor, FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
            // Удаление происходит из списка, но нужно перезапустить экран
            // нужно в обработчик нажатия добавить setState, но это недоступно...
            OutlinedButton(
                onPressed: () {
                  _cities.removeAt(indexToDelete);
                },
                style: const ButtonStyle(
                    fixedSize: MaterialStatePropertyAll(Size(30, 30)),
                    side: MaterialStatePropertyAll(BorderSide.none)),
                child: const Icon(
                  Icons.delete_forever,
                  color: orangeColor,
                  size: 35,
                ))
          ],
        ),
      ],
    );
  }
}
