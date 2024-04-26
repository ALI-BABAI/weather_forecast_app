import 'package:flutter/material.dart';
import 'package:weather_forecast_app/generated/l10n.dart';
import 'package:weather_forecast_app/presenter/theme/app_colors.dart';
import 'package:weather_forecast_app/presenter/theme/app_text_styles.dart';

abstract class DialogWindow {
  static showDialogScreen({
    required BuildContext context,
    required String title,
    required String selectedValue,
  }) {
    showDialog(
      context: context,
      builder: (context) => AppAlertDialog(
        title: title,
        selectedValue: selectedValue,
      ),
    );
  }

  // static changeMeasurementUnits(BuildContext context) {
  //   showDialog<String>(
  //     context: context,
  //     builder: (context) => AppAlertDialog(
  //       title: S.of(context).appUnits,
  //     ),
  //   );
  // }

  static warningCityNotFound(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Row(
          children: [
            const Icon(Icons.error_outline, color: Colors.black),
            Text(S.of(context).haveProblem),
          ],
        ),
        backgroundColor: AppColors.orange,
        content: Text(S.of(context).notFoundCityPleaseCheckInputAndTryAgain),
        actions: <Widget>[
          TextButton(
            style: const ButtonStyle(
              shape: MaterialStatePropertyAll(
                CircleBorder(
                  side: BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            onPressed: () => Navigator.pop(context),
            child: Text(S.of(context).ok),
          ),
        ],
      ),
    );
  }

  static warningCityAlreadyExist(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Row(
          children: [
            const Icon(Icons.error_outline, color: Colors.black),
            Text(S.of(context).haveProblem),
          ],
        ),
        backgroundColor: AppColors.orange,
        content: Text(S.of(context).theCityHasAlreadyBeenSaved),
        actions: <Widget>[
          TextButton(
            style: const ButtonStyle(
              shape: MaterialStatePropertyAll(
                CircleBorder(
                  side: BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            onPressed: () => Navigator.pop(context),
            child: Text(S.of(context).ok),
          ),
        ],
      ),
    );
  }
}

class AppAlertDialog extends StatefulWidget {
  const AppAlertDialog({
    super.key,
    required this.title,
    required this.selectedValue,
  });

  final String title;
  final String selectedValue;

  @override
  State<AppAlertDialog> createState() => _AppAlertDialogState();
}

class _AppAlertDialogState extends State<AppAlertDialog> {
  late String dropdownValue;

  @override
  void initState() {
    dropdownValue = widget.selectedValue;
    super.initState();
  }

  @override
  // String dropdownValue = widget.selectedValue;
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.mainBackground,
      title: Text(widget.title, style: AppTextStyles.settingsScreenHeaderFont),
      actionsAlignment: MainAxisAlignment.spaceAround,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Text(
                S.of(context).temperatureUnit,
                style: AppTextStyles.mainFont,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: DropdownButton<String>(
                // underline: const SizedBox.shrink(),
                value: dropdownValue,
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                items: listTemperatureUnit
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: AppTextStyles.mainFont,
                    ),
                  );
                }).toList(),
                // items: const [
                //   DropdownMenuItem(
                //     value: 'celsius',
                //     child: Text('Цельсий'),
                //   ),
                //   DropdownMenuItem(
                //     value: 'fahrenheit',
                //     child: Text('Фаренгейт'),
                //   ),
                // ],
              ),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () {
                debugPrint('cancel $dropdownValue');
                Navigator.of(context).pop();
              },
              child: const Text(
                'Отмена',
                style: AppTextStyles.mainFont,
              ),
            ),
            TextButton(
              onPressed: () {
                debugPrint(
                  'Сохранить $dropdownValue',
                );
                Navigator.of(context).pop();
              },
              child: Text(
                'Сохранить',
                style: AppTextStyles.mainFont.copyWith(color: AppColors.orange),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

const List<String> listTemperatureUnit = <String>['celsius', 'fahrenheit'];

// actions: <Widget>[
//   Row(
//     children: [
      // Text(
      //   S.of(context).temperatureUnit,
      //   style: AppTextStyles.expandedMainFont,
      // ),
//     ],
//   ),
//   Row(
//     mainAxisAlignment: MainAxisAlignment.start,
//     children: [
//       TextButton(
//         onPressed: () => Navigator.pop(context),
//         child: const Text('°C', style: AppTextStyles.mainFont),
//       ),
//       TextButton(
//         onPressed: () => Navigator.pop(context),
//         child: const Text('°F', style: AppTextStyles.mainFont),
//       ),
//     ],
//   ),
//   Row(
//     children: [
//       Text(
//         S.of(context).pressureUnit,
//         style: AppTextStyles.expandedMainFont,
//       ),
//     ],
//   ),
//   Row(
//     mainAxisAlignment: MainAxisAlignment.start,
//     children: [
//       TextButton(
//         onPressed: () => Navigator.pop(context),
//         child: Text(
//           S.of(context).hpaUnit,
//           style: AppTextStyles.mainFont,
//         ),
//       ),
//       TextButton(
//         onPressed: () => Navigator.pop(context),
//         child: Text(
//           S.of(context).mmhgUnit,
//           style: AppTextStyles.mainFont,
//         ),
//       ),
//     ],
//   ),
// ],
