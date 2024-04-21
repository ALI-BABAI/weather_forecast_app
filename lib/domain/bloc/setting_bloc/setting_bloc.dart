import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/domain/models/city_model.dart';
import 'package:weather_forecast_app/domain/models/weather_model.dart';
import 'package:weather_forecast_app/domain/repository/weather_repository.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc(this.repository) : super(LoadingSettingState()) {
    on<LoadingSettingScreenEvent>(_onLoadingSettingScreenEvent);
    on<AddCityEvent>(_onAddCityEvent);
    on<DeleteCityEvent>(_onDeleteCityEvent);
    on<ChangeCityIndexEvent>(_onChangeCityIndexEvent);
    on<TollTapEvent>(_onTollTapEvent);
    on<MoveToWeatherScreenEvent>(_onMoveToWeatherScreenEvent);
  }

  final WeatherRepository repository;

  void _onLoadingSettingScreenEvent(
    LoadingSettingScreenEvent event,
    Emitter<SettingState> emit,
  ) async {
    try {
      if (repository.favouriteCities.isEmpty) {
        repository.getFavouriteCities();
        await repository.getWeatherInfo(repository.favouriteCities);
      }
      emit(
        LoadedSettingState(
          cities: repository.favouriteCities,
          weatherData: repository.weatherDataList,
        ),
      );
    } catch (e) {
      debugPrint('${e.toString()}\nНе удалось загрузить данные о погоде');
      // emit(ErrorState(
      //     '${e.toString()}\nНе удалось загрузить данные о погоде'));
    }
  }

  void _onAddCityEvent(
    AddCityEvent event,
    Emitter<SettingState> emit,
  ) async {
    emit((state as LoadedSettingState).copyWith(isSearching: true));
    try {
      await repository.addCityInFavourite(event.cityName);
      emit(
        LoadedSettingState(
          cities: repository.favouriteCities,
          weatherData: repository.weatherDataList,
        ),
      );
    } catch (e) {
      debugPrint('${e.toString()}\nНе удалось добавить город в избранное.');
      add(LoadingSettingScreenEvent());
    }
  }

  void _onDeleteCityEvent(
    DeleteCityEvent event,
    Emitter<SettingState> emit,
  ) async {
    emit(LoadingSettingState());
    try {
      await repository.deleteCityFromFavourite(event.index);
      emit(
        LoadedSettingState(
          cities: repository.favouriteCities,
          weatherData: repository.weatherDataList,
        ),
      );
    } catch (e) {
      debugPrint('${e.toString()}\nНе удалось удалить город из избранного');
      add(LoadingSettingScreenEvent());
    }
  }

  Future<void> _onChangeCityIndexEvent(
    ChangeCityIndexEvent event,
    Emitter<SettingState> emit,
  ) async {
    try {
      if (event.indexOld == event.indexNew) return;
      await repository.changeCityIndex(event.indexNew, event.indexOld);
    } catch (e) {
      debugPrint('''${e.toString()}\n
          Не удалось изменить положение города в списке избранных городов''');
      add(LoadingSettingScreenEvent());
    }
  }

  void _onTollTapEvent(
    TollTapEvent event,
    Emitter<SettingState> emit,
  ) {
    emit(LoadingSettingState());
  }

  void _onMoveToWeatherScreenEvent(
    MoveToWeatherScreenEvent event,
    Emitter<SettingState> emit,
  ) {
    debugPrint('Переход на экран погоды');
    emit(OpenWeatherScreenState());
  }
}
