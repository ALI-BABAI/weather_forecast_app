import 'package:flutter/material.dart';
import 'package:weather_forecast_app/screens/home_screen/widgets/current_day_main_weather.dart';
import 'package:weather_forecast_app/screens/home_screen/widgets/dotted_diveder.dart';
import 'package:weather_forecast_app/screens/home_screen/widgets/forecast_per_hours.dart';
import 'package:weather_forecast_app/screens/home_screen/widgets/selected_city_and_settings.dart';
import 'package:weather_forecast_app/theme/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFF484B5B), Color(0xFF2C2D35)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  tileMode: TileMode.decal),
            ),
            alignment: Alignment.center,
            child: ListView(
              children: const [
                SelectedCityAndSettingsMenu(), //используя AppBar можно сделать было
                Divider(color: grayColor, thickness: 1),
                CurrentDayWeatherWidget(),
                SizedBox(height: 20),
                DottedDivederWidget(), // ? пунктирный разделитель
                SizedBox(height: 20),
                CurrentDayAllParametersWidget(),
                SizedBox(height: 20),
                Divider(color: grayColor, thickness: 1),
                PerHourForecastWidget(),

                SizedBox(height: 50),
                Placeholder(fallbackHeight: 1000, fallbackWidth: 400),
              ],
            )));
  }
}
