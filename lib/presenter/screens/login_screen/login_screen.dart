import 'package:flutter/material.dart';
import 'package:weather_forecast_app/generated/l10n.dart';

import '../loading_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingScreen(
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: TextField(
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
              maxLength: 32,
              obscureText: true,
              style: const TextStyle(color: Colors.amber),
              decoration: InputDecoration(
                  labelText: S.of(context).password,
                  labelStyle: const TextStyle(color: Colors.black),
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
                    Navigator.pushReplacementNamed(context, '/weather');
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.amber),
                  ),
                  child: Text(S.of(context).login),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
