import '../../l10n/localization_without_context.dart';

enum PressureUnit { hpa, kpa, mmhg }

enum TemperatureUnit {
  celsius,
  fahrenheit,
  kelvin,
}

extension TemperatureUnitType on TemperatureUnit {
  String get name {
    switch (this) {
      case TemperatureUnit.celsius:
        return tr.celsius;
      case TemperatureUnit.fahrenheit:
        return tr.fahrenheit;
      case TemperatureUnit.kelvin:
        return tr.kelvin;
    }
  }
}
