import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:weather_forecast_app/domain/bloc/location_bloc/bloc/location_bloc.dart';
import 'package:weather_forecast_app/domain/bloc/setting_bloc/setting_bloc.dart';
import 'package:weather_forecast_app/domain/repository/settings_repository.dart';
import 'package:weather_forecast_app/domain/repository/weather_repository.dart';
import 'package:weather_forecast_app/l10n/localization_without_context.dart';
import 'package:weather_forecast_app/presenter/screens/settings_screen/settings_screen.dart';
import 'package:weather_forecast_app/screens_deprecated/test_screen.dart';
import 'package:weather_forecast_app/domain/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather_forecast_app/presenter/screens/weather_screen/weather_sreen.dart';
import 'package:weather_forecast_app/presenter/theme/app_main_themes.dart';

import 'generated/l10n.dart';
import 'presenter/screens/loading_screen.dart';
import 'presenter/screens/login_screen/login_screen.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({
    super.key,
    required this.weatherRepository,
    required this.settingsRepository,
  });

  final WeatherRepository weatherRepository;
  final SettingsRepository settingsRepository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SettingBloc(settingsRepository)..add(LoadSettingsEvent()),
      child: BlocBuilder<SettingBloc, SettingState>(
        builder: (context, state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<WeatherBloc>(
                create: (BuildContext context) => WeatherBloc(weatherRepository)
                  ..add(LoadingWeatherScreenEvent()),
              ),
              BlocProvider<LocationBloc>(
                create: (BuildContext context) =>
                    LocationBloc(weatherRepository)
                      ..add(LoadingSettingScreenEvent()),
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              locale: Locale(state.language.name),
              theme: mainThemes,
              title: 'Weather forecast',
              routes: {
                '/weather': (context) => const WeatherScreen(),
                '/settings': (context) => const SettingsScreen(),
                '/test': (context) => const ReordableData(),
              },
              home: PreloadWidget(weatherRepository),
            ),
          );
        },
      ),
    );
  }
}

class PreloadWidget extends StatelessWidget {
  const PreloadWidget(this.repository, {super.key});

  final WeatherRepository repository;

  @override
  Widget build(BuildContext context) {
    AppTranslations.init(context);
    return const LoginScreen();
  }
}
