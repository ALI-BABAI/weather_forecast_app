import 'package:flutter/material.dart';
import 'package:weather_forecast_app/theme/text.dart';
import 'package:weather_forecast_app/theme/colors.dart';

void btnScipPressed() {}

class FirstOpenningScreens extends StatelessWidget {
  const FirstOpenningScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF484B5B), Color(0xFF2C2D35)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              tileMode: TileMode.decal),
        ),
        child: Column(children: [
          const SizedBox(height: 200),
          TextButton(
            onPressed: btnScipPressed,
            child: Text(
              'skip',
              style: poppinsRegularExtended(14, whiteColor, FontWeight.w500),
            ),
          ),
          const Expanded(
            child:  Image(
                image: AssetImage('assets/images/firsOpennigScreen1.png')),
          ),
          const SizedBox(height: 50),
          Text(
            'Real-Time',
            style: poppinsRegularExtended(28, darkBlueColor, FontWeight.w600),
          ),
          const SizedBox(height: 5),
          Text(
            'Weather Map',
            style: poppinsRegularExtended(28, darkBlueColor, FontWeight.w600),
          ),
          const SizedBox(height: 15),
          Text(
            'Watch the progress of the',
            style: poppinsRegularExtended(16, grayColor, FontWeight.w400),
          ),
          const SizedBox(height: 5),
          Text(
            'precipitation to stay informed',
            style: poppinsRegularExtended(16, grayColor, FontWeight.w400),
          ),
          const SizedBox(height: 100),
          Text(
            'BTN',
            style: poppinsRegularExtended(16, grayColor, FontWeight.w400),
          ),
        ]),
      ),
    );
  }
}

class FirstOpenningScreenNext extends StatelessWidget {
  const FirstOpenningScreenNext({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF484B5B), Color(0xFF2C2D35)],
          begin: Alignment.bottomCenter,
          end: Alignment.center,
        ),
      ),
      child: Column(children: [
        TextButton(
          onPressed: btnScipPressed,
          child: Text(
            'skip',
            style: poppinsRegularExtended(14, whiteColor, FontWeight.w500),
          ),
        ),
        const Image(
            image: AssetImage('assets/images/firsOpennigScreen1.png'),
            height: 250,
            width: 250),
        const SizedBox(height: 200),
        Text(
          'Real-Time',
          style: poppinsRegularExtended(28, darkBlueColor, FontWeight.w600),
        ),
        Text(
          'лол кек',
          style: poppinsRegularExtended(28, darkBlueColor, FontWeight.w600),
        ),
        Text(
          'терентий',
          style: poppinsRegularExtended(16, grayColor, FontWeight.w400),
        ),
        Text(
          'акакьевич',
          style: poppinsRegularExtended(16, grayColor, FontWeight.w400),
        ),
        const SizedBox(height: 200),
        Text(
          'BTN',
          style: poppinsRegularExtended(16, grayColor, FontWeight.w400),
        ),
      ]),
    );
  }
}
