import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_forecast_app/data_handling/network/serialisator/weather/weather_data.dart';
import 'package:weather_forecast_app/screens/home_screen/widgets/city_forecasts_widgets/current%20forecast%20widgets/dotted_divider.dart';
import 'package:weather_forecast_app/screens/home_screen/widgets/city_forecasts_widgets/current%20forecast%20widgets/extended_parameters.dart';
import 'package:weather_forecast_app/screens/home_screen/widgets/city_forecasts_widgets/current%20forecast%20widgets/main_weather.dart';
import 'package:weather_forecast_app/theme/app_colors.dart';
import 'package:weather_forecast_app/theme/app_text_styles.dart';

class MainForecastWidget extends StatelessWidget {
  final WeatherData weatherData;
  const MainForecastWidget({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    // Преобразование Unix timestamp в объект DateTime
    // Из числа получаем текущее время
    final currentDate = DateTime.fromMillisecondsSinceEpoch(
        (weatherData.timezoneOffset + weatherData.current.date) * 1000,
        isUtc: true);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DecoratedBox(
              decoration: const BoxDecoration(
                // color: Color(0xFF32333E),  // потемнее будет
                color: AppColors.widgetBackground,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  '${DateFormat.EEEE().format(currentDate)}, ${DateFormat.d().format(currentDate)} ${DateFormat.MMMM().format(currentDate)}',
                  style: AppTextStyles.smallestSecondaryFont,
                ),
              ),
            ),
          ],
        ),
        // Текущая информация о погоде
        MainWeatherForecast(weatherData: weatherData),
        // Пунктирный разделитель
        const Row(
          children: [
            Expanded(child: DottedDivederWidget()),
          ],
        ),
        // Давление, влажность, сила и направление ветра
        WeatherExtendedParameters(weatherData: weatherData),
      ],
    );
  }
}

/*RichText(
    textAlign: TextAlign.center,
    text: const TextSpan(
      style: AppTextStyles.secondaryFont,
      children: <TextSpan>[
        TextSpan(text: '5°/12° Feels like '),
        TextSpan(
          text: '7°C',
          style: AppTextStyles.secondaryFont,
        )
      ],
    ),
  ), 
*/
