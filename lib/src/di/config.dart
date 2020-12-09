import 'package:boilerplate2/src/application/localization.dart';
import 'package:boilerplate2/src/application/router.dart';
import 'package:boilerplate2/src/data/preferences/app_state_preference.dart';
import 'package:boilerplate2/src/di/container.dart';
import 'package:boilerplate2/src/events/bus.dart';
import 'package:boilerplate2/src/test/my_repository.dart';
import 'package:boilerplate2/src/ui/_theme/theme.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import '../commons/media_query.dart';

extension defaultSetting on DiContainer {
  DiContainer withDefaultDependencies() {
    // === Test ===
    singletonFactory<MyRepository>((_) {
      return MyRepository();
    });

    // === Core Framework ===
    singletonFactory<BuildContext>((_) {
      return null;
    });
    singletonFactory<Bus>((_) {
      return Bus();
    });
    singletonFactory<AppStatePreference>((_) {
      return AppStatePreference();
    });
    singletonFactory<AppRouter>((c) {
      return AppRouter(
        context: c.get<BuildContext>(),
      );
    });

    // === Commons ===
    singletonFactory<AppMediaQuery>((_) {
      return AppMediaQuery();
    });

    // === Third-Party ===
    singletonFactory<Dio>((_) {
      return Dio();
    });

    return this;
  }
}
