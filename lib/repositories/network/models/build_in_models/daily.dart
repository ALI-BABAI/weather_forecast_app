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
