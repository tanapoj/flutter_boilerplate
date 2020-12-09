import 'package:boilerplate2/src/application/app.dart';
import 'package:boilerplate2/src/application/env.dart';
import 'package:boilerplate2/src/application/localization.dart';
import 'package:boilerplate2/src/commons/extensions/index.dart';
import 'package:boilerplate2/src/commons/log.dart';
import 'package:boilerplate2/src/di/container.dart';
import 'package:boilerplate2/src/events/bus.dart';
import 'package:boilerplate2/src/events/localization_event.dart';
import 'package:boilerplate2/src/ui/_theme/theme.dart';
import 'package:flutter_live_data/flutter_live_data.dart';
import 'package:mvvm_bloc/vm.dart';
import 'package:provider/provider.dart';

class LanguageVM extends ViewModel {
  final LiveData<String> title;

  // final AppLocalization localization = inject<AppLocalization>();
  // final Bus bus = inject<Bus>();
  // final AppTheme appTheme = inject<AppTheme>();

  LanguageVM(LifeCycleObserver observer) : this.title = LiveData('Test').bind(observer).asBroadcast();

  void setTitle(String message) {
    title.value = message;
  }

  void setLocale(SupportedLocale lang) {
    context.read<AppState>()
      ..setLocale(context, locale: lang)
      ..notify();
  }

  void setTheme(UITheme theme) {
    context.read<AppState>()
      ..setTheme(theme)
      ..notify();
  }
}
