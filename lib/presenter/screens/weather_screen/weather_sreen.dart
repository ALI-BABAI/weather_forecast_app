import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loop_page_view/loop_page_view.dart';
import 'package:weather_forecast_app/domain/bloc/location_bloc/bloc/location_bloc.dart';

import 'package:weather_forecast_app/domain/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather_forecast_app/presenter/screens/loading_screen.dart';
import 'package:weather_forecast_app/presenter/screens/weather_screen/widgets/city_widget.dart';
import 'package:weather_forecast_app/presenter/theme/app_decoration.dart';
import 'package:weather_forecast_app/presenter/theme/app_text_styles.dart';

import '../../../generated/l10n.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (context, state) {
          if (state is OpenSettingScreenState) {
            BlocProvider.of<LocationBloc>(context)
                .add(LoadingSettingScreenEvent());
            Navigator.pushNamed(context, '/settings');
          }
        },
        builder: (context, state) {
          return BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is LoadingWeatherState) {
                return LoadingScreen(
                  widget: Column(
                    children: [
                      Text(
                        S.of(context).uploadingTheData,
                        style: AppTextStyles.settingsScreenHeaderFont,
                      ),
                      const SizedBox(height: 50),
                      const CircularProgressIndicator(color: Colors.amber),
                    ],
                  ),
                );
              } else if (state is LoadedWeatherState) {
                final itemCount = state.cities.length;
                return LoopPageView.builder(
                  itemCount: itemCount,
                  itemBuilder: (_, index) {
                    return CityWidget(
                      currentCity: state.cities.elementAt(index),
                      weatherData: state.weatherData.elementAt(index),
                    );
                  },
                );
              } else if (state is ErrorWeatherState) {
                return LoadingScreen(
                  widget: Text(
                    state.errorMessage,
                    style: AppTextStyles.loadingScreenFont,
                  ),
                );
              } else {
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
