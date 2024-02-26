import 'package:weather_forecast_app/domain/models/city_model.dart';
import 'package:weather_forecast_app/domain/models/weather_model.dart';

abstract interface class WeatherRepository {
  Future<List<WeatherModel>> getWeatherInfo(List<CityModel> cities);
  List<CityModel> getFavouriteCities();
}
