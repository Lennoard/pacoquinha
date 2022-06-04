import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BaseTraining extends Equatable {
  final Timestamp time;
  final Map<String, int> settings;

  const BaseTraining({
    required this.time,
    required this.settings,
  });

  @override
  List<Object?> get props => [time, settings];
}
