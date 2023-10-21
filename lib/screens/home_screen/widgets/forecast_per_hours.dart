import 'package:flutter/material.dart';
import 'package:weather_forecast_app/images.dart';
import 'package:weather_forecast_app/theme/colors.dart';
import 'package:weather_forecast_app/theme/text.dart';

//https://ru.stackoverflow.com/questions/1183838/%D0%9A%D0%B0%D0%BA-%D0%B2%D0%BE-flutter-dart-%D1%81%D0%B4%D0%B5%D0%BB%D0%B0%D1%82%D1%8C-%D0%B2%D0%BB%D0%BE%D0%B6%D0%B5%D0%BD%D0%BD%D1%8B%D0%B9-%D0%B3%D0%BE%D1%80%D0%B8%D0%B7%D0%BE%D0%BD%D1%82%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9-%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA

// Проблема возникает из-за того, что внутри виджета PerHourForecastWidget
// используется ListView, который находится внутри родительского ListView в HomeScreen.
// Вложенные ListView могут вызывать конфликты при прокрутке, так как вложенный ListView
// будет пытаться прокручиваться внутри родительского ListView, что может вызвать
// проблемы с маршрутами прокрутки.

/* class PerHourForecastWidget extends StatelessWidget {
  const PerHourForecastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ListView(
          scrollDirection: Axis.horizontal,
          children: [
            for (int i = 0; i < 24; i++)
              const HourlyWidget(
                hour: '6:00',
                image: 'assets/images/final/1x/sun.png',
                weather: '26°',
              ),
          ],
        ),
      ],
    );
  }
} */
/* class PerHourForecastWidget extends StatelessWidget {
  const PerHourForecastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for (int i = 0; i < 24; i++)
              const HourlyWidget(
                hour: '6:00',
                image: 'assets/images/final/1x/sun.png',
                weather: '26°',
              )
          ],
        ),
      ],
    );
  }
} */

class PerHourForecastWidget extends StatelessWidget {
  final int currentHour;
  const PerHourForecastWidget({super.key, required this.currentHour});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115, // Высота элементов
      child: ListView.builder(
        shrinkWrap: true,
        // if (ListViewWidth>AllElementsWidth)
        //  padding: EdgeInsets.symmetric(horizontal: (ListViewWidth-AllElementsWidth)/2),
        scrollDirection: Axis.horizontal,
        itemCount: 24, // Количество элементов
        itemBuilder: (BuildContext context, int index) {
          // Выводим для каждого следующего часа информацию по погоде
          final hour = (currentHour + index) % 24;
          return Container(
            // #ГОВНОКОД (при большом экране отступы должны быть адаптивными)
            margin: const EdgeInsets.symmetric(
                horizontal: 10), // отступ между элементами
            child: HourlyWidget(
              hour: hour.toString(),
              image: AppIconsMini.sunWithRain,
              weather: '26°',
            ),
          );
        },
      ),
    );
  }
}

class HourlyWidget extends StatelessWidget {
  final String hour;
  final String weather;
  final AssetImage image;

  const HourlyWidget({
    super.key,
    required this.hour,
    required this.weather,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final formattedHour =
        '$hour:00'; // сцепляем текущий час с ":00" для вывода времени
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: const BoxDecoration(
          color: backgraundColor,
          borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(25), top: Radius.circular(25))),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 5),
            Text(
              formattedHour,
              style: AppTextStyles.smallestSecondaryFont,
            ),
            const SizedBox(height: 5),
            Image(
              image: image,
            ),
            const SizedBox(height: 5),
            Text(
              weather,
              style: AppTextStyles.mainFont,
            ),
          ]),
    );
  }
}

// HourlyWidget(
//   hour: '6:00',
//   image: 'assets/images/final/1x/sun.png',
//   weather: '26°',
// ),
// HourlyWidget(
//   hour: '7:00',
//   image: 'assets/images/final/1x/rain.png',
//   weather: '26°',
// ),
// HourlyWidget(
//   hour: '8:00',
//   image: 'assets/images/final/1x/sun + small cloud.png',
//   weather: '23°',
// ),
// HourlyWidget(
//   hour: '10:00',
//   image: 'assets/images/final/1x/sun + rain1.png',
//   weather: '20°',
// ),
// HourlyWidget(
//   hour: '9:00',
//   image: 'assets/images/final/1x/thunder.png',
//   weather: '22°',
// ),
// HourlyWidget(
//   hour: '11:00',
//   image: 'assets/images/final/1x/sun + cloud1.png',
//   weather: '20°',
// ),
