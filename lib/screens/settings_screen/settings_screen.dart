// можно сделать через DRAWER компонент
// https://api.flutter.dev/flutter/material/Drawer-class.html

import 'package:flutter/material.dart';
import 'package:weather_forecast_app/screens/settings_screen/widgets/location/location_widget.dart';
import 'package:weather_forecast_app/theme/button.dart';
import 'package:weather_forecast_app/theme/colors.dart';
import 'package:weather_forecast_app/theme/text.dart';

import 'widgets/tools_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        // скрытие клавиатуры при нажатии на свободную область экрана
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          elevation: 4, // тень
          titleSpacing: 30,
          title: Text(
            'Settings',
            style: theme.titleLarge, // style: AppTextStyles.appBarFont,
          ),
          backgroundColor: AppColors.appBackground,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SizedBox(
                height: 50,
                width: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                    // Navigator.push(
                    //   context,
                    //   // MaterialPageRoute(
                    //   //     builder: (context) =>
                    //   //         HomeScreen(savedCitiesData: savedCitiesData!)),
                    //   MaterialPageRoute(
                    //       builder: (context) => const HomeScreen()),
                    // );
                  },
                  style: AppNavigattionButtonStyle.buttonStyle,
                  child: const Icon(
                    Icons.close,
                    color: AppColors.white,
                    size: 40,
                  ),
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
          child: ListView(
            primary: true,
            children: const [
              LocationWidget(),
              ToolsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
