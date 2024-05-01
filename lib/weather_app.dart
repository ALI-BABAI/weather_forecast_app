import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:weather_forecast_app/domain/bloc/location_bloc/bloc/location_bloc.dart';
import 'package:weather_forecast_app/domain/bloc/setting_bloc/setting_bloc.dart';
import 'package:weather_forecast_app/domain/repository/login_repository.dart';
import 'package:weather_forecast_app/domain/repository/settings_repository.dart';
import 'package:weather_forecast_app/domain/repository/weather_repository.dart';
import 'package:weather_forecast_app/presenter/screens/settings_screen/settings_screen.dart';
import 'package:weather_forecast_app/domain/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather_forecast_app/presenter/screens/weather_screen/weather_sreen.dart';
import 'package:weather_forecast_app/presenter/theme/app_main_themes.dart';

import 'generated/l10n.dart';
import 'l10n/localization_without_context.dart';
import 'presenter/screens/login_screen/login_screen.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({
    super.key,
    required this.weatherRepository,
    required this.settingsRepository,
    required this.loginRepository,
  });

  final WeatherRepository weatherRepository;
  final SettingsRepository settingsRepository;
  final LoginRepository loginRepository;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingBloc>(
          create: (context) =>
              SettingBloc(settingsRepository)..add(LoadSettingsEvent()),
        ),
        BlocProvider<WeatherBloc>(
          create: (BuildContext context) => WeatherBloc(weatherRepository),
        ),
        BlocProvider<LocationBloc>(
          create: (BuildContext context) => LocationBloc(weatherRepository),
        ),
      ],
      child: BlocBuilder<SettingBloc, SettingState>(
        builder: (context, state) {
          return MaterialApp(
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
            routes: {
              '/weather': (context) => const WeatherScreen(),
              '/settings': (context) => const SettingsScreen(),
              '/': (context) => PreloadWidget(loginRepository),
            },
            initialRoute: '/',
          );
        },
      ),
    );
  }
}

class PreloadWidget extends StatelessWidget {
  const PreloadWidget(this.loginRepository, {super.key});

  final LoginRepository loginRepository;

  @override
  Widget build(BuildContext context) {
    AppTranslations.init(context);
    return LoginScreen(loginRepository);
  }
}
