import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<CheckLoginEvent>(_checkLogin);
    on<CreateLoginEvent>(_createLogin);
  }

  final bool isCorrect = true;

  void _checkLogin(LoginEvent event, Emitter<LoginState> emit) {
    emit(LoadingState());
    //  check authData with secureStorageData
    if (isCorrect) {
    } else {
      emit(LoginFailureState());
    }
  }

  void _createLogin(CreateLoginEvent event, Emitter<LoginState> emit) {
    emit(LoadingState());
    //  save userAccount  to secureStorage
  }
}
