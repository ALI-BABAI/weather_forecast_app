import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/domain/models/city_model.dart';
import 'package:weather_forecast_app/domain/models/weather_model.dart';
import 'package:weather_forecast_app/presenter/blocs/setting_bloc/setting_bloc.dart';
import 'package:weather_forecast_app/presenter/blocs/setting_bloc/setting_event.dart';
import 'package:weather_forecast_app/theme/app_colors.dart';
import 'package:weather_forecast_app/theme/app_text_styles.dart';
import 'package:weather_forecast_app/theme/src/text_constants.dart';

class LocationWidget extends StatelessWidget {
  final List<CityModel> savedCities;
  final List<WeatherModel> weatherData;
  const LocationWidget({
    super.key,
    required this.savedCities,
    required this.weatherData,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label
          Text(AppTextConstants.location, style: theme.titleSmall),
          const SearchBarWidget(),
          SavedLocationsWidget(
            savedCities: savedCities,
            weatherData: weatherData
          ),
        ],
      ),
    );
  }
}

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final settingBloc = context.read<SettingBloc>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 46,
        child: TextField(
          controller: _cityController,
          onSubmitted: (value) =>
              settingBloc.add(AddCityEvent(_cityController.text)),
          keyboardAppearance: Brightness.dark,
          textCapitalization: TextCapitalization.words,
          style: AppTextStyles.expandedMainFont,
          cursorColor: Colors.cyan,
          decoration: InputDecoration(
            hintText: AppTextConstants.enterCityName,
            hintStyle: AppTextStyles.secondaryFont,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.orange),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.orange),
            ),
            contentPadding: const EdgeInsets.only(left: 20),
            // кнопки в текстовом поле
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // geopozition btn
                TextButton(
                  onPressed: () {},
                  child: const Icon(
                    Icons.add_location_alt_outlined,
                    color: AppColors.orange,
                    size: 30,
                  ),
                ),
                // ADD btn
                SizedBox(
                  height: 50,
                  child: TextButton(
                    onPressed: () =>
                        settingBloc.add(AddCityEvent(_cityController.text)),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.orange),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    child: Text(
                      AppTextConstants.add,
                      style: AppTextStyles.poppinsFont(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SavedLocationsWidget extends StatelessWidget {
  final List<CityModel> savedCities;
  final List<WeatherModel> weatherData;
  const SavedLocationsWidget({
    super.key,
    required this.savedCities,
    required this.weatherData,
  });

  @override
  Widget build(BuildContext context) {
    final settingBloc = context.read<SettingBloc>();
    return Column(
      children: [
        ListView.builder(
          primary: false,
          shrinkWrap: true,
          itemCount: savedCities.length,
          itemBuilder: (context, index) {
            final savedCity = savedCities.elementAt(index);
            return Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) {
                settingBloc.add(DeleteCityEvent(index));
              },
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 3),
                // иконка геопозиции
                leading: const Icon(
                  Icons.location_on,
                  size: 40,
                  color: AppColors.white,
                ),
                // кнопка удаления
                trailing: IconButton(
                  // onPressed: () => state.removeCityInDB(index),
                  onPressed: () => settingBloc.add(DeleteCityEvent(index)),
                  icon: const Icon(
                    Icons.delete_forever,
                    color: AppColors.orange,
                    size: 35,
                  ),
                ),
                // город и страна
                title: Text(
                  '${savedCity.name}${AppTextConstants.symbolComma} ${savedCity.country}',
                  style: AppTextStyles.expandedMainFont,
                  overflow: TextOverflow.ellipsis,
                ),
                // информация по текущему городу
                subtitle: Text(
                  '${weatherData.elementAt(index).temperature}'
                  '${AppTextConstants.symbolDegree}${AppTextConstants.symbolComma} '
                  '${weatherData.elementAt(index).description}',
                  style: AppTextStyles.secondaryFont,
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
