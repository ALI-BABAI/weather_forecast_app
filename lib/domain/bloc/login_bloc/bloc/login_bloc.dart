import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repository/login_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this.loginRepository) : super(LoginInitialState()) {
    on<CheckLoginEvent>(_checkLogin);
    on<CreateLoginEvent>(_createLogin);
  }

  final LoginRepository loginRepository;

  void _checkLogin(CheckLoginEvent event, Emitter<LoginState> emit) {
    emit(LoadingState());

    if (event.email == 'lol') {
      emit(LoginSuccessState());
    } else {
      emit(LoginFailureState());
    }
  }

  void _createLogin(CreateLoginEvent event, Emitter<LoginState> emit) {
    emit(LoadingState());
    //  save userAccount  to secureStorage
  }
}
