import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/data/repository/app_repository.dart';
import 'package:weather_forecast_app/domain/models/city_model.dart';
import 'package:weather_forecast_app/domain/models/weather_model.dart';
import 'package:weather_forecast_app/presenter/blocs/setting_bloc/setting_event.dart';
import 'package:weather_forecast_app/presenter/blocs/setting_bloc/setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  // List<CityModel>? savedCities;
  // List<WeatherModel>? weatherData;

  final AppRepository appRepository;

  SettingBloc(this.appRepository) : super(LoadingState()) {
    on<LoadingSettingScreenEvent>((event, emit) async {
      try {
        List<CityModel> savedCities = appRepository.getFavouriteCities();
        List<WeatherModel> weatherData =
            await appRepository.getWeatherInfo(savedCities);

        emit(
          LoadedState(
            cities: savedCities,
            weatherData: weatherData,
          ),
        );
      } catch (e) {
        debugPrint('${e.toString()}\nНе удалось загрузить данные о погоде');
        // emit(ErrorState(
        //     '${e.toString()}\nНе удалось загрузить данные о погоде'));
      }
    });
    on<AddCityEvent>((event, emit) async {
      emit(LoadingState());
      try {
        await appRepository.addCityInFavourite(event.cityName);
        add(LoadingSettingScreenEvent());
      } catch (e) {
        debugPrint('${e.toString()}\nНе удалось загрузить данные о городе.');
        add(LoadingSettingScreenEvent());
      }
    });
    on<DeleteCityEvent>((event, emit) async {
      emit(LoadingState());
      try {
        await appRepository.deleteCityFromFavourite(event.index);
        add(LoadingSettingScreenEvent());
      } catch (e) {
        debugPrint('${e.toString()}\nНе удалось удалить город из избранного');
        add(LoadingSettingScreenEvent());
      }
    });
    on<TollTapEvent>((event, emit) {
      emit(LoadingState());
      // emit(LoadedState());
    });
  }
}
