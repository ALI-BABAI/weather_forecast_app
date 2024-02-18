// import 'package:flutter/material.dart';
// import 'package:weather_forecast_app/screens/alerts_windows/app_allert_window.dart';
// import 'package:weather_forecast_app/screens/settings_screen/widgets/tools/setting_button_items.dart';
// import 'package:weather_forecast_app/theme/app_colors.dart';
// import 'package:weather_forecast_app/theme/app_text_styles.dart';

// class ToolElementWidget extends StatelessWidget {
//   final SettingButtonItem setting;

//   const ToolElementWidget({super.key, required this.setting});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 50,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: TextButton(
//           onPressed: () => AppAllertWindow.changeMeasurementUnits(context),
//           // иконка и название итема
//           child: Row(
//             children: [
//               Icon(
//                 setting.iconType,
//                 color: AppColors.white,
//               ),
//               const SizedBox(width: 10),
//               Expanded(
//                 child: Text(
//                   setting.buttonName,
//                   style: AppTextStyles.expandedMainFont,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
