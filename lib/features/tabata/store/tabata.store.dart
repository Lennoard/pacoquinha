import 'package:mobx/mobx.dart';
part 'tabata.store.g.dart';

class TabataStore = _TabataStore with _$TabataStore;

abstract class _TabataStore with Store {
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
