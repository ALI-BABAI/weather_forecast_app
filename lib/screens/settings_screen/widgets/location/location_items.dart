import 'package:weather_forecast_app/data_handling/network/models/weather/weather_model.dart';

final List<Cities> savedCities = []; // глобальная переменная...

class Cities {
  final String city;
  final String country;
  final double lon;
  final double lat;
  late WeatherModel weatherData;

  Cities({
    required this.city,
    required this.country,
    required this.lon,
    required this.lat,
    required this.weatherData,
  });
}
