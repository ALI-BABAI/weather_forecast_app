import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_forecast_app/data_handling/api_client.dart';
import 'package:weather_forecast_app/data_handling/serialisator/cities.dart';
import 'package:weather_forecast_app/data_handling/serialisator/weather_data.dart';
import 'package:weather_forecast_app/main.dart';
import 'package:weather_forecast_app/screens/settings_screen/widgets/location/location_items.dart';
import 'package:weather_forecast_app/screens/settings_screen/widgets/location/saved_city_info_widget.dart';
import 'package:weather_forecast_app/theme/colors.dart';
import 'package:weather_forecast_app/theme/text.dart';

/* show rootBundle;  прописывается для явного импорта только rootBundle из пакета
// flutter/services.dart. Это позволяет избежать импорта всех символов из пакета
// и использовать только необходимый класс или функцию.
// Это полезно для оптимизации размера кода и избежания конфликтов имен*/
import 'package:flutter/services.dart' show rootBundle;

class LocationWidget extends StatefulWidget {
  const LocationWidget({super.key});

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  final TextEditingController _cityController = TextEditingController();
  String? cityName;
  String? cityCountry;
  double? cityLon;
  double? cityLat;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Location - заголовок
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
            child:
                Text('Location', style: AppTextStyles.settingsScreenHeaderFont),
          ),
          // TextField
          SizedBox(
            height: 46,
            child: TextField(
              controller: _cityController,
              onSubmitted: (value) => _checkCity(value),
              keyboardAppearance: Brightness.dark,
              textCapitalization: TextCapitalization.words,
              style: AppTextStyles.expandedMainFont,
              cursorColor: Colors.cyan,
              // стили
              decoration: InputDecoration(
                hintText: 'Enter a city name',
                hintStyle: AppTextStyles.secondaryFont,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.orange),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.orange),
                ),
                // кнопки в текстовом поле
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // geopozition btn
                    TextButton(
                      onPressed: () {},
                      child: const Icon(
                        Icons.add_location_alt_outlined,
                        color: AppColors.orange,
                        size: 30,
                      ),
                    ),
                    // ADD btn
                    SizedBox(
                      height: 50,
                      child: TextButton(
                        onPressed: () => _checkCity(_cityController.text),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(AppColors.orange),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        child: Text(
                          'add',
                          style: poppinsRegularExtended(
                            22,
                            Colors.black,
                            FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Блок сохранённых городов
          // if (savedCities.isNotEmpty)
          ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: savedCitiesData!.favouriteCities.length,
            itemBuilder: (context, index) {
              final savedCity = savedCitiesData!.favouriteCities[index];
              return Dismissible(
                key: UniqueKey(),
                child: SavedCityInfo(
                  index: index,
                  currentCity: savedCity,
                  deleteItem: () {
                    setState(
                      () => savedCities.removeAt(index),
                    );
                  },
                ),
                onDismissed: (direction) {
                  setState(
                    () => savedCities.removeAt(index),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  // проверка введённого текста с сохранённым списком городов
  // сохранение в случае совпадения в глобальный файл
  void _checkCity(String userString) async {
    late String jsonString;

    try {
      // Загрузка данных из файла city_list.json
      jsonString = await rootBundle.loadString('assets/city_list.json');
      final List<dynamic> citiesData = json.decode(jsonString);

      // Преобразование данных в объекты City
      final List<ApiCity> cityItem =
          citiesData.map((json) => ApiCity.fromJson(json)).toList();

      // Поиск введённого города из списка
      final ApiCity selectedCity = cityItem.firstWhere(
        (city) => city.name.toLowerCase() == userString.toLowerCase(),
        orElse: () => ApiCity(
          name: '',
          country: '',
          location: Location(lon: 0.0, lat: 0.0),
        ),
      );

      WeatherData? selectedCityWeatherData;

      // Проверка на совпадение города +
      // вот тут нужно сохранять в файл.
      if (selectedCity.name != '') {
        savedCitiesData!.favouriteCities.add(ApiCity(
          name: selectedCity.name,
          country: selectedCity.country,
          location: selectedCity.location,
        ));
        // записываем в файл
        await savedCitiesFile.writeAsString(jsonEncode(savedCitiesData));

        // cityName = selectedCity.name;
        // cityCountry = selectedCity.country;
        // cityLon = selectedCity.location.lon;
        // cityLat = selectedCity.location.lat;
        cityName = savedCitiesData!.favouriteCities.last.name;
        cityCountry = savedCitiesData!.favouriteCities.last.country;
        cityLon = savedCitiesData!.favouriteCities.last.location.lon;
        cityLat = savedCitiesData!.favouriteCities.last.location.lat;
        // + отправка запроса по выбранному городу.
        selectedCityWeatherData = await ApiClient()
            .getWeatherInfoAsObject(lat: cityLat!, lon: cityLon!);
      }
      // Обновление состояния виджета
      setState(
        () {
          if (selectedCity.name != '') {
            // Добавление города в список savedCities
            savedCities.add(
              Cities(
                city: cityName!,
                lon: cityLon!,
                lat: cityLat!,
                country: cityCountry!,
                weatherData: selectedCityWeatherData!,
              ),
            );
            // Ляпота. но нет плавности...
            _cityController.clear();
            FocusScope.of(context).unfocus();
          } else {
            // всплывающее окно
            getAllertScreen(context);
            cityName = null;
            cityCountry = null;
            cityLon = null;
            cityLat = null;
          }
        },
      );
    } catch (exeprion) {
      debugPrint('Ошибка при загрузке файла: $exeprion');
      setState(() => getAllertScreen(context));
    }
  }
}

// Уведомление всплывающее о потере уважения...
void getAllertScreen(BuildContext context) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Row(
        children: [
          Icon(Icons.error_outline, color: AppColors.orange),
          Text(' ПРОБЛЕМОЧКА'),
        ],
      ),
      content: const Text('Не удалось найти город. \nПопробуй заново!'),
      actions: <Widget>[
        TextButton(
          style: const ButtonStyle(
            shape: MaterialStatePropertyAll(
              CircleBorder(
                side: BorderSide(
                  color: AppColors.orange,
                ),
              ),
            ),
          ),
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}
