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

  static String m0(error) => "Can\'t add city in favorite\nError: ${error}";

  static String m1(error) =>
      "Can\'t change city pozition in favorite list\nError: ${error}";

  static String m2(error) =>
      "Can\'t  delete city from favorite\nError: ${error}";

  static String m3(error) => "Can\'t get saved cities list\nError: ${error}";

  static String m4(error) => "Can\'t get saved language\nError: ${error}";

  static String m5(error) =>
      "Can\'t get saved temperature unit\nError: ${error}";

  static String m6(error) => "Can\'t get weather info\nError: ${error}";

  static String m7(error) => "Can\'t update weather data\n.Error: ${error}";

  static String m8(error) => "Can\'t set language\nError: ${error}";

  static String m9(error) => "Can\'t set temperature unit\nError: ${error}";

  static String m10(city) => "Remove ${city} from your favorites list?";

  static String m11(maxTemperature, minTemperature, temperature, unitDegree) =>
      "${maxTemperature}°/${minTemperature}°, feels like ${temperature}${unitDegree}";

  static String m12(visibility) => "${visibility}km";

  static String m13(wind) => "${wind}m/s";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "Error": MessageLookupByLibrary.simpleMessage("Error:"),
        "ErrorAddingCityInFavourite": m0,
        "ErrorCantChangePozitionOnFavourite": m1,
        "ErrorCantDeleteCityFromFavourite": m2,
        "ErrorCantGetSavedCities": m3,
        "ErrorCantGetSavedLanguage": m4,
        "ErrorCantGetTemperatureMeasurementUnit": m5,
        "ErrorCantGetWeatherInfo": m6,
        "ErrorCantUpdateWeatherData": m7,
        "ErrorCityAlreadyExistInFavourites":
            MessageLookupByLibrary.simpleMessage(
                "City already exist in favorite"),
        "ErrorCityNotFound":
            MessageLookupByLibrary.simpleMessage("Can\'t find city"),
        "ErrorExceedRequestToServer": MessageLookupByLibrary.simpleMessage(
            "The number of requests to the server has been exceeded: or something else..."),
        "ErrorInternetNotAvailable": MessageLookupByLibrary.simpleMessage(
            "Can\'t load weathe information. Please, check internet available"),
        "ErrorOnSettingLanguage": m8,
        "ErrorOnSettingTemperatureUnit": m9,
        "ErrorServerDontRespond": MessageLookupByLibrary.simpleMessage(
            "Couldn\'t get a response from the server"),
        "ErrorToMuchRequestAtDay": MessageLookupByLibrary.simpleMessage(
            "The maximum number of requests per day has been exceeded"),
        "ErrorUnexpectedApiError": MessageLookupByLibrary.simpleMessage(
            "Something went wrong...\nPlease, try later"),
        "FailedToLoadWeatherData":
            MessageLookupByLibrary.simpleMessage("Failed to load weather data"),
        "Forecast": MessageLookupByLibrary.simpleMessage("Forecast"),
        "Hello": MessageLookupByLibrary.simpleMessage("Hello"),
        "LoginErrorAccountAlreadyExists": MessageLookupByLibrary.simpleMessage(
            "An account with that name already exists!"),
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
        "deleteConfirmNotification": m10,
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "emptyAccountFields":
            MessageLookupByLibrary.simpleMessage("Fill in all the fields!"),
        "en": MessageLookupByLibrary.simpleMessage("en"),
        "enterCityName":
            MessageLookupByLibrary.simpleMessage("Enter a city name"),
        "fahrenheit": MessageLookupByLibrary.simpleMessage("Fahrenheit"),
        "fahrenheitDegree": MessageLookupByLibrary.simpleMessage("°F"),
        "feelsLike": m11,
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
        "uploadingTheData":
            MessageLookupByLibrary.simpleMessage("Uploading the data..."),
        "visibility": MessageLookupByLibrary.simpleMessage("Visibility: "),
        "weatherForecast":
            MessageLookupByLibrary.simpleMessage("Weather forecast"),
        "wind": MessageLookupByLibrary.simpleMessage("Wind: "),
        "xKm": m12,
        "xMetersBySecond": m13
      };
}
