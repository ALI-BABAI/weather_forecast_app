import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/src/domain/bloc/location_bloc/bloc/location_bloc.dart';
import 'package:weather_forecast_app/generated/l10n.dart';
import 'package:weather_forecast_app/src/presenter/theme/app_bar_button.dart';
import 'package:weather_forecast_app/src/presenter/theme/app_colors.dart';


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
        S.of(context).settings,
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
                BlocProvider.of<LocationBloc>(context)
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
