class WeatherModel {
  final int timezoneOffset;
  final DateTime date;
  final int temperature;
  final int temperatureFillsLike;
  final int pressure;
  final int humidity;
  final double visibility;
  final double wind;
  final String description;
  final int iconID;
  final List<Hourly> hourly;
  final List<Daily> daily;

  WeatherModel({
    required this.date,
    required this.timezoneOffset,
    required this.temperature,
    required this.temperatureFillsLike,
    required this.pressure,
    required this.humidity,
    required this.visibility,
    required this.wind,
    required this.description,
    required this.iconID,
    required this.hourly,
    required this.daily,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    DateTime currentDay = DateTime.fromMillisecondsSinceEpoch(
      (json['current']['dt'].toInt() + json['timezone_offset']) * 1000,
      isUtc: true,
    );
    return WeatherModel(
      timezoneOffset: json['timezone_offset'],
      date: currentDay,
      temperature: json['current']['temp'].round().toInt(),
      temperatureFillsLike: json['current']['feels_like'].round().toInt(),
      pressure: json['current']['pressure'],
      humidity: json['current']['humidity'],
      visibility: json['current']['visibility'] / 1000,
      wind: json['current']['wind_speed'].toDouble(),
      description: json['current']['weather'][0]['description'],
      iconID: json['current']['weather'][0]['id'],
      hourly: (json['hourly'] as List<dynamic>)
          .map((e) => Hourly.fromJSON(
              e as Map<String, dynamic>, json['timezone_offset']))
          .toList(),
      daily: (json['daily'] as List<dynamic>)
          .map((e) => Daily.fromJSON(
              e as Map<String, dynamic>, json['timezone_offset']))
          .toList(),
    );
  }
}

class Hourly {
  final DateTime date;
  final int temperature;
  final int iconID;

  Hourly({
    required this.date,
    required this.temperature,
    required this.iconID,
  });

  factory Hourly.fromJSON(Map<String, dynamic> json, int timezoneOfset) {
    int date = json['dt'] + timezoneOfset;
    DateTime currentHour =
        DateTime.fromMillisecondsSinceEpoch(date * 1000, isUtc: true);
    return Hourly(
      date: currentHour,
      temperature: json['temp'].round().toInt(),
      iconID: json['weather'][0]['id'],
    );
  }
}

class Daily {
  final DateTime date;
  final int pressure;
  final int humidity;

  final int dayTemperature;
  final int minTemperature;
  final int maxTemperature;
  final int nightTemperature;
  final int eveTemperature;
  final int mornTemperature;

  final int dayFillsLikeTemperature;
  final int nightFillsLikeTemperature;
  final int eveFillsLikeTemperature;
  final int mornFillsLikeTemperature;

  final int iconID;

  Daily({
    required this.date,
    required this.pressure,
    required this.humidity,
    required this.dayTemperature,
    required this.minTemperature,
    required this.maxTemperature,
    required this.nightTemperature,
    required this.eveTemperature,
    required this.mornTemperature,
    required this.dayFillsLikeTemperature,
    required this.nightFillsLikeTemperature,
    required this.eveFillsLikeTemperature,
    required this.mornFillsLikeTemperature,
    required this.iconID,
  });

  factory Daily.fromJSON(Map<String, dynamic> json, int timezoneOffset) {
    int date = json['dt'] + timezoneOffset;
    final day = DateTime.fromMillisecondsSinceEpoch(date * 1000, isUtc: true);
    return Daily(
      date: day,
      pressure: json['pressure'],
      humidity: json['humidity'],
      dayTemperature: json['temp']['day'].round().toInt(),
      minTemperature: json['temp']['min'].round().toInt(),
      maxTemperature: json['temp']['max'].round().toInt(),
      nightTemperature: json['temp']['night'].round().toInt(),
      eveTemperature: json['temp']['eve'].round().toInt(),
      mornTemperature: json['temp']['morn'].round().toInt(),
      dayFillsLikeTemperature: json['feels_like']['day'].round().toInt(),
      nightFillsLikeTemperature: json['feels_like']['night'].round().toInt(),
      eveFillsLikeTemperature: json['feels_like']['eve'].round().toInt(),
      mornFillsLikeTemperature: json['feels_like']['morn'].round().toInt(),
      iconID: json['weather'][0]['id'],
    );
  }
}
