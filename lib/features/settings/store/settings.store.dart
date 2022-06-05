import 'package:mobx/mobx.dart';
import 'package:tabata/features/settings/domain/entities/training_settings.dart';
part 'settings.store.g.dart';

class TrainingSettingsStore = _TrainingSettingsStore
    with _$TrainingSettingsStore;

abstract class _TrainingSettingsStore with Store {
  @observable
  TrainingSettings trainingSettings = TrainingSettings.defaultSettings();

  @action
  void updateTrainingSettingStore(TrainingSettings updatedTrainingSettings) {
    trainingSettings = updatedTrainingSettings;
  }
}
