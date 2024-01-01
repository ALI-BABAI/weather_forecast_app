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
