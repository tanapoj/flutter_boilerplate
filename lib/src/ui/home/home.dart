import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm_bloc/mvvm_bloc.dart';

import 'home.view.dart';
import 'home.vm.dart';

class HomePage extends StatelessWidget {
  final int id;

  const HomePage({Key key, this.id = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) => MVVMBLoC(
        view: (context, viewModel) => HomeView(viewModel, id: id),
        viewModel: (lifeCycle) => HomeVM(lifeCycle, id: id),
      ).build();
}
