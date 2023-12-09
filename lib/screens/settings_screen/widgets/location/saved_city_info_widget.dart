import 'package:flutter/material.dart';
import 'package:weather_forecast_app/screens/settings_screen/widgets/location/location_items.dart';
import 'package:weather_forecast_app/theme/colors.dart';
import 'package:weather_forecast_app/theme/text.dart';

class SavedCityInfo extends StatelessWidget {
  final Cities currentCity;
  final Function()? deleteItem;
  // final WeatherData weatherData;
  // final int indexToDelete;

  const SavedCityInfo({
    super.key,
    required this.currentCity,
    required this.deleteItem,
    // required this.weatherData,
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
              children: [
                const Icon(
                  Icons.location_on,
                  size: 40,
                  color: AppColors.white,
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 5),
                    Text('${currentCity.city}, ${currentCity.country}',
                        style: AppTextStyles.expandedMainFont),
                    Text(
                        '${currentCity.weatherData.current.temperature.round()}°, ${currentCity.weatherData.current.weather.first.description}',
                        style: AppTextStyles.secondaryFont),
                  ],
                ),
              ],
            ),
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