import 'package:flutter/material.dart';
import 'package:weather_forecast_app/data_handling/api_client.dart';
import 'package:weather_forecast_app/data_handling/serialisator/weather_data.dart';
import 'package:weather_forecast_app/main.dart';

import 'package:weather_forecast_app/screens/home_screen/widgets/hourly_forecast.dart';
import 'package:weather_forecast_app/screens/home_screen/widgets/main_forecast.dart';
import 'package:weather_forecast_app/screens/home_screen/widgets/week_forecast.dart';
import 'package:weather_forecast_app/screens/loading_screen/loading_widget.dart';
import 'package:weather_forecast_app/theme/button.dart';
import 'package:weather_forecast_app/theme/colors.dart';
import 'package:weather_forecast_app/theme/text.dart';

// This class (or a class that this class inherits from) is marked as '@immutable',
// but one or more of its instance fields aren't final: HomeScreen.cities
// FavouriteCitiesData? cities;
// HomeScreen({super.key, required this.cities});

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<WeatherData?>>(
        future: ApiClient().getWeatherInfoForSavedCities(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingWidget(
              infoWidget: () => const CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return LoadingWidget(
              infoWidget: () => Text('Ошибка: ${snapshot.error}'),
            );
          } else if ((snapshot.hasData) && (snapshot.data != null)) {
            weatherInSavedCities = snapshot.data!;
            return const SelectedCityWeatherWidget();
          } else {
            return LoadingWidget(
              infoWidget: () =>
                  const Text('Не удалось получить ответ с сервера'),
            );
          }
        },
      ),
    );
  }
}

class SelectedCityWeatherWidget extends StatelessWidget {
  const SelectedCityWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        elevation: 4, // тень
        title: Center(
          child: Text(
            // 'Ulyanovsk, RU',
            '${savedCitiesData!.favouriteCities.first.name}, ${savedCitiesData!.favouriteCities.first.country}',
            style: AppTextStyles.appBarFont,
          ),
        ),
        // убираем автоматически созданную кнопку "назад"
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.appBackground,
        actions: <Widget>[
          SizedBox(
            height: 50,
            width: 50,
            child: ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => const SettingsScreen()),
                // );
                // удаляет текущую странницу
                //Navigator.pushNamed(context, '/settings');
                Navigator.pushNamed(context, '/settings');
              },
              style: AppNavigattionButtonStyle.buttonStyle,
              child: const Icon(
                Icons.settings,
                color: AppColors.white,
                size: 40,
              ),
            ),
          ),
        ],
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: AppColors.gradientBackground,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          primary: true, // не отрабатывает должным образом
          children: const [
            SizedBox(height: 15),
            MainForecastWidget(),
            HourlyForecastWidget(),
            Padding(
              padding: EdgeInsets.only(right: 45),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('DAY / NIGHT', style: AppTextStyles.mainFont),
                ],
              ),
            ),
            WeekForecastWidget(),
            Divider(color: AppColors.gray, thickness: 1),
            SizedBox(height: 20),
            Placeholder(fallbackHeight: 400, fallbackWidth: 400)
          ],
        ),
      ),
    );
  }
}
