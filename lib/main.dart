import 'package:boilerplate2/src/application/env.dart';
import 'package:boilerplate2/src/di/container.dart';
import 'package:flutter/widgets.dart';

import 'application.dart';

void main() {
  var env = DevMockEnvironment();
  var container = DiContainer().withDefaultDependencies();

  runApp(
    MainApplication(
      env: env,
      container: container,
    ),
  );
}
