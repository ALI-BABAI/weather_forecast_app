import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/src/domain/bloc/location_bloc/bloc/location_bloc.dart';
import 'package:weather_forecast_app/generated/l10n.dart';
import 'package:weather_forecast_app/src/presenter/theme/app_colors.dart';
import 'package:weather_forecast_app/src/presenter/theme/app_text_styles.dart';

import '../../../../domain/enums/app_languages.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _cityController = TextEditingController();

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locationBloc = context.read<LocationBloc>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 46,
        child: TextField(
          controller: _cityController,
          onSubmitted: (value) =>
              locationBloc.add(AddCityEvent(_cityController.text)),
          keyboardAppearance: Brightness.dark,
          textCapitalization: TextCapitalization.words,
          style: AppTextStyles.expandedMainFont,
          cursorColor: Colors.cyan,
          decoration: InputDecoration(
            hintText: S.of(context).enterCityName,
            hintStyle: AppTextStyles.secondaryFont,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.orange),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.orange),
            ),
            contentPadding: const EdgeInsets.only(left: 20),
            // geopozition + add btn's
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ADD btn
                SizedBox(
                  height: 50,
                  child: TextButton(
                    onPressed: () =>
                        locationBloc.add(AddCityEvent(_cityController.text)),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.orange),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    child: BlocBuilder<LocationBloc, LocationState>(
                      builder: (context, state) {
                        return (state as LoadedLocationState).isSearching ??
                                false
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : Localizations.localeOf(context).languageCode ==
                                    AppLanguages.en.name
                                ? Text(
                                    S.of(context).add,
                                    style: AppTextStyles.loadingScreenFont,
                                  )
                                : const Icon(
                                    Icons.add_task_rounded, //add_task_rounded
                                    size: 30,
                                  );
                      },
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
