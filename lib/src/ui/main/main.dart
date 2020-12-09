import 'package:boilerplate2/src/application/router.dart';
import 'package:boilerplate2/src/commons/log.dart';
import 'package:boilerplate2/src/ui/_components/empty.dart';
import 'package:boilerplate2/src/ui/home/home.dart';
import 'package:boilerplate2/src/ui/main/main.view.dart';
import 'package:boilerplate2/src/ui/main/main.vm.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm_bloc/mvvm_bloc.dart';

class MainPage extends StatefulWidget {
  MainPage() {
    AppLog.d('test MainPage init');
  }

  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> with AutomaticKeepAliveClientMixin {
  bool get wantKeepAlive => true;

  _MainPage() {
    AppLog.d('test _MainPage init');
  }

  @override
  Widget build(BuildContext context) {
    return MVVMBLoC(
      view: (context, viewModel) => MainView(viewModel),
      viewModel: (lifeCycleObserver) => MainVM(),
    ).build();
  }
}
