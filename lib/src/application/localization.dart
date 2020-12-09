import 'dart:convert';

import 'package:boilerplate2/src/commons/IHolder.dart';
import 'package:boilerplate2/src/commons/extensions/index.dart';
import 'package:boilerplate2/src/commons/log.dart';
import 'package:boilerplate2/src/di/container.dart';
import 'package:boilerplate2/src/events/bus.dart';
import 'package:boilerplate2/src/events/localization_event.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../commons/extensions/map_utils.dart';
import 'env.dart';

class AppLocalization extends InheritedWidget {
  static AppLocalization ins;
  final Bus bus = inject<Bus>();
  final IHolder<BuildContext> _context = IHolder<BuildContext>();
  final Map<SupportedLocale, Locale> supportedLocales;

  AppLocalization({
    BuildContext context,
    Key key,
    @required Widget child,
    @required this.supportedLocales,
  }) : super(
          key: key,
          child: EasyLocalization(
            supportedLocales: supportedLocales.values.toList(),
            path: 'assets/lang',
            fallbackLocale: supportedLocales[SupportedLocale.EN],
            child: child,
            assetLoader: _MyAssetLoader(),
          ),
        ) {
    _context.instance = context;
    ins = this;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static AppLocalization of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppLocalization>();
  }

  void setLocale(
    BuildContext context, {
    SupportedLocale locale,
  }) {
    context ??= _context.instance;
    EasyLocalization.of(context).locale = supportedLocales[locale];
  }

  String translate(String key) {
    return tr(key);
  }
}

class _MyAssetLoader extends AssetLoader {
  const _MyAssetLoader();

  String getLocalePath(String basePath, Locale locale) {
    return '$basePath/${localeToString(locale, separator: "-")}.json';
  }

  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async {
    var localePath = getLocalePath(path, locale);
    Map<String, dynamic> jsonMap = json.decode(await rootBundle.loadString(localePath));
    return jsonMap
        .flatten(delimiter: '.')
        .map(
          (key, value) => MapEntry<String, String>(key, value.toString()),
        )
        .also(
          (it) => debugPrint('$it'),
        );
  }
}
