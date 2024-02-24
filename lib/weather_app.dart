import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_forecast_app/data/repository/app_repository.dart';
import 'package:weather_forecast_app/presenter/blocs/setting_bloc/setting_bloc.dart';
import 'package:weather_forecast_app/presenter/blocs/setting_bloc/setting_event.dart';
import 'package:weather_forecast_app/presenter/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_forecast_app/presenter/blocs/weather_bloc/weather_event.dart';
import 'package:weather_forecast_app/presenter/blocs/setting_bloc/settings_screen/settings_screen.dart';
import 'package:weather_forecast_app/presenter/blocs/weather_bloc/weather_screen/weather_sreen.dart';
import 'package:weather_forecast_app/theme/app_main_themes.dart';
import 'package:weather_forecast_app/theme/src/text_constants.dart';

class WeatherApp extends StatelessWidget {
  final SharedPreferences prefs;
  const WeatherApp(this.prefs, {super.key});

  @override
  Widget build(BuildContext context) {
    final AppRepository appRepository = AppRepository(prefs);
    return MaterialApp(
      theme: mainThemes,
      title: AppTextConstants.materialAppTitle,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<WeatherBloc>(
            create: (BuildContext context) =>
                WeatherBloc(appRepository)..add(LoadingWeatherScreenEvent()),
          ),
          BlocProvider<SettingBloc>(
            create: (BuildContext context) =>
                SettingBloc(appRepository)..add(LoadingSettingScreenEvent()),
          ),
        ],
        // child: const WeatherScreen(),
        child: const SettingsScreen(),
      ),
    );
  }
}
