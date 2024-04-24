// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  static String m0(maxTemperature, minTemperature, temperature) =>
      "${maxTemperature}°/${minTemperature}°, ощущается как ${temperature}°C";

  static String m1(visibility) => "${visibility}км";

  static String m2(wind) => "${wind}м/с";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "Error": MessageLookupByLibrary.simpleMessage("Ошибка:"),
        "ErrorExceedRequestToServer": MessageLookupByLibrary.simpleMessage(
            "Было превышено количество запросов к серверу: или что-то еще..."),
        "ErrorServerDontRespond":
            MessageLookupByLibrary.simpleMessage("Сервер не отвечает"),
        "FailedToLoadWeatherData": MessageLookupByLibrary.simpleMessage(
            "Не удалось загрузить данные о погоде"),
        "Forecast": MessageLookupByLibrary.simpleMessage("Forecast"),
        "Hello": MessageLookupByLibrary.simpleMessage("Привет"),
        "MetersBySecUnit": MessageLookupByLibrary.simpleMessage("м/с"),
        "Weather": MessageLookupByLibrary.simpleMessage("Weather"),
        "World": MessageLookupByLibrary.simpleMessage("Мир"),
        "add": MessageLookupByLibrary.simpleMessage("+"),
        "appUnits": MessageLookupByLibrary.simpleMessage("Единицы измерения:"),
        "currentWeatherIcon":
            MessageLookupByLibrary.simpleMessage("Текущая иконка погоды"),
        "day": MessageLookupByLibrary.simpleMessage("день"),
        "dayWeatherIcon":
            MessageLookupByLibrary.simpleMessage("Day weather icon"),
        "enterCityName":
            MessageLookupByLibrary.simpleMessage("Введите название города"),
        "feelsLike": m0,
        "haveProblem":
            MessageLookupByLibrary.simpleMessage("Оупс, проблема..."),
        "hourWeatherIcon":
            MessageLookupByLibrary.simpleMessage("Hour weather icon"),
        "hpaUnit": MessageLookupByLibrary.simpleMessage("гПа"),
        "humidity": MessageLookupByLibrary.simpleMessage("Влажность: "),
        "kmUnit": MessageLookupByLibrary.simpleMessage("км"),
        "location": MessageLookupByLibrary.simpleMessage("Локация"),
        "measurementUnits":
            MessageLookupByLibrary.simpleMessage("Measurement units"),
        "mmhgUnit": MessageLookupByLibrary.simpleMessage("мм.рт.ст."),
        "night": MessageLookupByLibrary.simpleMessage("ночь"),
        "notFoundCityPleaseCheckInputAndTryAgain":
            MessageLookupByLibrary.simpleMessage(
                "Не удалось найти город. Пожалуйста, проверьте ввод и повторите попытку!"),
        "ok": MessageLookupByLibrary.simpleMessage("Ок"),
        "pressure": MessageLookupByLibrary.simpleMessage("Давление: "),
        "pressureUnit": MessageLookupByLibrary.simpleMessage("Давление:"),
        "settings": MessageLookupByLibrary.simpleMessage("Настройки"),
        "temperatureUnit": MessageLookupByLibrary.simpleMessage("Температура:"),
        "theCityHasAlreadyBeenSaved": MessageLookupByLibrary.simpleMessage(
            "Город уже добавлен в избранные!"),
        "tools": MessageLookupByLibrary.simpleMessage("Персонализация"),
        "visibility": MessageLookupByLibrary.simpleMessage("Видимость: "),
        "weatherForecast":
            MessageLookupByLibrary.simpleMessage("Weather forecast"),
        "wind": MessageLookupByLibrary.simpleMessage("Сила ветра: "),
        "xKm": m1,
        "xMetersBySecond": m2
      };
}
