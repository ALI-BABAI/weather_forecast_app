import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:weather_forecast_app/domain/models/weather_model.dart';
import 'package:weather_forecast_app/presenter/weather_screen/widgets/city_widget/city_forecasts_widgets/main_forecast_widgets/dotted_divider.dart';
import 'package:weather_forecast_app/theme/app_colors.dart';
import 'package:weather_forecast_app/theme/app_text_styles.dart';
import 'package:weather_forecast_app/theme/src/text_constants.dart';

class MainForecastWidget extends StatelessWidget {
  final WeatherModel weatherData;
  const MainForecastWidget({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        // День недели и дата
        DateWidget(weatherData: weatherData),
        // Текущая информация о погоде
        BasicWeatherInfoWidget(weatherData: weatherData),
        // Пунктирный разделитель
        const DottedDivederWidget(),
        // Давление, влажность, сила и направление ветра
        ExtendedWeatherInfoWidget(weatherData: weatherData),
      ],
    );
  }
}

class DateWidget extends StatelessWidget {
  final WeatherModel weatherData;
  const DateWidget({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DecoratedBox(
          decoration: const BoxDecoration(
            color: AppColors.widgetBackground,
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              '${DateFormat.EEEE().format(weatherData.date)}${AppTextConstants.symbolComma} '
              '${DateFormat.d().format(weatherData.date)} ${DateFormat.MMMM().format(weatherData.date)}',
              style: AppTextStyles.smallestSecondaryFont,
            ),
          ),
        ),
      ],
    );
  }
}


class BasicWeatherInfoWidget extends StatelessWidget {
  final WeatherModel weatherData;
  const BasicWeatherInfoWidget({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(
            'assets/images/weather_conditions/${weatherData.iconID}.svg',
            semanticsLabel: AppTextConstants.semanticLabelCurrentWeatherIcon,
            height: 125,
            width: 125,
          ),
          SizedBox(
            height: 160,
            child: Column(
              children: [
                // Градиентный текст с текущей температурой
                Expanded(
                  child: GradientText(
                    '${weatherData.temperature}'
                    '${AppTextConstants.symbolDegree}',
                    gradientDirection: GradientDirection.ttb,
                    style: const TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.w500,
                    ),
                    colors: AppColors.grayGradientText,
                  ),
                ),
                Text(
                  weatherData.description,
                  style: AppTextStyles.expandedMainFont,
                ),
                const SizedBox(height: 5),
                // Доп.температурные параметры по текущему дню
                Text(
                  '${weatherData.daily.first.maxTemperature}${AppTextConstants.symbolDegree}${AppTextConstants.symbolSlash}'
                  '${weatherData.daily.first.minTemperature}${AppTextConstants.symbolDegree}'
                  ' ${AppTextConstants.feelsLike} ${weatherData.temperatureFillsLike}${AppTextConstants.celsiumDegree}',
                  style: AppTextStyles.secondaryFont,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// Давление, влажность, сила и направление ветра
class ExtendedWeatherInfoWidget extends StatelessWidget {
  final WeatherModel weatherData;
  const ExtendedWeatherInfoWidget({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WeatherParameter(
                name: AppTextConstants.wind,
                info: '${weatherData.wind}${AppTextConstants.unitMeterBySec}',
                icon: Icons.air_rounded,
              ),
              WeatherParameter(
                name: AppTextConstants.pressure,
                info: '${weatherData.pressure}${AppTextConstants.unitHPa}',
                icon: Icons.speed_rounded,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WeatherParameter(
                name: AppTextConstants.visibility,
                info: '${weatherData.visibility}${AppTextConstants.unitKm}',
                icon: Icons.visibility_outlined,
              ),
              WeatherParameter(
                name: AppTextConstants.humidity,
                info: '${weatherData.humidity}${AppTextConstants.unitPercent}',
                icon: Icons.water_drop_outlined,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class WeatherParameter extends StatelessWidget {
  final String name;
  final IconData icon;
  final String info;

  const WeatherParameter(
      {super.key, required this.name, required this.icon, required this.info});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon),
          const SizedBox(width: 12),
          Text(
            name,
            style: AppTextStyles.secondaryFont,
          ),
          Text(info, style: AppTextStyles.mainFont),
        ],
      ),
    );
  }
}