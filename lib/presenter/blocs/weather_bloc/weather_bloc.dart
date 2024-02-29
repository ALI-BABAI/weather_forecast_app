import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/domain/models/city_model.dart';
import 'package:weather_forecast_app/domain/models/weather_model.dart';
import 'package:weather_forecast_app/domain/repository/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository appRepository;
  WeatherBloc(this.appRepository) : super(LoadingWeatherState()) {
    on<LoadingWeatherScreenEvent>(_onLoadingWeatherScreenEvent);

    on<MoveToSettingScreenEvent>(_onMoveToSettingScreenEvent);
  }

  void _onLoadingWeatherScreenEvent(
      LoadingWeatherScreenEvent event, Emitter<WeatherState> emit) async {
    try {
      List<CityModel> savedCities = appRepository.getFavouriteCities();
      List<WeatherModel> weatherData =
          await appRepository.getWeatherInfo(savedCities);

      emit(
        LoadedWeatherState(
          cities: savedCities,
          weatherData: weatherData,
        ),
      );
    } catch (e) {
      debugPrint('${e.toString()}\nНе удалось загрузить данные о погоде');
      emit(ErrorWeatherState('${e.toString()}\nНе удалось загрузить данные о погоде'));
    }
  }

  void _onMoveToSettingScreenEvent(
      MoveToSettingScreenEvent event, Emitter<WeatherState> emit) {
    debugPrint('Переход на экран настроек');
    emit(OpenSettingScreenState());
  }
}
