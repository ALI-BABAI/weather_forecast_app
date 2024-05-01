import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:weather_forecast_app/domain/enums/measurement_units.dart';
import 'package:weather_forecast_app/domain/models/weather_model.dart';

import '../../domain/enums/api_exceptions.dart';
import '../../domain/enums/app_languages.dart';

const _apiKey = '6f6f192517f2b62b4364d19778420b76';

class ApiService {
  ApiService({
    required this.language,
    required this.temperatureUnit,
  });
  final String? language;
  final TemperatureUnit temperatureUnit;

  Future<WeatherModel> getWeather({
    double lat = 54.27028,
    double lon = 48.302364,
  }) async {
    final apiClient = http.Client();

    Uri url = Uri(
      scheme: "https",
      host: "api.openweathermap.org",
      path: "data/2.5/onecall",
      queryParameters: {
        'lat': lat.toString(),
        'lon': lon.toString(),
        'units': temperatureUnit.unitType,
        'exclude': 'alerts,minutely',
        'appid': _apiKey,
        'lang': language ?? AppLanguages.en.name,
      },
    );
    try {
      final response = await apiClient.get(url);
      if (response.statusCode != 200) {
        throw (
          response.statusCode == 429
              ? ApiExeption.overlimit.errorMessage
              : ApiExeption.other.errorMessage,
        );
      }
      final jsonData = jsonDecode(response.body);
      final weatherData = WeatherModel.fromJson(jsonData);
      return weatherData;
    } on SocketException {
      throw (ApiExeption.network.errorMessage);
    } catch (error) {
      debugPrint('Произошла ошибка: $error');
      rethrow;
    } finally {
      apiClient.close();
    }
  }
}
