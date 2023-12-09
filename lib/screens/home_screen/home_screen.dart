import 'package:flutter/material.dart';
import 'package:weather_forecast_app/data_handling/api_client.dart';
import 'package:weather_forecast_app/data_handling/serialisator/weather_data.dart';

import 'package:weather_forecast_app/screens/home_screen/widgets/hourly_forecast.dart';
import 'package:weather_forecast_app/screens/home_screen/widgets/main_forecast.dart';
import 'package:weather_forecast_app/screens/home_screen/widgets/week_forecast.dart';
import 'package:weather_forecast_app/theme/button.dart';
import 'package:weather_forecast_app/theme/colors.dart';
import 'package:weather_forecast_app/theme/text.dart';

// This class (or a class that this class inherits from) is marked as '@immutable',
// but one or more of its instance fields aren't final: HomeScreen.cities
// FavouriteCitiesData? cities;
// HomeScreen({super.key, required this.cities});

class HomeScreen extends StatelessWidget {
  // final FavouriteCitiesData? cities;
  const HomeScreen({
    super.key,
    // required this.cities,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<WeatherData?>(
        future: ApiClient().getWeatherInfoAsObject(),
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
            return SelectedCityWeatherWidget(weatherData: snapshot.data!);
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

class LoadingWidget extends StatelessWidget {
  final Widget Function() infoWidget;
  const LoadingWidget({super.key, required this.infoWidget});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.white,
          gradient: LinearGradient(
            colors: [Color(0xFFBCC8D6), Color(0xFFF2F4F7)],
            begin: Alignment.bottomCenter,
            end: Alignment.center,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/images/app_logo.png'),
                height: 275,
                width: 275,
              ),
              const SizedBox(height: 5),
              Text(
                'Weather',
                style: poppinsRegularExtended(
                    40, AppColors.darkBlue, FontWeight.w600),
              ),
              const SizedBox(height: 5),
              Text(
                'Forecast',
                style:
                    poppinsRegularExtended(33, AppColors.gray, FontWeight.w400),
              ),
              const SizedBox(
                height: 150,
              ),
              infoWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectedCityWeatherWidget extends StatelessWidget {
  final WeatherData weatherData;
  const SelectedCityWeatherWidget({
    super.key,
    required this.weatherData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        elevation: 4, // тень
        title: const Center(
          child: Text(
            'Ulyanovsk, RU',
            //weatherData.current.weather.first.weatherLogo,
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
                Navigator.pop(context, '/settings');
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
          children: [
            const SizedBox(height: 15),
            MainForecastWidget(weatherData: weatherData),
            HourlyForecastWidget(weatherData: weatherData),
            const Padding(
              padding: EdgeInsets.only(right: 45),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('DAY / NIGHT', style: AppTextStyles.mainFont),
                ],
              ),
            ),
            WeekForecastWidget(weatherData: weatherData),
            const Divider(color: AppColors.gray, thickness: 1),
            const SizedBox(height: 20),
            const Placeholder(fallbackHeight: 400, fallbackWidth: 400)
          ],
        ),
      ),
    );
  }
}
