// Давление, влажность, сила и направление ветра
import 'package:flutter/material.dart';

import '../../../../theme/text.dart';

class WeatherExtendedParameters extends StatelessWidget {
  const WeatherExtendedParameters({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 15, bottom: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WeatherParameter(
                    name: 'Wind: ',
                    info: '10 km/h',
                    icon: Icons.air_rounded,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  WeatherParameter(
                    name: 'Pressure: ',
                    info: '1006hPa',
                    icon: Icons.speed_rounded,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WeatherParameter(
                    name: 'visibility: ',
                    info: '10km',
                    icon: Icons.visibility_outlined,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  WeatherParameter(
                    name: 'Humidity: ',
                    info: '5%',
                    icon: Icons.water_drop_outlined,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class WeatherParameter extends StatelessWidget {
  final String name;
  final IconData icon;
  final String info;

  const WeatherParameter(
      {super.key, required this.name, required this.icon, required this.info});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(icon, color: Colors.white),
        const SizedBox(width: 12),
        Text(
          name,
          style: AppTextStyles.secondaryFont,
        ),
        Text(info, style: AppTextStyles.mainFont),
      ],
    );
  }
}
