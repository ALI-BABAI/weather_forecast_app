import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/domain/bloc/setting_bloc/setting_bloc.dart';
import 'package:weather_forecast_app/domain/repository/weather_repository.dart';
import 'package:weather_forecast_app/presenter/settings_screen/settings_screen.dart';
import 'package:weather_forecast_app/screens_deprecated/test_screen.dart';
import 'package:weather_forecast_app/domain/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather_forecast_app/presenter/weather_screen/weather_sreen.dart';
import 'package:weather_forecast_app/theme/app_main_themes.dart';
import 'package:weather_forecast_app/theme/src/text_constants.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp(this.repository, {super.key});

  final WeatherRepository repository;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherBloc>(
          create: (BuildContext context) =>
              WeatherBloc(repository)..add(LoadingWeatherScreenEvent()),
        ),
        BlocProvider<SettingBloc>(
          create: (BuildContext context) =>
              SettingBloc(repository)..add(LoadingSettingScreenEvent()),
        ),
      ],
      child: MaterialApp(
        theme: mainThemes,
        title: TextConstants.materialAppTitle,
        routes: {
          '/weather': (context) => const WeatherScreen(),
          '/settings': (context) => const SettingsScreen(),
          '/test': (context) => const ReordableData(),
        },
        initialRoute: '/weather',
      ),
    );
  }
}
