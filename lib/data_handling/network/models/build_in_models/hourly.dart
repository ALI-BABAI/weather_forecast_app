class Hourly {
  final int date;
  final int temperature;
  final int iconID;

  /*
  @JsonKey(name: 'temp')
  final List<Weather> weather;
  */

  Hourly({
    required this.date,
    required this.temperature,
    required this.iconID,
  });

  factory Hourly.fromJSON(Map<String, dynamic> json) {
    return Hourly(
      date: json['dt'],
      temperature: json['temp'].round().toInt(),
      iconID: json['weather'][0]['id'],
    );
  }
}
