import 'package:boilerplate2/src/application/router.dart';
import 'package:boilerplate2/src/commons/log.dart';
import 'package:boilerplate2/src/di/container.dart';
import 'package:boilerplate2/src/ui/home/home.dart';
import 'package:mvvm_bloc/mvvm_bloc.dart';

class MainVM extends ViewModel {
  final AppRouter router = inject<AppRouter>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onBuild() {
    super.onBuild();
    router.of(context).observeBy(this).replace().push(HomePage());
  }
}
