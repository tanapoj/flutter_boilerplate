import 'package:boilerplate2/src/application/env.dart';

class LocalizationEvent {
  final SupportedLocale locale;

  LocalizationEvent(this.locale);

  @override
  String toString() {
    return 'LocalizationEvent{locale: $locale}';
  }
}
