import 'package:boilerplate2/src/application/env.dart';
import 'package:boilerplate2/src/application/localization.dart';
import 'package:boilerplate2/src/di/container.dart';
import 'package:boilerplate2/src/ui/_components/ui_view.dart' as app;
import 'package:boilerplate2/src/ui/_theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'setting.vm.dart';

class LanguageView extends app.UIView<LanguageVM> {
  final int id;

  LanguageView(LanguageVM viewModel, {this.id}) : super(viewModel);

  @override
  String get name => '/setting';

  @override
  Widget render(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t('.name')),
      ),
//      body: plug(#counter, CounterWidget()),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(t('.language')),
                RaisedButton(
                  child: Text(t('.lang_th')),
                  onPressed: () {
                    $vm.setLocale(SupportedLocale.TH);
                  },
                ),
                RaisedButton(
                  child: Text(t('.lang_en')),
                  onPressed: () {
                    $vm.setLocale(SupportedLocale.EN);
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(t('.theme')),
                RaisedButton(
                  child: Text('Light'),
                  onPressed: () {
                    $vm.setTheme(UIThemeLight());
                  },
                ),
                RaisedButton(
                  child: Text('Dark'),
                  onPressed: () {
                    $vm.setTheme(UIThemeDark());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
