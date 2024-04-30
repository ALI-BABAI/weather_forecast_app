// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hello`
  String get Hello {
    return Intl.message(
      'Hello',
      name: 'Hello',
      desc: '',
      args: [],
    );
  }

  /// `World`
  String get World {
    return Intl.message(
      'World',
      name: 'World',
      desc: '',
      args: [],
    );
  }

  /// `Weather forecast`
  String get weatherForecast {
    return Intl.message(
      'Weather forecast',
      name: 'weatherForecast',
      desc: '',
      args: [],
    );
  }

  /// `Weather`
  String get Weather {
    return Intl.message(
      'Weather',
      name: 'Weather',
      desc: '',
      args: [],
    );
  }

  /// `Forecast`
  String get Forecast {
    return Intl.message(
      'Forecast',
      name: 'Forecast',
      desc: '',
      args: [],
    );
  }

  /// `Error:`
  String get Error {
    return Intl.message(
      'Error:',
      name: 'Error',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load weather data`
  String get FailedToLoadWeatherData {
    return Intl.message(
      'Failed to load weather data',
      name: 'FailedToLoadWeatherData',
      desc: '',
      args: [],
    );
  }

  /// `The number of requests to the server has been exceeded: or something else...`
  String get ErrorExceedRequestToServer {
    return Intl.message(
      'The number of requests to the server has been exceeded: or something else...',
      name: 'ErrorExceedRequestToServer',
      desc: '',
      args: [],
    );
  }

  /// `Couldn't get a response from the server`
  String get ErrorServerDontRespond {
    return Intl.message(
      'Couldn\'t get a response from the server',
      name: 'ErrorServerDontRespond',
      desc: '',
      args: [],
    );
  }

  /// `Current weather icon`
  String get currentWeatherIcon {
    return Intl.message(
      'Current weather icon',
      name: 'currentWeatherIcon',
      desc: '',
      args: [],
    );
  }

  /// `Hour weather icon`
  String get hourWeatherIcon {
    return Intl.message(
      'Hour weather icon',
      name: 'hourWeatherIcon',
      desc: '',
      args: [],
    );
  }

  /// `Day weather icon`
  String get dayWeatherIcon {
    return Intl.message(
      'Day weather icon',
      name: 'dayWeatherIcon',
      desc: '',
      args: [],
    );
  }

  /// `day`
  String get day {
    return Intl.message(
      'day',
      name: 'day',
      desc: '',
      args: [],
    );
  }

  /// `night`
  String get night {
    return Intl.message(
      'night',
      name: 'night',
      desc: '',
      args: [],
    );
  }

  /// `OH, THE PROBLEM`
  String get haveProblem {
    return Intl.message(
      'OH, THE PROBLEM',
      name: 'haveProblem',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `add`
  String get add {
    return Intl.message(
      'add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Tools`
  String get tools {
    return Intl.message(
      'Tools',
      name: 'tools',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `The city has already been saved!`
  String get theCityHasAlreadyBeenSaved {
    return Intl.message(
      'The city has already been saved!',
      name: 'theCityHasAlreadyBeenSaved',
      desc: '',
      args: [],
    );
  }

  /// `Enter a city name`
  String get enterCityName {
    return Intl.message(
      'Enter a city name',
      name: 'enterCityName',
      desc: '',
      args: [],
    );
  }

  /// `Not found city. Please, check the input and try again!`
  String get notFoundCityPleaseCheckInputAndTryAgain {
    return Intl.message(
      'Not found city. Please, check the input and try again!',
      name: 'notFoundCityPleaseCheckInputAndTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `App unit's:`
  String get appUnits {
    return Intl.message(
      'App unit\'s:',
      name: 'appUnits',
      desc: '',
      args: [],
    );
  }

  /// `Temperature:`
  String get temperatureUnit {
    return Intl.message(
      'Temperature:',
      name: 'temperatureUnit',
      desc: '',
      args: [],
    );
  }

  /// `Pressure:`
  String get pressureUnit {
    return Intl.message(
      'Pressure:',
      name: 'pressureUnit',
      desc: '',
      args: [],
    );
  }

  /// `hPa`
  String get hpaUnit {
    return Intl.message(
      'hPa',
      name: 'hpaUnit',
      desc: '',
      args: [],
    );
  }

  /// `mmHg`
  String get mmhgUnit {
    return Intl.message(
      'mmHg',
      name: 'mmhgUnit',
      desc: '',
      args: [],
    );
  }

  /// `m/s`
  String get MetersBySecUnit {
    return Intl.message(
      'm/s',
      name: 'MetersBySecUnit',
      desc: '',
      args: [],
    );
  }

  /// `km`
  String get kmUnit {
    return Intl.message(
      'km',
      name: 'kmUnit',
      desc: '',
      args: [],
    );
  }

  /// `{visibility}km`
  String xKm(Object visibility) {
    return Intl.message(
      '${visibility}km',
      name: 'xKm',
      desc: '',
      args: [visibility],
    );
  }

  /// `{wind}m/s`
  String xMetersBySecond(Object wind) {
    return Intl.message(
      '${wind}m/s',
      name: 'xMetersBySecond',
      desc: '',
      args: [wind],
    );
  }

  /// `Humidity: `
  String get humidity {
    return Intl.message(
      'Humidity: ',
      name: 'humidity',
      desc: '',
      args: [],
    );
  }

  /// `Wind: `
  String get wind {
    return Intl.message(
      'Wind: ',
      name: 'wind',
      desc: '',
      args: [],
    );
  }

  /// `Pressure: `
  String get pressure {
    return Intl.message(
      'Pressure: ',
      name: 'pressure',
      desc: '',
      args: [],
    );
  }

  /// `Visibility: `
  String get visibility {
    return Intl.message(
      'Visibility: ',
      name: 'visibility',
      desc: '',
      args: [],
    );
  }

  /// `{maxTemperature}°/{minTemperature}°, feels like {temperature}{unitDegree}`
  String feelsLike(Object maxTemperature, Object minTemperature,
      Object temperature, Object unitDegree) {
    return Intl.message(
      '$maxTemperature°/$minTemperature°, feels like $temperature$unitDegree',
      name: 'feelsLike',
      desc: '',
      args: [maxTemperature, minTemperature, temperature, unitDegree],
    );
  }

  /// `Measurement units`
  String get measurementUnits {
    return Intl.message(
      'Measurement units',
      name: 'measurementUnits',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `en`
  String get en {
    return Intl.message(
      'en',
      name: 'en',
      desc: '',
      args: [],
    );
  }

  /// `ru`
  String get ru {
    return Intl.message(
      'ru',
      name: 'ru',
      desc: '',
      args: [],
    );
  }

  /// `save`
  String get save {
    return Intl.message(
      'save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `cancel`
  String get cancel {
    return Intl.message(
      'cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `°C`
  String get celsiusDegree {
    return Intl.message(
      '°C',
      name: 'celsiusDegree',
      desc: '',
      args: [],
    );
  }

  /// `°F`
  String get fahrenheitDegree {
    return Intl.message(
      '°F',
      name: 'fahrenheitDegree',
      desc: '',
      args: [],
    );
  }

  /// `°K`
  String get kelvinDegree {
    return Intl.message(
      '°K',
      name: 'kelvinDegree',
      desc: '',
      args: [],
    );
  }

  /// `Celsius`
  String get celsius {
    return Intl.message(
      'Celsius',
      name: 'celsius',
      desc: '',
      args: [],
    );
  }

  /// `Fahrenheit`
  String get fahrenheit {
    return Intl.message(
      'Fahrenheit',
      name: 'fahrenheit',
      desc: '',
      args: [],
    );
  }

  /// `Kelvin`
  String get kelvin {
    return Intl.message(
      'Kelvin',
      name: 'kelvin',
      desc: '',
      args: [],
    );
  }

  /// `remove`
  String get delete {
    return Intl.message(
      'remove',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Remove {city} from your favorites list?`
  String deleteConfirmNotification(Object city) {
    return Intl.message(
      'Remove $city from your favorites list?',
      name: 'deleteConfirmNotification',
      desc: '',
      args: [city],
    );
  }

  /// `Language setting`
  String get languageSetting {
    return Intl.message(
      'Language setting',
      name: 'languageSetting',
      desc: '',
      args: [],
    );
  }

  /// `metric`
  String get metricUnitSystem {
    return Intl.message(
      'metric',
      name: 'metricUnitSystem',
      desc: '',
      args: [],
    );
  }

  /// `imperial`
  String get imperialUnitSystem {
    return Intl.message(
      'imperial',
      name: 'imperialUnitSystem',
      desc: '',
      args: [],
    );
  }

  /// `standart`
  String get standartUnitSystem {
    return Intl.message(
      'standart',
      name: 'standartUnitSystem',
      desc: '',
      args: [],
    );
  }

  /// `create account`
  String get createAccount {
    return Intl.message(
      'create account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `login`
  String get login {
    return Intl.message(
      'login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Authentication error.\nPlease make sure that the username and password are entered correctly and try again!`
  String get authFailureMessage {
    return Intl.message(
      'Authentication error.\nPlease make sure that the username and password are entered correctly and try again!',
      name: 'authFailureMessage',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
