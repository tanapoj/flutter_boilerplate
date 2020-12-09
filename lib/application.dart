import 'package:boilerplate2/src/application/app.dart';
import 'package:boilerplate2/src/application/env.dart';
import 'package:boilerplate2/src/application/localization.dart';
import 'package:boilerplate2/src/commons/log.dart';
import 'package:boilerplate2/src/di/container.dart';
import 'package:boilerplate2/src/ui/_theme/theme.dart';

import 'src/application/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainApplication extends StatelessWidget {
  final EnvironmentConfig env;
  final DiContainer container;

  const MainApplication({
    Key key,
    @required this.env,
    @required this.container,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget app;

    app = App(
        env: env,
        container: container,
        builder: (_context, env, container) {
          var router = inject<AppRouter>();
          var appState = context.watch<AppState>();

          AppLog.i('create App -> MaterialApp appState = $appState');

          return MaterialApp(
            title: 'Boiler Plate 2',
            theme: appState.theme.theme,
            home: router.home,
          );
        });

    // app = AppLocalization(
    //   context: context,
    //   child: app,
    //   supportedLocales: env.supportedLocales,
    // );
    // Di().container.singleton<AppLocalization>(app);

    return app;
  }
}
