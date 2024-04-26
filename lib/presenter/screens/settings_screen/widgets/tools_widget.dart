import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/domain/bloc/setting_bloc/setting_bloc.dart';
import 'package:weather_forecast_app/domain/enums/tool_items.dart';
import 'package:weather_forecast_app/generated/l10n.dart';
import 'package:weather_forecast_app/presenter/theme/app_colors.dart';
import 'package:weather_forecast_app/presenter/theme/app_text_styles.dart';
import 'package:weather_forecast_app/screens_deprecated/dialog_windows/dialog_window.dart';

class ToolsWidget extends StatelessWidget {
  const ToolsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).tools,
          style: AppTextStyles.settingsScreenHeaderFont,
        ),
        const SizedBox(height: 10),
        ListView(
          shrinkWrap: true,
          primary: false,
          children: [
            ToolItemWidget(
              toolItemType: ToolItem.measurementUnits,
              function: () => {
                DialogWindow.showDialogScreen(
                  context: context,
                  title: S.of(context).appUnits,
                  selectedValue: listTemperatureUnit.first,
                ),
              },
            ),
            ToolItemWidget(
              toolItemType: ToolItem.notifications,
              function: () {
                context
                    .read<SettingBloc>()
                    .add(SetLanguageEvent(S.of(context).ru));
              },
            ),
            ToolItemWidget(
              toolItemType: ToolItem.language,
              function: () {
                context
                    .read<SettingBloc>()
                    .add(SetLanguageEvent(S.of(context).en));
              },
            ),
          ],
        ),
      ],
    );
  }
}

class ToolItemWidget extends StatelessWidget {
  const ToolItemWidget({
    super.key,
    required this.toolItemType,
    required this.function,
  });

  final ToolItem toolItemType;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextButton(
        onPressed: function,
        child: Row(
          children: [
            Icon(
              toolItemType.iconType,
              color: AppColors.white,
            ),
            const SizedBox(width: 10),
            Text(
              toolItemType.buttonName,
              style: AppTextStyles.expandedMainFont,
            ),
          ],
        ),
      ),
    );
  }
}
