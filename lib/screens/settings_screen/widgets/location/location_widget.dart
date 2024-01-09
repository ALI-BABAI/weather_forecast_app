import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_forecast_app/repositories/network/api_client.dart';
import 'package:weather_forecast_app/repositories/network/models/city_model.dart';
import 'package:weather_forecast_app/main.dart';
import 'package:weather_forecast_app/repositories/network/models/weather_model.dart';
import 'package:weather_forecast_app/repositories/preferency_manager.dart';
import 'package:weather_forecast_app/screens/alerts_windows/app_allert_window.dart';
import 'package:weather_forecast_app/screens/home_screen/widgets/loading_widget.dart';
import 'package:weather_forecast_app/screens/settings_screen/widgets/location/location_items.dart';
import 'package:weather_forecast_app/theme/app_colors.dart';
import 'package:weather_forecast_app/theme/app_text_styles.dart';

/* show rootBundle;  прописывается для явного импорта только rootBundle из пакета
// flutter/services.dart. Это позволяет избежать импорта всех символов из пакета
// и использовать только необходимый класс или функцию.
// Это полезно для оптимизации размера кода и избежания конфликтов имен*/
import 'package:flutter/services.dart' show rootBundle;
import 'package:weather_forecast_app/theme/src/text_constants.dart';

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
    return FutureBuilder(
      future: PreferencesManager().getListSavedCities(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            {
              return const CircularProgressIndicator();
            }
          case ConnectionState.done:
            {
              // экран с данными по сохранённым городам
              if (snapshot.hasData) {
                final SavedCities savedCities = snapshot.data!;
                if (savedCities.citiesList.isNotEmpty) {
                  // копируем считанные ответы с сервера в глобальную переменную
                  return savedCitiesList(context, savedCities);
                } else {
                  debugPrint(
                      'Что-то пошло не так, а что??? citiesList = ${snapshot.data}');
                  // return LoadingWidget(
                  //   infoWidget: () =>
                  //       Text('${AppTextConstants.error} ${snapshot.error}'),
                  // );
                  // на экране оставить текстфилд необходимо
                  // при навигации выхода проверять список сохранённых, если пусто
                  // уводомить о необходимости добавить город / создать дефолтный
                  return const SizedBox.shrink();
                }
              } else {
                return LoadingWidget(
                  infoWidget: () =>
                      Text('${AppTextConstants.error} ${snapshot.error}'),
                );
              }
            }
          default:
            {
              return const CircularProgressIndicator();
            }
        }
      },
    );
  }

  Padding savedCitiesList(BuildContext context, SavedCities savedCities) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Location - заголовок
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
            child: Text(
              AppTextConstants.location,
              // style: AppTextStyles.settingsScreenHeaderFont,
              style: theme.titleSmall,
            ),
          ),
          // TextField
          SizedBox(
            height: 46,
            child: TextField(
              controller: _cityController,
              onSubmitted: (value) => _checkCity(value, savedCities),
              keyboardAppearance: Brightness.dark,
              textCapitalization: TextCapitalization.words,
              style: AppTextStyles.expandedMainFont,
              cursorColor: Colors.cyan,
              decoration: InputDecoration(
                hintText: AppTextConstants.enterCityName,
                hintStyle: AppTextStyles.secondaryFont,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.orange),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.orange),
                ),
                contentPadding: const EdgeInsets.only(left: 20),
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
                        // https://www.youtube.com/watch?v=f3mI0thSNOs
                        onPressed: () async {
                          BuildContext thisContext = context;
                          showDialog(
                            context: thisContext,
                            builder: (context) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            },
                          );
                          _checkCity(_cityController.text, savedCities);
                          // await Future.delayed(Duration(seconds: 1));
                          Navigator.of(thisContext).pop();
                        },
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
                          AppTextConstants.add,
                          style: AppTextStyles.poppinsFont(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Блок сохранённых городов
          if (savedCities.citiesList.isNotEmpty)
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: savedCities.citiesList.length,
              itemBuilder: (context, index) {
                final savedCity = savedCities.citiesList[index];
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    _deleteCity(savedCities: savedCities, index: index);
                    setState(() => {});
                  },
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 3),
                    // константная иконка геопозиции
                    leading: const Icon(
                      Icons.location_on,
                      size: 40,
                      color: AppColors.white,
                    ),
                    // кнопка удаления
                    trailing: IconButton(
                      onPressed: () {
                        _deleteCity(savedCities: savedCities, index: index);
                        setState(() => {});
                      },
                      icon: const Icon(
                        Icons.delete_forever,
                        color: AppColors.orange,
                        size: 35,
                      ),
                    ),
                    // город и страна
                    title: Text(
                      '${savedCity.name}${AppTextConstants.symbolComma} ${savedCity.country}',
                      style: AppTextStyles.expandedMainFont,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // информация по текущему городу
                    subtitle: Text(
                      '${weatherInSavedCities.elementAt(index)!.temperature}'
                      '${AppTextConstants.symbolDegree}${AppTextConstants.symbolComma} '
                      '${weatherInSavedCities.elementAt(index)!.description}',
                      style: AppTextStyles.secondaryFont,
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }

  void _deleteCity({required SavedCities savedCities, required int index}) {
    savedCities.citiesList.removeAt(index);
    weatherInSavedCities.removeAt(index);
    PreferencesManager().saveCitiesList(savedCities: savedCities);
  }

  // Проверка введённого текста с сохранённым списком городов
  // В случае совпадения город добавляется в глобальный файл, содержащий список сохранённых локаций
  void _checkCity(String userString, SavedCities citiesList) async {
    // Future _checkCity(String userString) async {
    late String jsonString;
    userString = userString.toLowerCase().replaceAll(' ', '');
    try {
      // Проверка наличия города в списке
      bool cityExists = citiesList.citiesList.any(
        (city) => city.name.toLowerCase().replaceAll(' ', '') == userString,
      );

      if (cityExists) {
        debugPrint('Город уже существует в списке.');
        setState(
          () {
            AppAllertWindow.warningCityAlreadyExist(context);
          },
        );
      } else {
        // Загрузка данных из файла city_list.json
        jsonString = await rootBundle.loadString('assets/city_list.json');
        final List<dynamic> citiesData = json.decode(jsonString);

        // Преобразование данных в объекты City
        final List<CityModel> cityItem =
            citiesData.map((json) => CityModel.fromJson(json)).toList();

        // Поиск введённого города из списка
        final CityModel selectedCity = cityItem.firstWhere(
          (city) => city.name.toLowerCase().replaceAll(' ', '') == userString,
          orElse: () => CityModel(
            name: '',
            country: '',
            lon: 0.0,
            lat: 0.0,
          ),
        );

        WeatherModel? selectedCityWeatherData;

        // Проверка на совпадение города +
        // вот тут нужно сохранять в файл.
        if (selectedCity.name != '') {
          citiesList.citiesList.add(CityModel(
            name: selectedCity.name,
            country: selectedCity.country,
            lon: selectedCity.lon,
            lat: selectedCity.lat,
          ));
          // записываем в файл
          // await savedCitiesFile.writeAsString(jsonEncode(citiesList));
          PreferencesManager().saveCitiesList(savedCities: citiesList);

          cityName = citiesList.citiesList.last.name;
          cityCountry = citiesList.citiesList.last.country;
          cityLon = citiesList.citiesList.last.lon;
          cityLat = citiesList.citiesList.last.lat;
          // + отправка запроса по выбранному городу.
          selectedCityWeatherData = await ApiClient()
              .getWeatherInfoAsObject(lat: cityLat!, lon: cityLon!);

          // добавляем в глобальную переменную инфу по добавленному городу
          weatherInSavedCities.add(selectedCityWeatherData);
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
              AppAllertWindow.warningCityNotFound(context);
            }
          },
        );
      }
    } catch (exeprion) {
      debugPrint('Ошибка при загрузке файла: $exeprion');
      setState(() => AppAllertWindow.warningCityNotFound(context));
    }
  }
}
