import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/l10n/localization_without_context.dart';

import '../../../repository/login_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this.loginRepository) : super(LoginInitialState()) {
    on<CheckLoginEvent>(_checkLogin);
    on<CreateLoginEvent>(_createLogin);
  }

  final LoginRepository loginRepository;

  Future<void> _checkLogin(
    CheckLoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoadingState());
    if (event.email.isEmpty || event.password.isEmpty) {
      emit(LoginFailureState(tr.emptyAccountFields));
      return;
    }
    final isCorrect =
        await loginRepository.checkLogin(event.email, event.password);
    isCorrect
        ? emit(LoginSuccessState())
        : emit(LoginFailureState(tr.authFailureMessage));
  }

  Future<void> _createLogin(
    CreateLoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoadingState());
    if (event.email.isEmpty || event.password.isEmpty) {
      emit(LoginFailureState(tr.emptyAccountFields));
      return;
    }
    try {
      await loginRepository.createAccount(event.email, event.password);
      emit(LoginSuccessState());
    } catch (e) {
      emit(LoginFailureState(e.toString()));
    }
  }
}
