import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/domain/bloc/setting_bloc/setting_bloc.dart';
import 'package:weather_forecast_app/theme/app_colors.dart';
import 'package:weather_forecast_app/theme/app_text_styles.dart';
import 'package:weather_forecast_app/theme/src/text_constants.dart';

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
            hintText: TextConstants.enterCityName,
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
                    child: BlocBuilder<SettingBloc, SettingState>(
                      builder: (context, state) {
                        return (state as LoadedSettingState).isSearching ??
                                false
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : Text(
                                TextConstants.add,
                                style: AppTextStyles.poppinsFont(),
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
