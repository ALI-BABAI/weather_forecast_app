import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/blocs/setting_bloc/setting_bloc.dart';
import 'package:weather_forecast_app/theme/app_bar_button.dart';
import 'package:weather_forecast_app/theme/app_colors.dart';
import 'package:weather_forecast_app/theme/src/text_constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return AppBar(
      automaticallyImplyLeading: false,
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(10),
        child: Divider(color: Colors.grey, thickness: 0.1),
      ),
      title: Text(
        TextConstants.settings,
        style: theme.titleLarge,
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 25),
          child: SizedBox(
            height: 50,
            width: 50,
            child: ElevatedButton(
              onPressed: () {
                BlocProvider.of<SettingBloc>(context)
                    .add(MoveToWeatherScreenEvent());
              },
              style: AppButtonsStyle.navigationBtn,
              child: const Icon(
                Icons.close,
                color: AppColors.white,
                size: 40,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
