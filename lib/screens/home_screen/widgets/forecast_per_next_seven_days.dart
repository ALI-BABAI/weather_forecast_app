import 'package:flutter/material.dart';

class PerSevenDaysForecastWidget extends StatelessWidget {
  const PerSevenDaysForecastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Color(0x1F000000),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: const SizedBox(height: 300, width: 400));
  }
}
