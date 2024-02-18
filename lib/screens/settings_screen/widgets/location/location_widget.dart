// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:weather_forecast_app/main.dart';
// import 'package:weather_forecast_app/data/services/preferency_manager.dart';
// import 'package:weather_forecast_app/theme/app_colors.dart';
// import 'package:weather_forecast_app/theme/app_text_styles.dart';
// import 'package:weather_forecast_app/theme/src/text_constants.dart';

// class LocationWidget extends StatelessWidget {
//   const LocationWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // final Widget citiesList =
//     //     context.read<PreferencesManager>().savedListOfCities.citiesList.isEmpty
//     //         ? const SizedBox.shrink()
//     //         : const SavedCitiesListWidget();
//     final theme = Theme.of(context).textTheme;
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Локация
//           Text(
//             AppTextConstants.location,
//             style: theme.titleSmall,
//             // style: AppTextStyles.settingsScreenHeaderFont,
//           ),
//           const SearchBarWidget(),
//           const SavedLocationsWidget(),
//         ],
//       ),
//     );
//   }
// }

// class SearchBarWidget extends StatefulWidget {
//   const SearchBarWidget({super.key});

//   @override
//   State<SearchBarWidget> createState() => _SearchBarWidgetState();
// }

// class _SearchBarWidgetState extends State<SearchBarWidget> {
//   final TextEditingController _cityController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: SizedBox(
//         height: 46,
//         child: TextField(
//           controller: _cityController,
//           onSubmitted: (value) async {
//             await context
//                 .read<PreferencesManager>()
//                 .addCityToDB(userString: value);
//           },
//           keyboardAppearance: Brightness.dark,
//           textCapitalization: TextCapitalization.words,
//           style: AppTextStyles.expandedMainFont,
//           cursorColor: Colors.cyan,
//           decoration: InputDecoration(
//             hintText: AppTextConstants.enterCityName,
//             hintStyle: AppTextStyles.secondaryFont,
//             focusedBorder: const OutlineInputBorder(
//               borderSide: BorderSide(color: AppColors.orange),
//             ),
//             enabledBorder: const OutlineInputBorder(
//               borderSide: BorderSide(color: AppColors.orange),
//             ),
//             contentPadding: const EdgeInsets.only(left: 20),
//             // кнопки в текстовом поле
//             suffixIcon: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 // geopozition btn
//                 TextButton(
//                   onPressed: () {},
//                   child: const Icon(
//                     Icons.add_location_alt_outlined,
//                     color: AppColors.orange,
//                     size: 30,
//                   ),
//                 ),
//                 // ADD btn
//                 SizedBox(
//                   height: 50,
//                   child: TextButton(
//                     // https://www.youtube.com/watch?v=f3mI0thSNOs
//                     onPressed: () async {
//                       await context
//                           .read<PreferencesManager>()
//                           .addCityToDB(userString: _cityController.text);
//                     },
//                     style: ButtonStyle(
//                       backgroundColor:
//                           MaterialStateProperty.all(AppColors.orange),
//                       shape: MaterialStatePropertyAll(
//                         RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                       ),
//                     ),
//                     child: Text(
//                       AppTextConstants.add,
//                       style: AppTextStyles.poppinsFont(),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SavedLocationsWidget extends StatelessWidget {
//   const SavedLocationsWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final state = context.read<PreferencesManager>();
//     final valueList = context.watch<PreferencesManager>().savedListOfCities;
//     var searchState = state.getSearchingState();
//     return Column(
//       children: [
//         if (searchState == SearchState.loading)
//           const Center(child: CircularProgressIndicator())
//         else
//           ListView.builder(
//             primary: false,
//             shrinkWrap: true,
//             itemCount: valueList.citiesList.length,
//             itemBuilder: (context, index) {
//               final savedCity = valueList.citiesList[index];
//               return Dismissible(
//                 key: UniqueKey(),
//                 onDismissed: (direction) => state.removeCityInDB(index),
//                 child: ListTile(
//                   contentPadding: const EdgeInsets.symmetric(horizontal: 3),
//                   // константная иконка геопозиции
//                   leading: const Icon(
//                     Icons.location_on,
//                     size: 40,
//                     color: AppColors.white,
//                   ),
//                   // кнопка удаления
//                   trailing: IconButton(
//                     onPressed: () => state.removeCityInDB(index),
//                     icon: const Icon(
//                       Icons.delete_forever,
//                       color: AppColors.orange,
//                       size: 35,
//                     ),
//                   ),
//                   // город и страна
//                   title: Text(
//                     '${savedCity.name}${AppTextConstants.symbolComma} ${savedCity.country}',
//                     style: AppTextStyles.expandedMainFont,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   // информация по текущему городу
//                   subtitle: Text(
//                     '${weatherInSavedCities.elementAt(index)!.temperature}'
//                     '${AppTextConstants.symbolDegree}${AppTextConstants.symbolComma} '
//                     '${weatherInSavedCities.elementAt(index)!.description}',
//                     style: AppTextStyles.secondaryFont,
//                   ),
//                 ),
//               );
//             },
//           )
//       ],
//     );
//   }
// }
