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

  static String m0(city) => "Remove ${city} from your favorites list?";

  static String m1(maxTemperature, minTemperature, temperature, unitDegree) =>
      "${maxTemperature}°/${minTemperature}°, feels like ${temperature}${unitDegree}";

  static String m2(visibility) => "${visibility}km";

  static String m3(wind) => "${wind}m/s";

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
        "authFailureMessage": MessageLookupByLibrary.simpleMessage(
            "Authentication error.\nPlease make sure that the username and password are entered correctly and try again!"),
        "cancel": MessageLookupByLibrary.simpleMessage("cancel"),
        "celsius": MessageLookupByLibrary.simpleMessage("Celsius"),
        "celsiusDegree": MessageLookupByLibrary.simpleMessage("°C"),
        "createAccount": MessageLookupByLibrary.simpleMessage("create account"),
        "currentWeatherIcon":
            MessageLookupByLibrary.simpleMessage("Current weather icon"),
        "day": MessageLookupByLibrary.simpleMessage("day"),
        "dayWeatherIcon":
            MessageLookupByLibrary.simpleMessage("Day weather icon"),
        "delete": MessageLookupByLibrary.simpleMessage("remove"),
        "deleteConfirmNotification": m0,
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "en": MessageLookupByLibrary.simpleMessage("en"),
        "enterCityName":
            MessageLookupByLibrary.simpleMessage("Enter a city name"),
        "fahrenheit": MessageLookupByLibrary.simpleMessage("Fahrenheit"),
        "fahrenheitDegree": MessageLookupByLibrary.simpleMessage("°F"),
        "feelsLike": m1,
        "haveProblem": MessageLookupByLibrary.simpleMessage("OH, THE PROBLEM"),
        "hourWeatherIcon":
            MessageLookupByLibrary.simpleMessage("Hour weather icon"),
        "hpaUnit": MessageLookupByLibrary.simpleMessage("hPa"),
        "humidity": MessageLookupByLibrary.simpleMessage("Humidity: "),
        "imperialUnitSystem": MessageLookupByLibrary.simpleMessage("imperial"),
        "kelvin": MessageLookupByLibrary.simpleMessage("Kelvin"),
        "kelvinDegree": MessageLookupByLibrary.simpleMessage("°K"),
        "kmUnit": MessageLookupByLibrary.simpleMessage("km"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "languageSetting":
            MessageLookupByLibrary.simpleMessage("Language setting"),
        "location": MessageLookupByLibrary.simpleMessage("Location"),
        "login": MessageLookupByLibrary.simpleMessage("login"),
        "logout": MessageLookupByLibrary.simpleMessage("Logout"),
        "measurementUnits":
            MessageLookupByLibrary.simpleMessage("Measurement units"),
        "metricUnitSystem": MessageLookupByLibrary.simpleMessage("metric"),
        "mmhgUnit": MessageLookupByLibrary.simpleMessage("mmHg"),
        "night": MessageLookupByLibrary.simpleMessage("night"),
        "notFoundCityPleaseCheckInputAndTryAgain":
            MessageLookupByLibrary.simpleMessage(
                "Not found city. Please, check the input and try again!"),
        "notifications": MessageLookupByLibrary.simpleMessage("Notifications"),
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "pressure": MessageLookupByLibrary.simpleMessage("Pressure: "),
        "pressureUnit": MessageLookupByLibrary.simpleMessage("Pressure:"),
        "ru": MessageLookupByLibrary.simpleMessage("ru"),
        "save": MessageLookupByLibrary.simpleMessage("save"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "standartUnitSystem": MessageLookupByLibrary.simpleMessage("standart"),
        "temperatureUnit": MessageLookupByLibrary.simpleMessage("Temperature:"),
        "theCityHasAlreadyBeenSaved": MessageLookupByLibrary.simpleMessage(
            "The city has already been saved!"),
        "tools": MessageLookupByLibrary.simpleMessage("Tools"),
        "visibility": MessageLookupByLibrary.simpleMessage("Visibility: "),
        "weatherForecast":
            MessageLookupByLibrary.simpleMessage("Weather forecast"),
        "wind": MessageLookupByLibrary.simpleMessage("Wind: "),
        "xKm": m2,
        "xMetersBySecond": m3
      };
}
