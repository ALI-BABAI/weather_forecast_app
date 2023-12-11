import 'package:flutter/material.dart';
import 'package:weather_forecast_app/data_handling/serialisator/cities.dart';
import 'package:weather_forecast_app/main.dart';
import 'package:weather_forecast_app/theme/colors.dart';
import 'package:weather_forecast_app/theme/text.dart';

class SavedCityInfo extends StatelessWidget {
  final int index;
  final ApiCity currentCity;
  final Function()? deleteItem;

  const SavedCityInfo({
    super.key,
    required this.index,
    required this.currentCity,
    required this.deleteItem,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              // иконка + название города(страны)
              children: [
                const Icon(
                  Icons.location_on,
                  size: 40,
                  color: AppColors.white,
                ),
                const SizedBox(height: 10),
                // название города(страны) + краткая информация по текущей погоде
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 5),
                    Text('${currentCity.name}, ${currentCity.country}',
                        style: AppTextStyles.expandedMainFont),
                    Text(
                        '${weatherInSavedCities.elementAt(index)!.current.temperature.round()}°, ${weatherInSavedCities.elementAt(index)!.current.weather.first.description}',
                        style: AppTextStyles.secondaryFont),
                  ],
                ),
              ],
            ),
            // кнопка для удаления элемента из списка
            IconButton(
              onPressed: deleteItem,
              icon: const Icon(
                Icons.delete_forever,
                color: AppColors.orange,
                size: 35,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
