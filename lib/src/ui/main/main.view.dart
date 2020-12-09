import 'package:bloc_builder/commons/widgets.dart';
import 'package:boilerplate2/src/commons/log.dart';
import 'package:boilerplate2/src/ui/_components/ui_view.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm_bloc/vm.dart';

import 'main.vm.dart';

class MainView extends app.UIView<MainVM> {
  MainView(ViewModel viewModel) : super(viewModel);

  @override
  String get name => '/main';

  @override
  Widget render(BuildContext context) {
    AppLog.d('test mainpage t(/home.name) = ${t('/ home.name')}');
    return Scaffold(
      body: Center(
        child: Text('This is Main'),
      ),
    );
  }
}
