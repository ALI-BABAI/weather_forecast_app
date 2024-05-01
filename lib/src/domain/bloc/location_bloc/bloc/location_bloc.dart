import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/src/domain/models/city_model.dart';
import 'package:weather_forecast_app/src/domain/models/weather_model.dart';
import 'package:weather_forecast_app/src/domain/repository/weather_repository.dart';

import '../../../../../l10n/localization_without_context.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc(this.repository) : super(LoadingSettingState()) {
    on<LoadingSettingScreenEvent>(_onLoadingSettingScreenEvent);
    on<UpdateWeatherInfoEvent>(_onUpdateWeatherInfoEvent);
    on<AddCityEvent>(_onAddCityEvent);
    on<DeleteCityEvent>(_onDeleteCityEvent);
    on<ChangeCityIndexEvent>(_onChangeCityIndexEvent);
    on<MoveToWeatherScreenEvent>(_onMoveToWeatherScreenEvent);
  }

  final WeatherRepository repository;

  Future<void> _onLoadingSettingScreenEvent(
    LoadingSettingScreenEvent event,
    Emitter<LocationState> emit,
  ) async {
    try {
      if (repository.favouriteCities.isEmpty) {
        repository.getFavouriteCities();
        await repository.getWeatherInfo(repository.favouriteCities);
      }
      emit(
        LoadedLocationState(
          cities: repository.favouriteCities,
          weatherData: repository.weatherDataList,
        ),
      );
    } catch (e) {
      emit(ErrorSettingState(tr.ErrorCantGetWeatherInfo(e)));
      add(LoadingSettingScreenEvent());
    }
  }

  Future<void> _onUpdateWeatherInfoEvent(
    UpdateWeatherInfoEvent event,
    Emitter<LocationState> emit,
  ) async {
    emit(LoadingSettingState());
    try {
      await repository.getWeatherInfo(repository.favouriteCities);
      emit(
        LoadedLocationState(
          cities: repository.favouriteCities,
          weatherData: repository.weatherDataList,
        ),
      );
    } catch (e) {
      emit(ErrorSettingState(tr.ErrorCantUpdateWeatherData(e)));
      add(LoadingSettingScreenEvent());
    }
  }

  Future<void> _onAddCityEvent(
    AddCityEvent event,
    Emitter<LocationState> emit,
  ) async {
    emit((state as LoadedLocationState).copyWith(isSearching: true));
    try {
      await repository.addCityInFavourite(event.cityName);
      emit(
        LoadedLocationState(
          cities: repository.favouriteCities,
          weatherData: repository.weatherDataList,
        ),
      );
    } catch (e) {
      emit(ErrorSettingState(tr.ErrorAddingCityInFavourite(e)));
      add(LoadingSettingScreenEvent());
    }
  }

  Future<void> _onDeleteCityEvent(
    DeleteCityEvent event,
    Emitter<LocationState> emit,
  ) async {
    emit(LoadingSettingState());
    try {
      await repository.deleteCityFromFavourite(event.index);
      emit(
        LoadedLocationState(
          cities: repository.favouriteCities,
          weatherData: repository.weatherDataList,
        ),
      );
    } catch (e) {
      emit(ErrorSettingState(tr.ErrorCantDeleteCityFromFavourite(e)));
      add(LoadingSettingScreenEvent());
    }
  }

  Future<void> _onChangeCityIndexEvent(
    ChangeCityIndexEvent event,
    Emitter<LocationState> emit,
  ) async {
    try {
      if (event.indexOld == event.indexNew) return;
      await repository.changeCityIndex(event.indexNew, event.indexOld);
    } catch (e) {
      emit(ErrorSettingState(tr.ErrorCantChangePozitionOnFavourite(e)));
      add(LoadingSettingScreenEvent());
    }
  }

  void _onMoveToWeatherScreenEvent(
    MoveToWeatherScreenEvent event,
    Emitter<LocationState> emit,
  ) {
    debugPrint('Переход на экран погоды');
    emit(OpenWeatherScreenState());
  }
}
