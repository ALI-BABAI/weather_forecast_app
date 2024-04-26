import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/domain/repository/settings_repository.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc(this.settingsRepository) : super(SettingState()) {
    on<LoadSettingsEvent>(loadSettings);
    on<SetLanguageEvent>(setLanguage);
  }

  final SettingsRepository settingsRepository;

  void loadSettings(
    LoadSettingsEvent event,
    Emitter<SettingState> emit,
  ) {
    final language = settingsRepository.getLanguage();
    emit(
      SettingState(
        language: language,
      ),
    );
  }

  Future<void> setLanguage(
    SetLanguageEvent event,
    Emitter<SettingState> emit,
  ) async {
    if (state.language == event.language) return;
    await settingsRepository.setLanguage(event.language);
    emit(SettingState(language: event.language));
  }
}
