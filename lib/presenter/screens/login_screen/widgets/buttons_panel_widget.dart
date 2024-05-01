import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/domain/bloc/login_bloc/bloc/login_bloc.dart';
import 'package:weather_forecast_app/generated/l10n.dart';

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
          width: 165,
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
          width: 165,
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
