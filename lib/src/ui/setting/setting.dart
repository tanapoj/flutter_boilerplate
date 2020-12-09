import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm_bloc/mvvm_bloc.dart';

import 'setting.view.dart';
import 'setting.vm.dart';

class LanguagePage extends StatelessWidget {
  final int id;

  const LanguagePage({Key key, this.id = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) => MVVMBLoC(
        view: (context, viewModel) => LanguageView(viewModel, id: id),
        viewModel: (lifeCycle) => LanguageVM(lifeCycle),
      ).build();
}
