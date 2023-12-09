import 'package:weather_forecast_app/data_handling/serialisator/weather_data.dart';

final List<Cities> savedCities = []; // глобальная переменная...

class Cities {
  final String city;
  final String country;
  final String lon;
  final String lat;
  final WeatherData weatherData;

  Cities({
    required this.city,
    required this.country,
    required this.lon,
    required this.lat,
    required this.weatherData,
  });
}
