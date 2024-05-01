import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/src/domain/bloc/location_bloc/bloc/location_bloc.dart';
import 'package:weather_forecast_app/src/domain/models/city_model.dart';
import 'package:weather_forecast_app/src/domain/models/weather_model.dart';
import 'package:weather_forecast_app/src/presenter/theme/app_colors.dart';
import 'package:weather_forecast_app/src/presenter/theme/app_text_styles.dart';

import '../../../../../generated/l10n.dart';

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
      direction: DismissDirection.endToStart,
      confirmDismiss: (DismissDirection direction) async {
        if (direction == DismissDirection.endToStart) {
          return await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  S.of(context).deleteConfirmNotification(
                      savedCities.elementAt(panelIndex).name.toString()),
                  style: AppTextStyles.settingsScreenHeaderFont
                      .copyWith(fontSize: 20),
                ),
                actionsAlignment: MainAxisAlignment.spaceAround,
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text(
                      S.of(context).cancel,
                      style: AppTextStyles.mainFont,
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: Text(
                      S.of(context).delete,
                      style: AppTextStyles.mainFont
                          .copyWith(color: Colors.redAccent),
                    ),
                  ),
                ],
              );
            },
          );
        }
        return null;
      },
      background: const ColoredBox(
        color: Colors.redAccent,
        child: Align(
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                "Delete",
                style: AppTextStyles.expandedMainFont,
                textAlign: TextAlign.right,
              ),
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.delete_forever,
                color: Colors.white,
                size: 35,
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        ),
      ),
      onDismissed: (direction) {
        BlocProvider.of<LocationBloc>(context).add(DeleteCityEvent(panelIndex));
      },
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 4),
        leading: const Icon(
          Icons.location_on,
          color: AppColors.white,
          size: 40,
        ),
        trailing: IconButton(
          onPressed: () => BlocProvider.of<LocationBloc>(context)
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
