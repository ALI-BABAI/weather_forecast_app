import 'package:flutter/material.dart';
import 'package:weather_forecast_app/theme/colors.dart';

// Уведомление всплывающее о потере уважения...
void getAllertScreen(BuildContext context) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Row(
        children: [
          Icon(Icons.error_outline, color: AppColors.orange),
          Text(' ПРОБЛЕМОЧКА'),
        ],
      ),
      content: const Text('Не удалось найти город. \nПопробуй заново!'),
      actions: <Widget>[
        TextButton(
          style: const ButtonStyle(
            shape: MaterialStatePropertyAll(
              CircleBorder(
                side: BorderSide(
                  color: AppColors.orange,
                ),
              ),
            ),
          ),
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}
