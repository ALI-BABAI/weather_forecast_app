import 'package:flutter/material.dart';
import 'package:weather_forecast_app/theme/colors.dart';
import 'package:weather_forecast_app/theme/text.dart';

class ToolsWidget extends StatelessWidget {
  const ToolsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            'Tools',
            style: poppinsRegularExtended(28, orangeColor, FontWeight.w500),
          ),
        ),
        const ToolsElementWidget(
            buttonName: 'Notifications', iconType: Icons.notifications),
        const ToolsElementWidget(
            buttonName: 'Language', iconType: Icons.language),
        const ToolsElementWidget(
            buttonName: 'Seed fedback', iconType: Icons.sms_outlined),
        const ToolsElementWidget(
            buttonName: 'Rate this app', iconType: Icons.star),
        const ToolsElementWidget(
            buttonName: 'Share your weather', iconType: Icons.share)
      ],
    );
  }
}

class ToolsElementWidget extends StatelessWidget {
  final String buttonName;
  final IconData iconType;

  const ToolsElementWidget(
      {super.key, required this.buttonName, required this.iconType});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Icon(iconType, color: whiteColor, size: 30),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    buttonName,
                    style:
                        poppinsRegularExtended(20, whiteColor, FontWeight.w500),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
