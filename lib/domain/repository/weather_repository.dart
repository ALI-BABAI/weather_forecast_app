import 'package:weather_forecast_app/domain/models/city_model.dart';

abstract class WeatherRepository {
  void getWeather();
  SavedCities getFavouriteCities();
}
