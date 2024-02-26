import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/domain/models/city_model.dart';
import 'package:weather_forecast_app/presenter/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_forecast_app/presenter/blocs/weather_bloc/weather_event.dart';
import 'package:weather_forecast_app/theme/app_bar_button.dart';
import 'package:weather_forecast_app/theme/app_colors.dart';
import 'package:weather_forecast_app/theme/src/text_constants.dart';

class CityPanelWidget extends StatelessWidget {
  final CityModel currentCity;
  const CityPanelWidget({super.key, required this.currentCity});

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
                '${currentCity.name}${AppTextConstants.symbolComma} ${currentCity.country}',
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
              onPressed: () => {
                // Navigator.pushNamed(context, '/settings')
                BlocProvider.of<WeatherBloc>(context).add(MoveToSettingScreenEvent())
              },
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
