import 'package:boilerplate2/src/application/router.dart';
import 'package:boilerplate2/src/commons/log.dart';
import 'package:boilerplate2/src/di/container.dart';
import 'package:boilerplate2/src/ui/setting/setting.dart';
import 'package:flutter_live_data/flutter_live_data.dart';
import 'package:mvvm_bloc/vm.dart';

import 'home.dart';

class HomeVM extends ViewModel {
  final int id;
  final AppRouter router = inject<AppRouter>();

  HomeVM(LifeCycleObserver observer, {this.id});

  void routeReplaceHome() {
    router.of(context).replace().push(
          HomePage(id: id + 1),
        );
  }

  void routeToMyList() {
    router.of(context).push(
          LanguagePage(),
        );
  }

  @override
  void onInit() {
    AppLog.d('HomeVM{$id}.onInit()');
  }

  @override
  void onBuild() {
    AppLog.d('HomeVM{$id}.onBuild()');
  }

  @override
  void onResume() {
    AppLog.d('HomeVM{$id}.onResume()');
  }

  @override
  void onPause() {
    AppLog.d('HomeVM{$id}.onPause()');
  }

  @override
  void onDispose() {
    AppLog.d('HomeVM{$id}.onDispose()');
  }
}
