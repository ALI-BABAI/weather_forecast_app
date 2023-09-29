import 'package:flutter/material.dart';
import 'package:weather_forecast_app/theme/text.dart';
import 'theme/colors.dart';

void main() {
  runApp(const InitializationScreen());
}

class InitializationScreen extends StatelessWidget {
  const InitializationScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Weather forecast',
        // theme: ThemeData.dark(),
        home: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              gradient: LinearGradient(
                colors: [Color(0xFFBCC8D6), Color(0xFFF2F4F7)],
                begin: Alignment.bottomCenter,
                end: Alignment.center,
                // tileMode: TileMode.repeated,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                      image: AssetImage('assets/images/mainScreen.png')),
                  const SizedBox(height: 5),
                  Text(
                    'Weather',
                    style: poppinsRegularExtended(
                        40, darkBlueColor, FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Forecast',
                    style:
                        poppinsRegularExtended(33, grayColor, FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
