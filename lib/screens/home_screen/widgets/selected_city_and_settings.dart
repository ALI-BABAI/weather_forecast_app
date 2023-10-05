import 'package:flutter/material.dart';
import 'package:weather_forecast_app/theme/text.dart';
import 'package:weather_forecast_app/theme/colors.dart';

void settingButtonPressed() {}

class SelectedCityAndSettingsMenu extends StatelessWidget {
  const SelectedCityAndSettingsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            'Moscow, Russia',
            style: poppinsRegularExtended(24, whiteColor, FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ),
        ElevatedButton(
            onPressed: settingButtonPressed,
            style: ButtonStyle(
                minimumSize: const MaterialStatePropertyAll(Size(24, 24)),
                padding: const MaterialStatePropertyAll(
                  EdgeInsets.all(5),
                ),
                backgroundColor:
                    const MaterialStatePropertyAll(Color(0xFF484B5B)),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side:
                          const BorderSide(width: 0, color: Color(0x0F484B5B))),
                )),
            child: const Icon(Icons.settings)),
        const IconButton(
          iconSize: 24,
          onPressed: settingButtonPressed,
          highlightColor: Colors.cyan, // Цвет при нажатии
          hoverColor: Colors.amber, // Цвет при наведении
          splashColor: Colors.brown, // Цвет всплеска при нажатии
          icon: Icon(
            Icons.settings,
            color: whiteColor,
          ),
        )
      ],
    );
  }
}
