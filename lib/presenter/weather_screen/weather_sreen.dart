import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/blocs/setting_bloc/setting_bloc.dart';

import 'package:weather_forecast_app/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_forecast_app/presenter/loading_screen.dart';
import 'package:weather_forecast_app/presenter/weather_screen/widgets/city_widget.dart';
import 'package:weather_forecast_app/theme/app_text_styles.dart';
import 'package:weather_forecast_app/theme/src/text_constants.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (context, state) {
          if (state is OpenSettingScreenState) {
            BlocProvider.of<SettingBloc>(context)
                .add(LoadingSettingScreenEvent());
            Navigator.pushNamed(context, '/settings');
          }
        },
        builder: (context, state) {
          return BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is LoadingWeatherState) {
                return const LoadingScreen();
              } else if (state is LoadedWeatherState) {
                return PageView.builder(
                  controller: PageController(),
                  itemCount: state.cities.length,
                  itemBuilder: (context, index) {
                    return CityWidget(
                      currentCity: state.cities.elementAt(index),
                      weatherData: state.weatherData.elementAt(index),
                    );
                  },
                );
              } else if (state is ErrorWeatherState) {
                return LoadingScreen(
                  widget: Text(state.errorMessage),
                );
              } else {
                return LoadingScreen(
                  widget: Text(
                    TextConstants.errorOnOpenApp,
                    style: AppTextStyles.poppinsFont(),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
