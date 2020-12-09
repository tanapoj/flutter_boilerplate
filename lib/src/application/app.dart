import 'package:boilerplate2/src/application/localization.dart';
import 'package:boilerplate2/src/commons/extensions/index.dart';
import 'package:boilerplate2/src/commons/log.dart';
import 'package:boilerplate2/src/data/preferences/app_state_preference.dart';
import 'package:boilerplate2/src/di/container.dart';
import 'package:boilerplate2/src/ui/_theme/theme.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'env.dart';

class App extends StatefulWidget {
  final Widget Function(BuildContext context, EnvironmentConfig env, DiContainer di) builder;
  final EnvironmentConfig env;

  App({
    Key key,
    @required this.builder,
    @required this.env,
    @required DiContainer container,
  }) : super(key: key) {
    Di(container);
    Di().container.singleton<EnvironmentConfig>(env);
  }

  @override
  _App createState() => _App();
}

class _App extends State<App> {
  final AppStatePreference preference = inject<AppStatePreference>();

  @override
  void initState() {
    super.initState();
    initPreference();
  }

  void initPreference() async {
    switch (await preference.getMainTheme()) {
      case ThemeType.Light:
        AppState().theme = UIThemeLight();
        break;
      case ThemeType.Dark:
        AppState().theme = UIThemeDark();
        break;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Di().container.singleton<BuildContext>(context);

    // build
    Widget app = ChangeNotifierProvider(
      create: (_) => AppState(),
      builder: (context, child) {

        var appState = context.read<AppState>();
        AppLog.i('application.app -> build appState = $appState');

        return AppLocalization(
          context: context,
          child: widget.builder(
            context,
            widget.env,
            Di().container,
          ),
          supportedLocales: widget.env.supportedLocales,
        ).also((it) {
          AppState().localization = it;
        });
      },
    );

    return app;
  }
}

class AppState extends ChangeNotifier {
  static AppState _singleton;

  factory AppState() => _singleton ??= AppState._internal();

  AppState._internal();

  // Localization
  AppLocalization localization;

  void setLocale(BuildContext context, {@required SupportedLocale locale}) => localization.setLocale(context, locale: locale);

  // Theme
  UITheme theme;

  void setTheme(UITheme theme) => this.theme = theme;

  void notify() {
    notifyListeners();
  }

  @override
  String toString() {
    return 'AppState{localization: $localization, theme: $theme}';
  }
}
