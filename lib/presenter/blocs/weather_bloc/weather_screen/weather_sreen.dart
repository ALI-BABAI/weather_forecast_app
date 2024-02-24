import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_forecast_app/presenter/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_forecast_app/presenter/blocs/weather_bloc/weather_screen/widgets/loading_widget.dart';
import 'package:weather_forecast_app/presenter/blocs/weather_bloc/weather_state.dart';
import 'package:weather_forecast_app/presenter/blocs/weather_bloc/weather_screen/widgets/city_widget/city_widget.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const LoadingWidget();
          } else if (state is LoadedState) {
            return PageView.builder(
              controller: PageController(),
              itemCount: state.weatherData.length,
              itemBuilder: (context, index) {
                // Загрузка на экран выбранного по индексу города
                return CityWidget(
                  currentCity: state.cities.elementAt(index),
                  weatherData: state.weatherData.elementAt(index),
                );
              },
            );
          } else if (state is ErrorState) {
            return LoadingWidget(
              widget: Text(state.errorMessage),
            );
          }
          // else if (state is OpenSettingScreenState) {
          //   return const SettingsScreen();
          // } 
          else {
            return const LoadingWidget(
              widget: Text('Cannot open'),
            );
          }
        },
      ),
    );
  }
}
