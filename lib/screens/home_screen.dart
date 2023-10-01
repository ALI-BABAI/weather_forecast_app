import 'package:flutter/material.dart';
import 'package:weather_forecast_app/theme/text.dart';
import 'package:weather_forecast_app/theme/colors.dart';

import 'package:simple_gradient_text/simple_gradient_text.dart'; //https://pub.dev/packages/simple_gradient_text

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
              height:
                  50), // ГОВНОКОД (как сделать отступ от верхней части экрана?)
          const Divider(color: grayColor, thickness: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  'Moscow, Russia',
                  style:
                      poppinsRegularExtended(24, whiteColor, FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
              const IconButton(
                onPressed: settingButtonPressed,
                icon: Icon(
                  Icons.settings,
                  color: whiteColor,
                  size: 24,
                ),
              )
            ],
          ),
          const Divider(color: grayColor, thickness: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: const BoxDecoration(
                  color: Color(0xFF32333E),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Text(
                  'Saturday, 1 Oct',
                  style: poppinsRegularExtended(12, grayColor, FontWeight.w200),
                ),
              ),
            ],
          ),
          const Divider(color: grayColor, thickness: 1),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Image(
                image: AssetImage('assets/images/homeScreenMainWeather.png'),
              ),
              Container(
                margin: const EdgeInsets.only(right: 30), // ГОВНОКОД
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GradientText('33',
                            style: const TextStyle(
                                fontSize: 72, fontWeight: FontWeight.w700),
                            colors: const [
                              Color(0xFFA2A4B5),
                              Color(0xFF757784)
                            ]),
                        const Text('°',
                            style: TextStyle(
                                fontSize: 64,
                                fontWeight: FontWeight.w200,
                                color: Color(0xFF757784))),
                      ],
                    ),
                    Text(
                      'Partly cloud',
                      style: poppinsRegularExtended(
                          14, whiteColor, FontWeight.w300),
                    )
                  ],
                ),
              )
            ],
          ),
          const Divider(color: grayColor, thickness: 1),
        ],
      ),
    ));
  }
}

void settingButtonPressed() {}
