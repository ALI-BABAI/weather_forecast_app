import 'package:flutter/material.dart';

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
