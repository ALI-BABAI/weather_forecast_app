
import '../../l10n/localization_without_context.dart';

enum AppLanguages { en, ru }

extension LanguagesType on AppLanguages {
  String get name {
    switch (this) {
      case AppLanguages.en:
        return tr.en;
      case AppLanguages.ru:
        return tr.ru;
    }
  }
}
