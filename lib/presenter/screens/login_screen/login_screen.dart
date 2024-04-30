import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/domain/bloc/login_bloc/bloc/login_bloc.dart';
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
                    Navigator.pushReplacementNamed(context, '/weather');
                  }
                  if (state is LoginFailureState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(S.of(context).authFailureMessage),
                        backgroundColor: Colors.red.shade400,
                        duration: const Duration(seconds: 5),
                        showCloseIcon: true,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return LoadingScreen(
                    widget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: TextField(
                            controller: _emailController,
                            maxLength: 32,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              labelText: S.of(context).email,
                              labelStyle: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: TextField(
                            controller: _passwordController,
                            maxLength: 32,
                            obscureText: true,
                            style: const TextStyle(color: Colors.amber),
                            decoration: InputDecoration(
                                labelText: S.of(context).password,
                                labelStyle:
                                    const TextStyle(color: Colors.black),
                                fillColor: Colors.amber),
                          ),
                        ),
                        const SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 150,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.amber),
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
                                  context.read<LoginBloc>().add(
                                        CheckLoginEvent(
                                          email: _emailController.text,
                                          password: _passwordController.text,
                                        ),
                                      );
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.amber),
                                ),
                                child: Text(S.of(context).login),
                              ),
                            ),
                          ],
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
