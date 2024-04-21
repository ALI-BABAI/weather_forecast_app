import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/domain/models/city_model.dart';
import 'package:weather_forecast_app/domain/models/weather_model.dart';
import 'package:weather_forecast_app/domain/repository/weather_repository.dart';
import 'package:weather_forecast_app/theme/src/text_constants.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc(this.weatherRepository) : super(LoadingWeatherState()) {
    on<LoadingWeatherScreenEvent>(_onLoadingWeatherScreenEvent);
    on<MoveToSettingScreenEvent>(_onMoveToSettingScreenEvent);
  }

  final WeatherRepository weatherRepository;

  void _onLoadingWeatherScreenEvent(
    LoadingWeatherScreenEvent event,
    Emitter<WeatherState> emit,
  ) async {
    try {
      if (weatherRepository.favouriteCities.isEmpty) {
        weatherRepository.getFavouriteCities();
        if (weatherRepository.favouriteCities.isEmpty) {
          await weatherRepository.addCityInFavourite('Moscow');
        }
        await weatherRepository
            .getWeatherInfo(weatherRepository.favouriteCities);
      }

      emit(
        LoadedWeatherState(
          cities: weatherRepository.favouriteCities,
          weatherData: weatherRepository.weatherDataList,
        ),
      );
    } catch (e) {
      final message =
          '${e.toString()}\n${TextConstants.errOnGettingWeatherInfo}';
      debugPrint(message);
      emit(ErrorWeatherState(message));
    }
  }

  void _onMoveToSettingScreenEvent(
    MoveToSettingScreenEvent event,
    Emitter<WeatherState> emit,
  ) {
    debugPrint('Переход на экран настроек');
    emit(OpenSettingScreenState());
  }
}
