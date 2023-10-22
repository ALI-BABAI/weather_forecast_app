import 'package:flutter/material.dart';
import 'package:weather_forecast_app/screens/home_screen/widgets/main_forecast.dart';
import 'package:weather_forecast_app/screens/home_screen/widgets/hourly_forecast.dart';
import 'package:weather_forecast_app/screens/home_screen/widgets/week_forecast.dart';
import 'package:weather_forecast_app/theme/button.dart';
import 'package:weather_forecast_app/theme/colors.dart';
import 'package:weather_forecast_app/theme/text.dart';

// Использовать пакет INTL для работы с датами
// https://api.flutter.dev/flutter/intl/DateFormat-class.html
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // получаем текущее время с устройства  (! правильнее ловить его из сети)
    // final currentTime = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        elevation: 4, // тень
        titleSpacing: 30,
        title: const Center(
          child: Text(
            'Moscow, Russia',
            style: AppTextStyles.appBarFont,
          ),
        ),
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
            colors: AppColors.gradientBackground,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ReoradbleHomeScreen(key: key),
      ),
    );
  }
}

class ReoradbleHomeScreen extends StatefulWidget {
  const ReoradbleHomeScreen({super.key});

  @override
  State<ReoradbleHomeScreen> createState() => _ReoradbleHomeScreenState();
}

class _ReoradbleHomeScreenState extends State<ReoradbleHomeScreen> {
  // final currentTimee = DateTime.now();

  final List<Widget> _items = [
    // HourlyForecastWidget(currentHour: currentTime.hour),
    // WeekForecastWidget(
    //   currentDay: currentTime.day,
    //   currentMonth: currentTime.month,
    // ),
    const SizedBox(height: 15),
    const MainForecastWidget(
      currentWeekDay: 7,
      currentDay: 22,
      currentMonth: 10,
    ),

    const HourlyForecastWidget(currentHour: 15),
    const WeekForecastWidget(
      currentDay: 22,
      currentMonth: 10,
    ),
    const Divider(color: AppColors.gray, thickness: 1),
    const SizedBox(height: 20),
    const Placeholder(fallbackHeight: 400, fallbackWidth: 400)
  ];

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
        children: <Widget>[
          for (int index = 0; index < _items.length; index += 1)
            ListTile(
              key: Key('$index'),
              title: _items[index],
            ),
        ],
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final Widget item = _items.removeAt(oldIndex);
            _items.insert(newIndex, item);
          });
        });
  }
}
