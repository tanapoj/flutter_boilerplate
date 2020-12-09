import 'package:boilerplate2/src/application/app.dart';
import 'package:boilerplate2/src/application/router.dart';
import 'package:boilerplate2/src/commons/extensions/index.dart';
import 'package:boilerplate2/src/commons/log.dart';
import 'package:boilerplate2/src/di/container.dart';
import 'package:boilerplate2/src/ui/_components/ui_view.dart' as app;
import 'package:boilerplate2/src/ui/home/home.dart';
import 'package:boilerplate2/src/ui/setting/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'home.vm.dart';

import 'package:provider/provider.dart';

class HomeView extends app.UIView<HomeVM> {
  final int id;
  final AppRouter router = inject<AppRouter>();

  HomeView(HomeVM viewModel, {this.id}) : super(viewModel);

  @override
  String get name => '/home';

  @override
  Widget render(BuildContext context) {
    AppLog.d('test homepage t(.name) = ${t('.name')}');
    return Scaffold(
      appBar: AppBar(
        title: Text(t('.name')),
      ),
//      body: plug(#counter, CounterWidget()),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('body'),
            RaisedButton(
              child: Text('Refresh Home'),
              onPressed: () {
                $vm.routeReplaceHome();
              },
            ),
            RaisedButton(
              child: Text('Language'),
              onPressed: () {
                $vm.routeToMyList();
              },
            ),
          ],
        ),
      ),
    );
  }
}
