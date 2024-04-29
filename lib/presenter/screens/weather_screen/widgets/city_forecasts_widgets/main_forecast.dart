import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:weather_forecast_app/domain/bloc/setting_bloc/setting_bloc.dart';
import 'package:weather_forecast_app/domain/enums/measurement_units.dart';
import 'package:weather_forecast_app/domain/models/weather_model.dart';
import 'package:weather_forecast_app/generated/l10n.dart';
import 'package:weather_forecast_app/presenter/common_widgets/dotted_divider.dart';
import 'package:weather_forecast_app/presenter/theme/app_colors.dart';
import 'package:weather_forecast_app/presenter/theme/app_text_styles.dart';

/// Иконка погоды, текущая погода + доп.параметры
class MainForecastWidget extends StatelessWidget {
  const MainForecastWidget(this.weatherData, {super.key});

  final WeatherModel weatherData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        DateWidget(weatherData),
        BasicWeatherInfoWidget(weatherData),
        const DottedDivederWidget(),
        ExtendedWeatherInfoWidget(weatherData),
      ],
    );
  }
}

/// День недели и дата
class DateWidget extends StatelessWidget {
  const DateWidget(this.weatherData, {super.key});

  final WeatherModel weatherData;

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
              DateFormat(
                'EEEE, d MMMM',
                Localizations.localeOf(context).languageCode,
              ).format(weatherData.date),
              style: AppTextStyles.smallestSecondaryFont,
            ),
          ),
        ),
      ],
    );
  }
}

/// Погода на текущий день
class BasicWeatherInfoWidget extends StatelessWidget {
  const BasicWeatherInfoWidget(this.weatherData, {super.key});

  final WeatherModel weatherData;

  @override
  Widget build(BuildContext context) {
    final day = weatherData.daily.first;
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            flex: 1,
            child: Center(
              child: SizedBox(
                height: 125,
                width: 125,
                child: SvgPicture.asset(
                  'assets/images/weather_conditions/${weatherData.iconID}.svg',
                  semanticsLabel: S.of(context).currentWeatherIcon,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Column(
              children: [
                GradientText(
                  '${weatherData.temperature}°',
                  gradientDirection: GradientDirection.ttb,
                  textScaleFactor: 1,
                  style: const TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),
                  colors: AppColors.grayGradientText,
                ),
                Text(
                  weatherData.description,
                  style: AppTextStyles.expandedMainFont,
                ),
                const SizedBox(height: 5),
                // Доп.температурные параметры по текущему дню
                Text(
                  S.of(context).feelsLike(
                        day.maxTemperature,
                        day.minTemperature,
                        weatherData.temperatureFillsLike,
                        context
                            .watch<SettingBloc>()
                            .state
                            .temperatureUnit
                            .unitDegree,
                      ),
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

/// Давление, влажность, сила и направление ветра
class ExtendedWeatherInfoWidget extends StatelessWidget {
  const ExtendedWeatherInfoWidget(this.weatherData, {super.key});

  final WeatherModel weatherData;

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
                name: S.of(context).wind,
                info: S.of(context).xMetersBySecond(weatherData.wind),
                icon: Icons.air_rounded,
              ),
              WeatherParameter(
                name: S.of(context).pressure,
                info: '${weatherData.pressure}${S.of(context).hpaUnit}',
                icon: Icons.speed_rounded,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WeatherParameter(
                name: S.of(context).visibility,
                info: S.of(context).xKm(weatherData.visibility),
                icon: Icons.visibility_outlined,
              ),
              WeatherParameter(
                name: S.of(context).humidity,
                info: '${weatherData.humidity}%',
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

  const WeatherParameter({
    super.key,
    required this.name,
    required this.icon,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon),
          const SizedBox(width: 12),
          Text(name, style: AppTextStyles.secondaryFont),
          Text(info, style: AppTextStyles.mainFont),
        ],
      ),
    );
  }
}
