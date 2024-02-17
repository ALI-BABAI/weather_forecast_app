import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/presenter/blocs/setting_bloc/setting_event.dart';
import 'package:weather_forecast_app/presenter/blocs/setting_bloc/setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(LoadingState()) {
    on<AddCity>((event, emit) {
      emit(LoadingState());
    });
    on<DeleteCity>((event, emit) {
      emit(LoadedState());
    });
    on<MoveToWeatherScreen>((event, emit) {
      emit(ErrorState());
    });
  }
}
