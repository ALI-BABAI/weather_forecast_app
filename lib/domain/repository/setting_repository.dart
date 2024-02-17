import 'package:weather_forecast_app/domain/models/city_model.dart';

abstract class SettingRepository {
  void getWeather();
  SavedCities getFavouriteCities();
  void addCityInFavourite();
  void deleteCityFromFavourite();
  // void changeMeasurementUnits();
  // void manageNotifications();
  // void changeLanguage();
  // void handleFeedback();
  // void rateApp();
  // void shareApp();
}
