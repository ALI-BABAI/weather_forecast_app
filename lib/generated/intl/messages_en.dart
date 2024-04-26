// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(maxTemperature, minTemperature, temperature) =>
      "${maxTemperature}°/${minTemperature}°, feels like ${temperature}°C";

  static String m1(visibility) => "${visibility}km";

  static String m2(wind) => "${wind}m/s";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "Error": MessageLookupByLibrary.simpleMessage("Error:"),
        "ErrorExceedRequestToServer": MessageLookupByLibrary.simpleMessage(
            "The number of requests to the server has been exceeded: or something else..."),
        "ErrorServerDontRespond": MessageLookupByLibrary.simpleMessage(
            "Couldn\'t get a response from the server"),
        "FailedToLoadWeatherData":
            MessageLookupByLibrary.simpleMessage("Failed to load weather data"),
        "Forecast": MessageLookupByLibrary.simpleMessage("Forecast"),
        "Hello": MessageLookupByLibrary.simpleMessage("Hello"),
        "MetersBySecUnit": MessageLookupByLibrary.simpleMessage("m/s"),
        "Weather": MessageLookupByLibrary.simpleMessage("Weather"),
        "World": MessageLookupByLibrary.simpleMessage("World"),
        "add": MessageLookupByLibrary.simpleMessage("add"),
        "appUnits": MessageLookupByLibrary.simpleMessage("App unit\'s:"),
        "currentWeatherIcon":
            MessageLookupByLibrary.simpleMessage("Current weather icon"),
        "day": MessageLookupByLibrary.simpleMessage("day"),
        "dayWeatherIcon":
            MessageLookupByLibrary.simpleMessage("Day weather icon"),
        "defaultLanguage": MessageLookupByLibrary.simpleMessage("en"),
        "en": MessageLookupByLibrary.simpleMessage("en"),
        "enterCityName":
            MessageLookupByLibrary.simpleMessage("Enter a city name"),
        "feelsLike": m0,
        "haveProblem": MessageLookupByLibrary.simpleMessage("OH, THE PROBLEM"),
        "hourWeatherIcon":
            MessageLookupByLibrary.simpleMessage("Hour weather icon"),
        "hpaUnit": MessageLookupByLibrary.simpleMessage("hPa"),
        "humidity": MessageLookupByLibrary.simpleMessage("Humidity: "),
        "kmUnit": MessageLookupByLibrary.simpleMessage("km"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "location": MessageLookupByLibrary.simpleMessage("Location"),
        "measurementUnits":
            MessageLookupByLibrary.simpleMessage("Measurement units"),
        "mmhgUnit": MessageLookupByLibrary.simpleMessage("mmHg"),
        "night": MessageLookupByLibrary.simpleMessage("night"),
        "notFoundCityPleaseCheckInputAndTryAgain":
            MessageLookupByLibrary.simpleMessage(
                "Not found city. Please, check the input and try again!"),
        "notifications": MessageLookupByLibrary.simpleMessage("Notifications"),
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "pressure": MessageLookupByLibrary.simpleMessage("Pressure: "),
        "pressureUnit": MessageLookupByLibrary.simpleMessage("Pressure:"),
        "ru": MessageLookupByLibrary.simpleMessage("ru"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "temperatureUnit": MessageLookupByLibrary.simpleMessage("Temperature:"),
        "theCityHasAlreadyBeenSaved": MessageLookupByLibrary.simpleMessage(
            "The city has already been saved!"),
        "tools": MessageLookupByLibrary.simpleMessage("Tools"),
        "visibility": MessageLookupByLibrary.simpleMessage("Visibility: "),
        "weatherForecast":
            MessageLookupByLibrary.simpleMessage("Weather forecast"),
        "wind": MessageLookupByLibrary.simpleMessage("Wind: "),
        "xKm": m1,
        "xMetersBySecond": m2
      };
}
