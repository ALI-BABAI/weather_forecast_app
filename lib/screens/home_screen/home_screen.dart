import 'package:flutter/material.dart';
import 'package:weather_forecast_app/screens/home_screen/widgets/current_day_main_weather.dart';
import 'package:weather_forecast_app/screens/home_screen/widgets/dotted_diveder.dart';
import 'package:weather_forecast_app/screens/home_screen/widgets/forecast_per_hours.dart';
import 'package:weather_forecast_app/screens/home_screen/widgets/seven_days_forecast.dart';
import 'package:weather_forecast_app/theme/button.dart';
import 'package:weather_forecast_app/theme/colors.dart';
import 'package:weather_forecast_app/theme/text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // получаем текущее время с устройства  (! правильнее ловить его из сети)
    final currentTime = DateTime.now();
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          elevation: 4, // тень
          titleSpacing: 30,

          title: const Center(
            child: Text(
              'Moscow, Russia',
              style: AppTextStyles.appBarText,
            ),
          ),
          backgroundColor: const Color(0xFF484B5B),
          actionsIconTheme:
              const IconThemeData(color: Color(0xFF484B5B), opacity: 1),
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
                  Navigator.pushNamed(context, '/settings');
                },
                style: AppNavigattionButtonStyle.buttonStyle,
                child: const Icon(
                  Icons.settings,
                  size: 40,
                ),
              ),
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
          child: ListView(
            children: [
              //используя AppBar можно сделать было
              // const SelectedCityAndSettingsMenu(),
              // const Divider(color: grayColor, thickness: 2),
              // const DottedDivederWidget(),
              const SizedBox(height: 10),
              CurrentDayWeatherWidget(
                currentWeekDay: currentTime.weekday,
                currentDay: currentTime.day,
                currentMonth: currentTime.month,
              ),
              const DottedDivederWidget(), // пунктирный разделитель
              const CurrentDayAllParametersWidget(),
              ForecastPerSevenDaysWidget(
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
