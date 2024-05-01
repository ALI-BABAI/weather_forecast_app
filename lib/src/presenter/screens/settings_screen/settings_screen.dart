import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/src/domain/bloc/location_bloc/bloc/location_bloc.dart';
import 'package:weather_forecast_app/src/domain/models/city_model.dart';
import 'package:weather_forecast_app/src/domain/models/weather_model.dart';
import 'package:weather_forecast_app/generated/l10n.dart';
import 'package:weather_forecast_app/src/presenter/screens/settings_screen/widgets/custom_app_bar.dart';
import 'package:weather_forecast_app/src/presenter/screens/settings_screen/widgets/favourite_city_panel.dart';
import 'package:weather_forecast_app/src/presenter/screens/settings_screen/widgets/search_bar.dart';
import 'package:weather_forecast_app/src/domain/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather_forecast_app/src/presenter/theme/app_decoration.dart';

import 'widgets/tools_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationBloc, LocationState>(
      listener: (context, state) {
        if (state is OpenWeatherScreenState) {
          BlocProvider.of<WeatherBloc>(context)
              .add(LoadingWeatherScreenEvent());
          Navigator.pop(context, '/weather');
        }
        if (state is ErrorSettingState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.amber,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is LoadedLocationState) {
          final List<CityModel> savedCities = state.cities;
          final List<WeatherModel> weatherData = state.weatherData;
          return ScreenFrame(
            widget: RefreshIndicator(
              backgroundColor: Colors.amber,
              onRefresh: () {
                return Future(
                  () {
                    context.read<LocationBloc>().add(UpdateWeatherInfoEvent());
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('screen updated'),
                        backgroundColor: Colors.amber,
                      ),
                    );
                  },
                );
              },
              child: ListView(
                children: [
                  ReordableSettingWidget(
                    savedCities: savedCities,
                    weatherData: weatherData,
                  ),
                  const SizedBox(height: 20),
                  const ToolsWidget(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        } else if (state is ErrorSettingState) {
          return const ScreenFrame(
            widget: CircularProgressIndicator(),
          );
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
    return Scaffold(
      appBar: const CustomAppBar(),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (didPop) {
            return;
          }
          BlocProvider.of<LocationBloc>(context)
              .add(MoveToWeatherScreenEvent());
        },
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: DecoratedBox(
            decoration: AppDecorations.darkDecorationTheme,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 22,
              ),
              child: widget,
            ),
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
      buildDefaultDragHandles: false,
      primary: false,
      shrinkWrap: true,
      onReorder: (oldIndex, newIndex) {
        setState(() => {});
      },
      onReorderEnd: (index) {
        BlocProvider.of<LocationBloc>(context)
            .add(ChangeCityIndexEvent(index, indexOld));
      },
      onReorderStart: (index) {
        indexOld = index;
      },
      header: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.of(context).location, style: theme.titleSmall),
          const SearchBarWidget(),
        ],
      ),
      // favourite cities reordable list
      children: <Widget>[
        for (int index = 0; index < widget.savedCities.length; index++)
          ReorderableDragStartListener(
            key: Key(index.toString()),
            index: index,
            child: FavouriteCityPanel(
              key: Key(index.toString()),
              panelIndex: index,
              savedCities: widget.savedCities,
              weatherData: widget.weatherData,
            ),
          ),
      ],
    );
  }
}
