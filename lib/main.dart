import 'package:flutter/material.dart';
import 'package:weather_forecast_app/api%20and%20json/example_json.dart';
import 'package:weather_forecast_app/screens/home_screen/home_screen.dart';
import 'package:weather_forecast_app/screens/settings_screen/settings_screen.dart';
import 'package:weather_forecast_app/theme/text.dart';
import 'theme/colors.dart';

void main() {
  runApp(MaterialApp(
    //home: InitializationScreen(),
    title: 'Weather forecast',
    initialRoute: '/',
    routes: {
      '/': (context) => const InitializationScreen(),
      '/home': (context) => const HomeScreen(),
      '/settings': (context) => const SettingsScreen(),
    },
  ));
}

class InitializationScreen extends StatelessWidget {
  const InitializationScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    decodeJson();
    //decodeJsonSerializable();
    // Задержка в 2-3 секунды перед переходом

    Future.delayed(
      const Duration(seconds: 2),
      () {
        // Navigator.of(context).pushReplacement(
        //   MaterialPageRoute(builder: (context) => const HomeScreen()),
        // );
        Navigator.pushReplacementNamed(context, '/home');
      },
    );

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
            ],
          ),
        ),
      ),
    );
  }
}
