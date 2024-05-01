import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/domain/bloc/location_bloc/bloc/location_bloc.dart';
import 'package:weather_forecast_app/domain/bloc/setting_bloc/setting_bloc.dart';
import 'package:weather_forecast_app/domain/enums/app_languages.dart';
import 'package:weather_forecast_app/generated/l10n.dart';
import 'package:weather_forecast_app/presenter/theme/app_colors.dart';
import 'package:weather_forecast_app/presenter/theme/app_text_styles.dart';

class LanguageSettingDialog extends StatefulWidget {
  const LanguageSettingDialog({
    super.key,
    required this.title,
    required this.selectedValue,
  });

  final String title;
  final AppLanguages selectedValue;

  @override
  State<LanguageSettingDialog> createState() => _LanguageSettingDialog();
}

class _LanguageSettingDialog extends State<LanguageSettingDialog> {
  late AppLanguages dropdownValue;

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
              S.of(context).language,
              style: AppTextStyles.mainFont,
            ),
          ),
          Expanded(
            child: DropdownButton<AppLanguages>(
              isExpanded: false,
              value: dropdownValue,
              borderRadius: BorderRadius.circular(5),
              underline: const SizedBox.shrink(),
              onChanged: (AppLanguages? value) {
                setState(() {
                  dropdownValue = value!;
                });
              },
              items: AppLanguages.values.map<DropdownMenuItem<AppLanguages>>(
                (AppLanguages unit) {
                  return DropdownMenuItem<AppLanguages>(
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
              onPressed: () async {
                if (widget.selectedValue != dropdownValue) {
                  context
                      .read<SettingBloc>()
                      .add(SetLanguageEvent(dropdownValue));
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
