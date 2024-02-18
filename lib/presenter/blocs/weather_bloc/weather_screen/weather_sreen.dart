import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_forecast_app/presenter/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_forecast_app/presenter/blocs/weather_bloc/weather_state.dart';
import 'package:weather_forecast_app/screens/home_screen/widgets/city_widget.dart';
import 'package:weather_forecast_app/theme/app_colors.dart';
import 'package:weather_forecast_app/theme/app_decoration.dart';
import 'package:weather_forecast_app/theme/app_text_styles.dart';
import 'package:weather_forecast_app/theme/src/text_constants.dart';

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
          } else {
            return const LoadingWidget(
              widget: Text('Cannot open'),
            );
          }
        },
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  final Widget? widget;
  const LoadingWidget({super.key, this.widget});

  @override
  Widget build(BuildContext context) {
    final Widget infoWidget = widget ?? const CircularProgressIndicator();
    return DecoratedBox(
      decoration: AppDecorations.lightDecorationTheme,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/images/app_logo.png'),
              height: 275,
              width: 275,
            ),
            const SizedBox(height: 5),
            Text(AppTextConstants.weather,
                style: AppTextStyles.poppinsFont(
                  fontSize: 40,
                  color: AppColors.darkBlue,
                  fontWeight: FontWeight.w600,
                )),
            const SizedBox(height: 5),
            Text(AppTextConstants.forecast,
                style: AppTextStyles.poppinsFont(
                  fontSize: 33,
                  color: AppColors.gray,
                  fontWeight: FontWeight.w400,
                )),
            const SizedBox(
              height: 150,
            ),
            infoWidget,
          ],
        ),
      ),
    );
  }
}
