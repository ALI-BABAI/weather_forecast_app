import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/domain/models/city_model.dart';
import 'package:weather_forecast_app/domain/models/weather_model.dart';
import 'package:weather_forecast_app/blocs/setting_bloc/setting_bloc.dart';
import 'package:weather_forecast_app/theme/app_colors.dart';
import 'package:weather_forecast_app/theme/app_text_styles.dart';

class FavouriteCityPanel extends StatelessWidget {
  const FavouriteCityPanel({
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
      key: Key(panelIndex.toString()),
      onDismissed: (direction) {
        BlocProvider.of<SettingBloc>(context).add(DeleteCityEvent(panelIndex));
      },
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 4),
        leading: const Icon(
          Icons.location_on,
          color: AppColors.white,
          size: 40,
        ),
        trailing: IconButton(
          onPressed: () => BlocProvider.of<SettingBloc>(context)
              .add(DeleteCityEvent(panelIndex)),
          icon: const Icon(
            Icons.delete_forever,
            color: AppColors.orange,
            size: 35,
          ),
        ),
        title: Text(
          '${savedCities.elementAt(panelIndex).name}, ${savedCities.elementAt(panelIndex).country}',
          style: AppTextStyles.expandedMainFont,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          '${weatherData.elementAt(panelIndex).temperature}°, '
          '${weatherData.elementAt(panelIndex).description}',
          style: AppTextStyles.secondaryFont,
        ),
      ),
    );
  }
}
