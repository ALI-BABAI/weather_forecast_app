import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/domain/models/city_model.dart';
import 'package:weather_forecast_app/domain/models/weather_model.dart';
import 'package:weather_forecast_app/domain/repository/setting_repository.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  final SettingRepository appRepository;

  SettingBloc(this.appRepository) : super(LoadingSettingState()) {
    on<LoadingSettingScreenEvent>(_onLoadingSettingScreenEvent);
    on<AddCityEvent>(_onAddCityEvent);
    on<DeleteCityEvent>(_onDeleteCityEvent);
    on<ChangeCityIndexEvent>(_onChangeCityIndexEvent);
    on<TollTapEvent>(onTollTapEvent);
    on<MoveToWeatherScreenEvent>(_onMoveToWeatherScreenEvent);
  }

  void _onLoadingSettingScreenEvent(
      LoadingSettingScreenEvent event, Emitter<SettingState> emit) async {
    try {
      if (appRepository.favouriteCities.isEmpty) {
        appRepository.getFavouriteCities();
        await appRepository.getWeatherInfo(appRepository.favouriteCities);
      }
      emit(
        LoadedSettingState(
          cities: appRepository.favouriteCities,
          weatherData: appRepository.weatherDataList,
        ),
      );
    } catch (e) {
      debugPrint('${e.toString()}\nНе удалось загрузить данные о погоде');
      // emit(ErrorState(
      //     '${e.toString()}\nНе удалось загрузить данные о погоде'));
    }
  }

  void _onAddCityEvent(AddCityEvent event, Emitter<SettingState> emit) async {
    emit(LoadingSettingState());
    try {
      await appRepository.addCityInFavourite(event.cityName);
      emit(
        LoadedSettingState(
          cities: appRepository.favouriteCities,
          weatherData: appRepository.weatherDataList,
        ),
      );
    } catch (e) {
      debugPrint('${e.toString()}\nНе удалось добавить город в избранное.');
      add(LoadingSettingScreenEvent());
    }
  }

  void _onDeleteCityEvent(
      DeleteCityEvent event, Emitter<SettingState> emit) async {
    emit(LoadingSettingState());
    try {
      await appRepository.deleteCityFromFavourite(event.index);
      emit(
        LoadedSettingState(
          cities: appRepository.favouriteCities,
          weatherData: appRepository.weatherDataList,
        ),
      );
    } catch (e) {
      debugPrint('${e.toString()}\nНе удалось удалить город из избранного');
      add(LoadingSettingScreenEvent());
    }
  }

  Future<void> _onChangeCityIndexEvent(
      ChangeCityIndexEvent event, Emitter<SettingState> emit) async {
    try {
      if (event.indexOld == event.indexNew) return;
      await appRepository.changeCityIndex(event.indexNew, event.indexOld);
    } catch (e) {
      debugPrint('''${e.toString()}\n
          Не удалось изменить положение города в списке избранных городов''');
      add(LoadingSettingScreenEvent());
    }
  }

  void onTollTapEvent(TollTapEvent event, Emitter<SettingState> emit) {
    emit(LoadingSettingState());
    // emit(LoadedState());
  }

  void _onMoveToWeatherScreenEvent(
      MoveToWeatherScreenEvent event, Emitter<SettingState> emit) {
    debugPrint('Переход на экран погоды');
    emit(OpenWeatherScreenState());
  }
}
