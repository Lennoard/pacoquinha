import 'package:mobx/mobx.dart';
part 'tabata.store.g.dart';

class TabataState = _TabataState with _$TabataState;

abstract class _TabataState with Store {
  @observable
  Map trainingSettings = {
    'paused': false,
    'stopped': false,
    'actual_cycle': 0,
    'actual_series': 0,
  };

  @action
  void increment() {}
}
