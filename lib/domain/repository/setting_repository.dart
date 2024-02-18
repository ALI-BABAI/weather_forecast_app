import 'package:weather_forecast_app/domain/models/city_model.dart';
import 'package:weather_forecast_app/domain/models/weather_model.dart';

abstract class SettingRepository {
  Future<List<WeatherModel>> getWeatherInfo(List<CityModel> cities);
  List<CityModel> getFavouriteCities();
  void addCityInFavourite();
  void deleteCityFromFavourite();
  // void changeMeasurementUnits();
  // void manageNotifications();
  // void changeLanguage();
  // void handleFeedback();
  // void rateApp();
  // void shareApp();
}
