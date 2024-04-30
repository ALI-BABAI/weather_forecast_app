import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/domain/bloc/location_bloc/bloc/location_bloc.dart';
import 'package:weather_forecast_app/domain/models/city_model.dart';
import 'package:weather_forecast_app/domain/models/weather_model.dart';
import 'package:weather_forecast_app/presenter/screens/weather_screen/widgets/city_forecasts_widgets/city_panel.dart';
import 'package:weather_forecast_app/presenter/screens/weather_screen/widgets/city_forecasts_widgets/daily_forecast.dart';
import 'package:weather_forecast_app/presenter/screens/weather_screen/widgets/city_forecasts_widgets/hourly_forecast.dart';
import 'package:weather_forecast_app/presenter/screens/weather_screen/widgets/city_forecasts_widgets/main_forecast.dart';
import 'package:weather_forecast_app/presenter/theme/app_decoration.dart';

class CityWidget extends StatelessWidget {
  final WeatherModel weatherData;
  final CityModel currentCity;
  const CityWidget({
    super.key,
    required this.weatherData,
    required this.currentCity,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: AppDecorations.darkDecorationTheme,
      child: RefreshIndicator(
        backgroundColor: Colors.amber,
        onRefresh: () {
          return Future(() {
            context.read<LocationBloc>().add(UpdateWeatherInfoEvent());
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('screen updated'),
                backgroundColor: Colors.amber,
              ),
            );
          });
        },
        child: ListView(
          primary: true,
          children: [
            CityPanelWidget(currentCity),
            MainForecastWidget(weatherData),
            HourlyForecastWidget(weatherData),
            DailyForecastWidget(weatherData),
          ],
        ),
      ),
    );
  }
}
