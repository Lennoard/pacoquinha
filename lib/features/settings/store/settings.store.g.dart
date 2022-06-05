// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TrainingSettingsStore on _TrainingSettingsStore, Store {
  late final _$trainingSettingsAtom =
      Atom(name: '_TrainingSettingsStore.trainingSettings', context: context);

  @override
  TrainingSettings get trainingSettings {
    _$trainingSettingsAtom.reportRead();
    return super.trainingSettings;
  }

  @override
  set trainingSettings(TrainingSettings value) {
    _$trainingSettingsAtom.reportWrite(value, super.trainingSettings, () {
      super.trainingSettings = value;
    });
  }

  late final _$_TrainingSettingsStoreActionController =
      ActionController(name: '_TrainingSettingsStore', context: context);

  @override
  void updateTrainingSettingStore(TrainingSettings updatedTrainingSettings) {
    final _$actionInfo = _$_TrainingSettingsStoreActionController.startAction(
        name: '_TrainingSettingsStore.updateTrainingSettingStore');
    try {
      return super.updateTrainingSettingStore(updatedTrainingSettings);
    } finally {
      _$_TrainingSettingsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
trainingSettings: ${trainingSettings}
    ''';
  }
}
