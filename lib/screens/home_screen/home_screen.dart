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
        body: DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF484B5B), Color(0xFF2C2D35)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: ListView(
        children: [
          //используя AppBar можно сделать было
          const SelectedCityAndSettingsMenu(),
          const Divider(color: grayColor, thickness: 2),
          // const DottedDivederWidget(),
          CurrentDayWeatherWidget(
            currentWeekDay: currentTime.weekday,
            currentDay: currentTime.day,
            currentMonth: currentTime.month,
          ),
          const DottedDivederWidget(), // пунктирный разделитель
          const CurrentDayAllParametersWidget(),
          PerSevenDaysForecastWidget(
            currentDay: currentTime.day,
            currentMonth: currentTime.month,
          ),
          const Divider(color: grayColor, thickness: 1),
          const SizedBox(height: 20),
          const Placeholder(fallbackHeight: 400, fallbackWidth: 400)
        ],
      ),
    ));
  }
}
