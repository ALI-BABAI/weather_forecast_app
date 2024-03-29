import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/domain/models/city_model.dart';
import 'package:weather_forecast_app/domain/models/weather_model.dart';
import 'package:weather_forecast_app/presenter/blocs/setting_bloc/setting_bloc.dart';
import 'package:weather_forecast_app/theme/app_colors.dart';
import 'package:weather_forecast_app/theme/app_text_styles.dart';
import 'package:weather_forecast_app/theme/src/text_constants.dart';

class FavouriteCityPanel extends StatelessWidget {
  const FavouriteCityPanel(
     {
    super.key,
    required this.panelIndex,
    required this.savedCities,
    required this.weatherData,
  });

  final int panelIndex;

  final List<CityModel> savedCities;
  final List<WeatherModel> weatherData;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        BlocProvider.of<SettingBloc>(context).add(DeleteCityEvent(panelIndex));
      },
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 4),
        // иконка геопозиции
        leading: const Icon(
          Icons.location_on,
          color: AppColors.white,
          size: 40,
        ),
        // кнопка удаления
        trailing: IconButton(
          onPressed: () =>
              BlocProvider.of<SettingBloc>(context).add(DeleteCityEvent(panelIndex)),
          icon: const Icon(
            Icons.delete_forever,
            color: AppColors.orange,
            size: 35,
          ),
        ),
        // город и страна
        title: Text(
          '${savedCities.elementAt(panelIndex).name}${AppTextConstants.symbolComma} ${savedCities.elementAt(panelIndex).country}',
          style: AppTextStyles.expandedMainFont,
          overflow: TextOverflow.ellipsis,
        ),
        // информация по текущему городу
        subtitle: Text(
          '${weatherData.elementAt(panelIndex).temperature}'
          '${AppTextConstants.symbolDegree}${AppTextConstants.symbolComma} '
          '${weatherData.elementAt(panelIndex).description}',
          style: AppTextStyles.secondaryFont,
        ),
      ),
    );
  }
}
