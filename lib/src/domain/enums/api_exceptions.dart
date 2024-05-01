
import '../../../l10n/localization_without_context.dart';

enum ApiExeption {
  network, // User does not have Internet
  overlimit, // The maximum number of requests per day has been exceeded
  other,
}

extension ApiExeptionMessage on ApiExeption {
  String get errorMessage {
    switch (this) {
      case ApiExeption.network:
        return tr.ErrorUnexpectedApiError;
      case ApiExeption.overlimit:
        return tr.ErrorToMuchRequestAtDay;
      case ApiExeption.other:
        return tr.ErrorInternetNotAvailable;
    }
  }
}


