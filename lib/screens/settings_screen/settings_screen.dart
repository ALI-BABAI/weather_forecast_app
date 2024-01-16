// можно сделать через DRAWER компонент
// https://api.flutter.dev/flutter/material/Drawer-class.html

import 'package:flutter/material.dart';
import 'package:weather_forecast_app/routes/routes.dart';
import 'package:weather_forecast_app/screens/settings_screen/widgets/location/location_widget.dart';
import 'package:weather_forecast_app/theme/app_bar_button.dart';
import 'package:weather_forecast_app/theme/app_colors.dart';
import 'package:weather_forecast_app/theme/app_decoration.dart';
import 'package:weather_forecast_app/theme/src/text_constants.dart';

import 'widgets/tools/tools_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return GestureDetector(
      // скрытие клавиатуры при нажатии на свободную область экрана
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainBackground,
          title: Text(
            AppTextConstants.settings,
            style: theme.titleLarge, // style: AppTextStyles.appBarFont,
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SizedBox(
                height: 50,
                width: 50,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushReplacementNamed(
                      context, AppRoutes.homeRoute),
                  style: AppButtonsStyle.navigationBtn,
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
          decoration: AppDecorations.darkDecorationTheme,
          child: ListView(
            primary: true,
            children:  [
              LocationWidget(),
              const ToolsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
