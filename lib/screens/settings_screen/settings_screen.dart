// можно сделать через DRAWER компонент
// https://api.flutter.dev/flutter/material/Drawer-class.html

import 'package:flutter/material.dart';
import 'package:weather_forecast_app/screens/settings_screen/widgets/location_widget.dart';
import 'package:weather_forecast_app/theme/button.dart';
import 'package:weather_forecast_app/theme/text.dart';

import 'widgets/tools_widget.dart';

void exitScreen() {}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          title: const Text(
            'Settings',
            style: AppTextStyles.appBarText,
          ),
          backgroundColor: const Color(0xFF484B5B),
          automaticallyImplyLeading:
              false, // убираем автоматически созданную кнопку "назад"
          actions: <Widget>[
            SizedBox(
              height: 50,
              width: 50,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/home');
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const HomeScreen()),
                    // );
                  },
                  style: AppNavigattionButtonStyle.buttonStyle,
                  child: const Icon(
                    Icons.close,
                    size: 40,
                  )),
            ),
          ],
        ),
        body: DecoratedBox(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF484B5B), Color(0xFF2C2D35)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: ListView(children: const [
            LocationWidget(),
            ToolsWidget(),
          ]),
        ),
      ),
    );
  }
}
