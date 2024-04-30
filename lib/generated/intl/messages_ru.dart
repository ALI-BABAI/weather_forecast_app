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

  static String m0(city) => "Удалить ${city} из списка избранных?";

  static String m1(maxTemperature, minTemperature, temperature, unitDegree) =>
      "${maxTemperature}°/${minTemperature}°, ощущается как ${temperature}${unitDegree}";

  static String m2(visibility) => "${visibility}км";

  static String m3(wind) => "${wind}м/с";

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
        "authFailureMessage": MessageLookupByLibrary.simpleMessage(
            "Ошибка авторизации.\nПожалуйста, убедитесь, что логин и пароль введены правильно и повторите попытку!"),
        "cancel": MessageLookupByLibrary.simpleMessage("Отмена"),
        "celsius": MessageLookupByLibrary.simpleMessage("Цельсий"),
        "celsiusDegree": MessageLookupByLibrary.simpleMessage("°C"),
        "createAccount":
            MessageLookupByLibrary.simpleMessage("Создать аккаунт"),
        "currentWeatherIcon":
            MessageLookupByLibrary.simpleMessage("Текущая иконка погоды"),
        "day": MessageLookupByLibrary.simpleMessage("день"),
        "dayWeatherIcon":
            MessageLookupByLibrary.simpleMessage("Day weather icon"),
        "delete": MessageLookupByLibrary.simpleMessage("Удалить"),
        "deleteConfirmNotification": m0,
        "email": MessageLookupByLibrary.simpleMessage("Электронная почта"),
        "en": MessageLookupByLibrary.simpleMessage("Английский"),
        "enterCityName":
            MessageLookupByLibrary.simpleMessage("Введите название города"),
        "fahrenheit": MessageLookupByLibrary.simpleMessage("Фаренгейт"),
        "fahrenheitDegree": MessageLookupByLibrary.simpleMessage("°F"),
        "feelsLike": m1,
        "haveProblem":
            MessageLookupByLibrary.simpleMessage("Оупс, проблема..."),
        "hourWeatherIcon":
            MessageLookupByLibrary.simpleMessage("Hour weather icon"),
        "hpaUnit": MessageLookupByLibrary.simpleMessage("гПа"),
        "humidity": MessageLookupByLibrary.simpleMessage("Влажность: "),
        "imperialUnitSystem": MessageLookupByLibrary.simpleMessage("imperial"),
        "kelvin": MessageLookupByLibrary.simpleMessage("Кельвин"),
        "kelvinDegree": MessageLookupByLibrary.simpleMessage("°K"),
        "kmUnit": MessageLookupByLibrary.simpleMessage("км"),
        "language": MessageLookupByLibrary.simpleMessage("Язык"),
        "languageSetting": MessageLookupByLibrary.simpleMessage("Выбор языка"),
        "location": MessageLookupByLibrary.simpleMessage("Локация"),
        "login": MessageLookupByLibrary.simpleMessage("Войти"),
        "logout": MessageLookupByLibrary.simpleMessage("Выйти"),
        "measurementUnits":
            MessageLookupByLibrary.simpleMessage("Единицы измерения"),
        "metricUnitSystem": MessageLookupByLibrary.simpleMessage("metric"),
        "mmhgUnit": MessageLookupByLibrary.simpleMessage("мм.рт.ст."),
        "night": MessageLookupByLibrary.simpleMessage("ночь"),
        "notFoundCityPleaseCheckInputAndTryAgain":
            MessageLookupByLibrary.simpleMessage(
                "Не удалось найти город. Пожалуйста, проверьте ввод и повторите попытку!"),
        "notifications": MessageLookupByLibrary.simpleMessage("Уведомления"),
        "ok": MessageLookupByLibrary.simpleMessage("Ок"),
        "password": MessageLookupByLibrary.simpleMessage("Пароль"),
        "pressure": MessageLookupByLibrary.simpleMessage("Давление: "),
        "pressureUnit": MessageLookupByLibrary.simpleMessage("Давление:"),
        "ru": MessageLookupByLibrary.simpleMessage("Русский"),
        "save": MessageLookupByLibrary.simpleMessage("Сохранить"),
        "settings": MessageLookupByLibrary.simpleMessage("Настройки"),
        "standartUnitSystem": MessageLookupByLibrary.simpleMessage("standart"),
        "temperatureUnit": MessageLookupByLibrary.simpleMessage("Температура:"),
        "theCityHasAlreadyBeenSaved": MessageLookupByLibrary.simpleMessage(
            "Город уже добавлен в избранные!"),
        "tools": MessageLookupByLibrary.simpleMessage("Персонализация"),
        "visibility": MessageLookupByLibrary.simpleMessage("Видимость: "),
        "weatherForecast":
            MessageLookupByLibrary.simpleMessage("Weather forecast"),
        "wind": MessageLookupByLibrary.simpleMessage("Сила ветра: "),
        "xKm": m2,
        "xMetersBySecond": m3
      };
}
