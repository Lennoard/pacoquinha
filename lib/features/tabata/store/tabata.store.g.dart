// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tabata.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TabataStore on _TabataStore, Store {
  late final _$trainingSettingsAtom =
      Atom(name: '_TabataStore.trainingSettings', context: context);

  @override
  Map<dynamic, dynamic> get trainingSettings {
    _$trainingSettingsAtom.reportRead();
    return super.trainingSettings;
  }

  @override
  set trainingSettings(Map<dynamic, dynamic> value) {
    _$trainingSettingsAtom.reportWrite(value, super.trainingSettings, () {
      super.trainingSettings = value;
    });
  }

  late final _$_TabataStoreActionController =
      ActionController(name: '_TabataStore', context: context);

  @override
  void increment() {
    final _$actionInfo = _$_TabataStoreActionController.startAction(
        name: '_TabataStore.increment');
    try {
      return super.increment();
    } finally {
      _$_TabataStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
trainingSettings: ${trainingSettings}
    ''';
  }
}
