import 'package:flutter/material.dart';
import 'package:weather_forecast_app/data_handling/network/api_client.dart';
import 'package:weather_forecast_app/data_handling/network/models/weather_model.dart';
import 'package:weather_forecast_app/main.dart';
import 'package:weather_forecast_app/screens/home_screen/widgets/city_widget.dart';
import 'package:weather_forecast_app/screens/home_screen/widgets/loading_widget.dart';
import 'package:weather_forecast_app/theme/src/text_constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // запускается асинхронный метод возвращающий список данных по сохранённым городам
      body: FutureBuilder<List<WeatherModel?>>(
        future: ApiClient().getWeatherInfoForSavedCities(),
        builder: (context, snapshot) {
          // экран прогрузки/загрузки приложения
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingWidget(
              infoWidget: () => const CircularProgressIndicator(),
            );
          }
          // экран с ошибкой
          else if (snapshot.hasError) {
            return LoadingWidget(
              infoWidget: () =>
                  Text('${AppTextConstants.error} ${snapshot.error}'),
            );
          } else if (snapshot.data!.any((element) => element == null)) {
            return LoadingWidget(
              infoWidget: () => const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(AppTextConstants.errorToMuchRequestsOrSmth),
              ),
            );
          }
          // экран с данными по сохранённым городам
          else if ((snapshot.hasData) && (snapshot.data != null)) {
            // копируем считанные ответы с сервера в глобальную переменную
            weatherInSavedCities = snapshot.data!;
            // создаём контроллер для возможности переключения между городами
            final PageController pageScreensController = PageController();
            return PageView.builder(
              controller: pageScreensController,
              itemCount: weatherInSavedCities.length,
              itemBuilder: (context, index) {
                // Загрузка на экран выбранного по индексу города
                return CityWidget(
                  currentCity: savedCitiesData!.citiesList.elementAt(index),
                  weatherData: weatherInSavedCities.elementAt(index)!,
                );
              },
            );
          }
          // Экран ошибки
          else {
            return LoadingWidget(
              infoWidget: () =>
                  const Text(AppTextConstants.errorCannotGetRequestFromAPI),
            );
          }
        },
      ),
    );
  }
}
