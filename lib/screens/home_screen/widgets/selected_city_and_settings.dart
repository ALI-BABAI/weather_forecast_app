import 'package:flutter/material.dart';
import 'package:weather_forecast_app/screens/settings_screen/settings_screen.dart';

import 'package:weather_forecast_app/theme/button.dart';
import 'package:weather_forecast_app/theme/text.dart';
import 'package:weather_forecast_app/theme/colors.dart';

void settingButtonPressed() {}

class SelectedCityAndSettingsMenu extends StatelessWidget {
  const SelectedCityAndSettingsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => const SettingsScreen()),
    //   );
    // }

    return SizedBox(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                'Moscow, Russia',
                style: poppinsRegularExtended(
                    30, AppColors.white, FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 40,
              width: 40,
              child: ElevatedButton(
                  onPressed: () {
                    //  Navigator.pushNamed(context, '/second');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingsScreen()),
                    );
                  },
                  style: AppNavigattionButtonStyle.buttonStyle,
                  child: const Expanded(
                    child: Icon(
                      Icons.settings,
                      size: 30,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
