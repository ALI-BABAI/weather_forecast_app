// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:weather_forecast_app/domain/models/weather_model.dart';
// import 'package:weather_forecast_app/data/services/api_service.dart';
// import 'package:weather_forecast_app/main.dart';
// import 'package:weather_forecast_app/screens/home_screen/widgets/city_widget.dart';
// import 'package:weather_forecast_app/screens/home_screen/widgets/loading_widget.dart';
// import 'package:weather_forecast_app/theme/src/text_constants.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({
//     super.key,
//   });
//   @override
//   Widget build(BuildContext context) {
//     final state = context.read<PreferencesManager>();
//     state.initData();
//     return const FutureGetWeatherInfo();
//   }
// }

// class FutureGetWeatherInfo extends StatelessWidget {
//   const FutureGetWeatherInfo({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final savedCities = context.select(
//         (PreferencesManager preferencesManager) =>
//             preferencesManager.savedListOfCities);
//     return Scaffold(
//       body: FutureBuilder<List<WeatherModel?>?>(
//         future:
//             ApiClient().getWeatherInfoForSavedCities(savedCities: savedCities),
//         builder: (context, snapshot) {
//           switch (snapshot.connectionState) {
//             case ConnectionState.waiting:
//               {
//                 return LoadingWidget(
//                   infoWidget: () => const CircularProgressIndicator(),
//                 );
//               }
//             case ConnectionState.done:
//               {
//                 if (snapshot.error is ApiClientExeption) {
//                   final apiException = snapshot.error as ApiClientExeption;
//                   switch (apiException.type) {
//                     case ApiExeptionType.network:
//                       return LoadingWidget(
//                           infoWidget: () =>
//                               const Text(AppTextConstants.apiNetworkErr));
//                     case ApiExeptionType.overlimit:
//                       return LoadingWidget(
//                           infoWidget: () =>
//                               const Text(AppTextConstants.apiOverlimitErr));
//                     case ApiExeptionType.other:
//                       return LoadingWidget(
//                           infoWidget: () => Text(
//                               '${AppTextConstants.apiOtherErr} ${snapshot.error}'));
//                   }
//                 } else if (snapshot.data!.any((element) => element == null)) {
//                   return LoadingWidget(
//                     infoWidget: () => const Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 40),
//                       child:
//                           Text(AppTextConstants.errorCannotGetResponseFromAPI),
//                     ),
//                   );
//                 }
//                 // экран с данными по сохранённым городам
//                 else if ((snapshot.hasData) && (snapshot.data != null)) {
//                   // копируем считанные ответы с сервера в глобальную переменную
//                   weatherInSavedCities = snapshot.data!;
//                   // создаём контроллер для возможности переключения между городами
//                   final PageController pageScreensController = PageController();
//                   return PageView.builder(
//                     controller: pageScreensController,
//                     itemCount: weatherInSavedCities.length,
//                     itemBuilder: (context, index) {
//                       // Загрузка на экран выбранного по индексу города
//                       return CityWidget(
//                         currentCity: savedCities.citiesList.elementAt(index),
//                         weatherData: weatherInSavedCities.elementAt(index)!,
//                       );
//                     },
//                   );
//                 } else {
//                   return LoadingWidget(
//                       infoWidget: () =>
//                           Text('${AppTextConstants.error} ${snapshot.error}'));
//                 }
//               }
//             default:
//               {
//                 return LoadingWidget(
//                     infoWidget: () => const CircularProgressIndicator());
//               }
//           }
//         },
//       ),
//     );
//   }
// }
