
import 'package:weather_forecast_app/data_handling/network/serialisator/weather/weather_data.dart';

final List<Cities> savedCities = []; // глобальная переменная...

class Cities {
  final String city;
  final String country;
  final double lon;
  final double lat;
  late WeatherData weatherData;

  Cities({
    required this.city,
    required this.country,
    required this.lon,
    required this.lat,
    required this.weatherData,
  });
}
