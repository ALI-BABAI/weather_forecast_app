// можно сделать через DRAWER виджет
// панель настроек вызывается слева или справа в экране
// https://api.flutter.dev/flutter/material/Drawer-class.html

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/domain/models/city_model.dart';
import 'package:weather_forecast_app/domain/models/weather_model.dart';
import 'package:weather_forecast_app/presenter/blocs/setting_bloc/setting_bloc.dart';
import 'package:weather_forecast_app/presenter/blocs/setting_bloc/setting_state.dart';
import 'package:weather_forecast_app/presenter/blocs/setting_bloc/settings_screen/widgets/location/location_widget.dart';
import 'package:weather_forecast_app/theme/app_bar_button.dart';
import 'package:weather_forecast_app/theme/app_colors.dart';
import 'package:weather_forecast_app/theme/app_decoration.dart';
import 'package:weather_forecast_app/theme/src/text_constants.dart';

import 'widgets/tools/tools_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    // final settingBloc = context.read<SettingBloc>();
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.mainBackground,
            title: Text(
              AppTextConstants.settings,
              style: theme.titleLarge, // style: AppTextStyles.appBarFont,
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // settingBloc.add(LoadingSettingScreenEvent());
                    },
                    style: AppButtonsStyle.navigationBtn,
                    child: const Icon(
                      Icons.close,
                      color: AppColors.white,
                      size: 40,
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: DecoratedBox(
            decoration: AppDecorations.darkDecorationTheme,
            child: BlocBuilder<SettingBloc, SettingState>(
              builder: (context, state) {
                if (state is LoadedState) {
                  final List<CityModel> savedCities = state.cities;
                  final List<WeatherModel> weatherData = state.weatherData;
                  return ListView(
                    primary: true,
                    children: [
                      LocationWidget(
                        savedCities: savedCities,
                        weatherData: weatherData,
                      ),
                      const ToolsWidget(),
                      const SizedBox(height: 20),
                      const Placeholder(fallbackHeight: 400, fallbackWidth: 400)
                    ],
                  );
                } else if (state is ErrorState) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return ListView(
                    primary: true,
                    children: const [
                      SizedBox(height: 20),
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                      // LocationWidget(),
                      ToolsWidget(),
                      SizedBox(height: 20),
                      Placeholder(fallbackHeight: 400, fallbackWidth: 400)
                    ],
                  );
                }
              },
            ),
          ),
        ));
  }
}
