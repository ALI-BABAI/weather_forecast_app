import 'package:flutter/material.dart';
import 'package:weather_forecast_app/screens/home_screen/home_screen.dart';
import 'package:weather_forecast_app/screens/settings_screen.dart';
import 'package:weather_forecast_app/theme/text.dart';
import 'theme/colors.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Weather forecast',
    home: InitializationScreen(),
    // routes: {
    //   '/': (BuildContext context) => const InitializationScreen(),
    //   '/home': (BuildContext context) => const HomeScreen(),
    //   '/settings': (BuildContext context) => const SettingsScreen()
    // },
  ));
}

class InitializationScreen extends StatelessWidget {
  const InitializationScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Задержка в 2-3 секунды перед переходом
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.of(context).pushReplacement(
          //MaterialPageRoute(builder: (context) => const SettingsScreen()),
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      },
    );

    return Scaffold(
      body: Container(
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
                image: AssetImage(
                    'assets/images/final/sun clouds - main screen.png'),
                height: 275,
                width: 275,
              ),
              const SizedBox(height: 5),
              Text(
                'Weather',
                style:
                    poppinsRegularExtended(40, darkBlueColor, FontWeight.w600),
              ),
              const SizedBox(height: 5),
              Text(
                'Forecast',
                style: poppinsRegularExtended(33, grayColor, FontWeight.w400),
              ),
              const SizedBox(
                height: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
