import 'package:weather_forecast_app/domain/models/city_model.dart';
import 'package:weather_forecast_app/domain/models/weather_model.dart';

abstract interface class WeatherRepository {
  List<CityModel> favouriteCities = [];
  List<WeatherModel> weatherDataList = [];

  Future<List<WeatherModel>> getWeatherInfo(List<CityModel> cities);
  List<CityModel> getFavouriteCities();
  Future<void> addCityInFavourite(String sity);
  Future<void> deleteCityFromFavourite(int index);
  Future<void> changeCityIndex(int indexNew, int indexOld);
  // void changeMeasurementUnits();
  // void manageNotifications();
  // void changeLanguage();
  // void handleFeedback();
  // void rateApp();
  // void shareApp();
}
