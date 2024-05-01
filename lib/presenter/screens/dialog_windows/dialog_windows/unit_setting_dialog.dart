
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/domain/bloc/location_bloc/bloc/location_bloc.dart';
import 'package:weather_forecast_app/domain/bloc/setting_bloc/setting_bloc.dart';
import 'package:weather_forecast_app/domain/enums/measurement_units.dart';
import 'package:weather_forecast_app/generated/l10n.dart';
import 'package:weather_forecast_app/presenter/theme/app_colors.dart';
import 'package:weather_forecast_app/presenter/theme/app_text_styles.dart';

class UnitSettingDialog extends StatefulWidget {
  const UnitSettingDialog({
    super.key,
    required this.title,
    required this.selectedValue,
  });

  final String title;
  final TemperatureUnit selectedValue;

  @override
  State<UnitSettingDialog> createState() => _UnitSettingDialogState();
}

class _UnitSettingDialogState extends State<UnitSettingDialog> {
  late TemperatureUnit dropdownValue;

  @override
  void initState() {
    dropdownValue = widget.selectedValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title, style: AppTextStyles.settingsScreenHeaderFont),
      actionsAlignment: MainAxisAlignment.spaceAround,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              S.of(context).temperatureUnit,
              style: AppTextStyles.mainFont,
            ),
          ),
          Expanded(
            child: DropdownButton<TemperatureUnit>(
              isExpanded: false,
              value: dropdownValue,
              borderRadius: BorderRadius.circular(5),
              underline: const SizedBox.shrink(),
              onChanged: (TemperatureUnit? value) {
                setState(() {
                  dropdownValue = value!;
                });
              },
              items:
                  TemperatureUnit.values.map<DropdownMenuItem<TemperatureUnit>>(
                (TemperatureUnit unit) {
                  return DropdownMenuItem<TemperatureUnit>(
                    value: unit,
                    child: Text(
                      unit.name,
                      style: AppTextStyles.mainFont,
                    ),
                  );
                },
              ).toList(),
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
                Navigator.of(context).pop();
              },
              child: Text(
                S.of(context).cancel,
                style: AppTextStyles.mainFont,
              ),
            ),
            TextButton(
              onPressed: () {
                if (widget.selectedValue != dropdownValue) {
                  context
                      .read<SettingBloc>()
                      .add(SetTemperatureUnitEvent(dropdownValue));
                  context.read<LocationBloc>().add(UpdateWeatherInfoEvent());
                }
                Navigator.of(context).pop();
              },
              child: Text(
                S.of(context).save,
                style: AppTextStyles.mainFont.copyWith(color: AppColors.orange),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
