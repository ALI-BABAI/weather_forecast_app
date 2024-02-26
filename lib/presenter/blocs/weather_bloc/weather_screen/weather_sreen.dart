import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/presenter/blocs/setting_bloc/setting_bloc.dart';
import 'package:weather_forecast_app/presenter/blocs/setting_bloc/setting_event.dart';

import 'package:weather_forecast_app/presenter/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_forecast_app/presenter/blocs/weather_bloc/weather_screen/widgets/loading_widget.dart';
import 'package:weather_forecast_app/presenter/blocs/weather_bloc/weather_state.dart';
import 'package:weather_forecast_app/presenter/blocs/weather_bloc/weather_screen/widgets/city_widget/city_widget.dart';
import 'package:weather_forecast_app/theme/app_decoration.dart';

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
              else {
                // return const LoadingWidget(
                //   widget: Text('Cannot open'),
                // );
                return const DecoratedBox(
                  decoration: AppDecorations.darkDecorationTheme,
                  child: Center(
                    child: CircularProgressIndicator(),
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
