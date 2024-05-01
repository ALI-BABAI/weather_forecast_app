import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/domain/bloc/login_bloc/bloc/login_bloc.dart';
import 'package:weather_forecast_app/domain/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather_forecast_app/domain/repository/login_repository.dart';
import 'package:weather_forecast_app/generated/l10n.dart';

import '../../theme/app_decoration.dart';
import '../loading_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen(this.loginRepository, {super.key});

  final LoginRepository loginRepository;

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
              create: (context) => LoginBloc(loginRepository),
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

class LoginTextFieldWidget extends StatelessWidget {
  const LoginTextFieldWidget({
    super.key,
    required this.controller,
    required this.label,
    this.isVisible = false,
  });

  final TextEditingController controller;
  final String label;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: TextField(
        controller: controller,
        maxLength: 32,
        obscureText: isVisible,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(color: Colors.black),
            fillColor: Colors.amber),
      ),
    );
  }
}

class ButtonPanelWidget extends StatelessWidget {
  const ButtonPanelWidget({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final loginBloc = context.read<LoginBloc>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: 150,
          child: ElevatedButton(
            onPressed: () {
              FocusScope.of(context).unfocus();
              loginBloc.add(
                CreateLoginEvent(
                  email: emailController.text,
                  password: passwordController.text,
                ),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.amber),
            ),
            child: Text(
              S.of(context).createAccount,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(
          width: 150,
          child: ElevatedButton(
            onPressed: () {
              FocusScope.of(context).unfocus();
              loginBloc.add(
                CheckLoginEvent(
                  email: emailController.text,
                  password: passwordController.text,
                ),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.amber),
            ),
            child: Text(S.of(context).login),
          ),
        ),
      ],
    );
  }
}
