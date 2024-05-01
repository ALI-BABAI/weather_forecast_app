import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/src/domain/bloc/login_bloc/bloc/login_bloc.dart';
import 'package:weather_forecast_app/src/domain/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather_forecast_app/src/domain/repository/login_repository.dart';
import 'package:weather_forecast_app/generated/l10n.dart';
import 'package:weather_forecast_app/src/presenter/screens/login_screen/widgets/buttons_panel_widget.dart';
import 'package:weather_forecast_app/src/presenter/screens/login_screen/widgets/login_textfield_widget.dart';

import '../../theme/app_decoration.dart';
import '../loading_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen(this.loginRepository, {super.key});

  final LoginRepository loginRepository;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: AppDecorations.lightDecorationTheme,
        child: ListView(
          children: [
            BlocProvider<LoginBloc>(
              create: (context) => LoginBloc(widget.loginRepository),
              child: BlocConsumer<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state is LoginSuccessState) {
                    FocusScope.of(context).unfocus();
                    context
                        .read<WeatherBloc>()
                        .add(LoadingWeatherScreenEvent());
                    Navigator.pushReplacementNamed(context, '/weather');
                  }
                  if (state is LoginFailureState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.errorMessage),
                        backgroundColor: Colors.amber,
                        duration: const Duration(seconds: 5),
                        showCloseIcon: true,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  final inProcessing =
                      (state is LoginSuccessState) || (state is LoadingState);
                  return LoadingScreen(
                    widget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LoginTextFieldWidget(
                          controller: _emailController,
                          label: S.of(context).email,
                        ),
                        const SizedBox(height: 16),
                        LoginTextFieldWidget(
                          controller: _passwordController,
                          label: S.of(context).password,
                          isVisible: true,
                        ),
                        const SizedBox(height: 50),
                        inProcessing
                            ? const Center(child: CircularProgressIndicator())
                            : ButtonPanelWidget(
                                emailController: _emailController,
                                passwordController: _passwordController,
                              ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
