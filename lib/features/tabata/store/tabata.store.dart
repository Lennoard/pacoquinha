import 'package:mobx/mobx.dart';
part 'tabata.store.g.dart';

class TabataState = _TabataState with _$TabataState;

abstract class _TabataState with Store {
  @observable
  Map trainingSettings = {
    'paused': false,
    'stopped': false,
  };

  @action
  void increment() {}
}
