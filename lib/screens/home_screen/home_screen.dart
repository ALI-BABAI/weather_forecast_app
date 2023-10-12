import 'package:flutter/material.dart';
import 'package:weather_forecast_app/screens/home_screen/widgets/current_day_main_weather.dart';
import 'package:weather_forecast_app/screens/home_screen/widgets/dotted_diveder.dart';
import 'package:weather_forecast_app/screens/home_screen/widgets/forecast_per_hours.dart';
import 'package:weather_forecast_app/screens/home_screen/widgets/forecast_per_next_seven_days.dart';
import 'package:weather_forecast_app/screens/home_screen/widgets/selected_city_and_settings.dart';
import 'package:weather_forecast_app/theme/colors.dart';

// градиентная заливка имеет грубые переходные слои
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // получаем текущее время с устройства  (! правильнее ловить его из сети)
    final currentTime = DateTime.now();
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              color: Color(0xFF484B5B),
              // gradient: LinearGradient(
              //   colors: [Color(0xFF484B5B), Color(0xFF2C2D35)],
              //   begin: Alignment.topCenter,
              //   end: Alignment.bottomCenter,
              // ),
            ),
            alignment: Alignment.center,
            child: ListView(
              children: [
                //используя AppBar можно сделать было
                const SelectedCityAndSettingsMenu(),
                const Divider(color: grayColor, thickness: 3),
                const CurrentDayWeatherWidget(),
                const SizedBox(height: 20),
                const DottedDivederWidget(), // ? пунктирный разделитель
                const SizedBox(height: 20),
                const CurrentDayAllParametersWidget(),
                const SizedBox(height: 20),
                // передаём в виджет текущее время
                PerHourForecastWidget(currentHour: currentTime.hour),
                const Divider(color: grayColor, thickness: 1),
                const PerSevenDaysForecastWidget(),
                const Divider(color: grayColor, thickness: 1),
                const SizedBox(height: 20),
                const Placeholder(fallbackHeight: 400, fallbackWidth: 400)
              ],
            )));
  }
}
