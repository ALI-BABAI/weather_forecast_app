import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/presenter/blocs/weather_bloc/weather_event.dart';
import 'package:weather_forecast_app/presenter/blocs/weather_bloc/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(LoadingState()) {
    on<SwitchCity>((event, emit) {
      emit(LoadingState());
    });
    on<MoveToSettingScreen>((event, emit) {
      emit(LoadedState());
    });
  }
}
