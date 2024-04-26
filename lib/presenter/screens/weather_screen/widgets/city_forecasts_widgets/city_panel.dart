import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/domain/models/city_model.dart';
import 'package:weather_forecast_app/domain/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather_forecast_app/presenter/theme/app_bar_button.dart';
import 'package:weather_forecast_app/presenter/theme/app_colors.dart';

/// Город и кнопка перехода на экран настроек
class CityPanelWidget extends StatelessWidget {
  const CityPanelWidget(this.currentCity, {super.key});

  final CityModel currentCity;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.widgetBackground,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                '${currentCity.name}, ${currentCity.country}',
                style: theme.textTheme.titleLarge,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          // кнопка перехода на экран настроек
          SizedBox(
            height: 55,
            width: 55,
            child: IconButton(
              onPressed: () => BlocProvider.of<WeatherBloc>(context)
                  .add(MoveToSettingScreenEvent()),
              icon: const Center(
                child: Icon(
                  Icons.settings,
                  size: 35,
                ),
              ),
              style: AppButtonsStyle.navigationBtn.copyWith(
                backgroundColor: const MaterialStatePropertyAll(
                  AppColors.widgetBackground,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
