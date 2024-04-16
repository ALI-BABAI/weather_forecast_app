// можно сделать через DRAWER виджет
// панель настроек вызывается слева или справа в экране
// https://api.flutter.dev/flutter/material/Drawer-class.html

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/domain/models/city_model.dart';
import 'package:weather_forecast_app/domain/models/weather_model.dart';
import 'package:weather_forecast_app/blocs/setting_bloc/setting_bloc.dart';
import 'package:weather_forecast_app/presenter/settings_screen/widgets/custom_app_bar.dart';
import 'package:weather_forecast_app/presenter/settings_screen/widgets/favourite_city_panel.dart';
import 'package:weather_forecast_app/presenter/settings_screen/widgets/search_bar.dart';
import 'package:weather_forecast_app/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_forecast_app/theme/app_decoration.dart';
import 'package:weather_forecast_app/theme/src/text_constants.dart';

import 'widgets/tools_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingBloc, SettingState>(
      listener: (context, state) {
        if (state is OpenWeatherScreenState) {
          BlocProvider.of<WeatherBloc>(context)
              .add(LoadingWeatherScreenEvent());
          Navigator.pop(context, '/weather');
        }
      },
      builder: (context, state) {
        if (state is LoadedSettingState) {
          final List<CityModel> savedCities = state.cities;
          final List<WeatherModel> weatherData = state.weatherData;
          return ScreenFrame(
            widget: ReordableSettingWidget(
              savedCities: savedCities,
              weatherData: weatherData,
            ),
          );
        } else if (state is ErrorSettingState) {
          return const ScreenFrame(widget: CircularProgressIndicator());
        } else {
          return const DecoratedBox(
            decoration: AppDecorations.darkDecorationTheme,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

class ScreenFrame extends StatelessWidget {
  const ScreenFrame({super.key, required this.widget});
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) {
          return;
        }
        BlocProvider.of<SettingBloc>(context).add(MoveToWeatherScreenEvent());
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: const CustomAppBar(),
          body: DecoratedBox(
            decoration: AppDecorations.darkDecorationTheme,
            child: widget,
          ),
        ),
      ),
    );
  }
}

class ReordableSettingWidget extends StatefulWidget {
  const ReordableSettingWidget({
    super.key,
    required this.savedCities,
    required this.weatherData,
  });

  final List<CityModel> savedCities;
  final List<WeatherModel> weatherData;

  @override
  State<ReordableSettingWidget> createState() => _ReordableSettingWidget();
}

class _ReordableSettingWidget extends State<ReordableSettingWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    int indexOld = 0;
    return ReorderableListView(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 22,
      ),
      onReorder: (oldIndex, newIndex) {
        setState(() => {});
      },
      onReorderEnd: (index) {
        BlocProvider.of<SettingBloc>(context)
            .add(ChangeCityIndexEvent(index, indexOld));
      },
      onReorderStart: (index) {
        indexOld = index;
      },
      header: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppTextConstants.location, style: theme.titleSmall),
          const SearchBarWidget(),
        ],
      ),
      footer: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          ToolsWidget(),
          SizedBox(height: 20),
          Placeholder(fallbackHeight: 400, fallbackWidth: 400)
        ],
      ),
      // favourite cities reordable list
      children: <Widget>[
        for (int index = 0; index < widget.savedCities.length; index++)
          FavouriteCityPanel(
            key: UniqueKey(),
            panelIndex: index,
            savedCities: widget.savedCities,
            weatherData: widget.weatherData,
          ),
      ],
    );
  }
}
