import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/domain/enums/app_languages.dart';
import 'package:weather_forecast_app/domain/enums/measurement_units.dart';
import 'package:weather_forecast_app/domain/repository/settings_repository.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc(this.settingsRepository) : super(SettingState()) {
    on<LoadSettingsEvent>(loadSettings);
    on<SetLanguageEvent>(setLanguage);
    on<SetTemperatureUnitEvent>(setTemperatureUnit);
  }

  final SettingsRepository settingsRepository;

  void loadSettings(
    LoadSettingsEvent event,
    Emitter<SettingState> emit,
  ) {
    final language = settingsRepository.getLanguage();
    final temperatureUnit = settingsRepository.getMeasurementUnit();
    emit(
      SettingState(
        language: language,
        temperatureUnit: temperatureUnit,
      ),
    );
  }

  Future<void> setLanguage(
    SetLanguageEvent event,
    Emitter<SettingState> emit,
  ) async {
    if (state.language == event.language) return;

    await settingsRepository.setLanguage(event.language);
    emit(state.copyWith(language: event.language));
  }

  Future<void> setTemperatureUnit(
    SetTemperatureUnitEvent event,
    Emitter<SettingState> emit,
  ) async {
    if (state.temperatureUnit == event.unit) return;
    await settingsRepository.setTemperatureUnit(event.unit);
    emit(state.copyWith(temperatureUnit: event.unit));
  }
}
