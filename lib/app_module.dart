import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:tabata/features/training/data/database_helper.dart';
import 'package:tabata/features/training/data/datasources/training_firestore_data_source.dart';
import 'package:tabata/features/training/data/datasources/training_local_data_source.dart';
import 'package:tabata/features/training/data/datasources/training_settings_firestore_data_source.dart';
import 'package:tabata/features/training/data/datasources/training_settings_local_data_source.dart';
import 'package:tabata/features/training/data/mappers/local_data_mapper.dart';
import 'package:tabata/features/training/data/mappers/local_training_settings_mapper.dart';
import 'package:tabata/features/training/data/mappers/training_mapper.dart';
import 'package:tabata/features/training/data/repositories/training_repository_impl.dart';
import 'package:tabata/features/training/data/repositories/training_settings_repository_impl.dart';
import 'package:tabata/features/training/domain/repositories/training_repository.dart';
import 'package:tabata/features/training/domain/repositories/training_settings_repository.dart';
import 'package:tabata/features/training/domain/usecases/add_training_use_case.dart';
import 'package:tabata/features/training/domain/usecases/delete_training_use_case.dart';
import 'package:tabata/features/training/domain/usecases/get_trainings_use_case.dart';
import 'package:tabata/features/training/domain/usecases/impl/add_training_use_case_impl.dart';
import 'package:tabata/features/training/domain/usecases/impl/delete_training_use_case_impl.dart';
import 'package:tabata/features/training/domain/usecases/impl/get_training_use_case_impl.dart';
import 'package:tabata/features/training/domain/usecases/impl/get_trainings_use_case_impl.dart';
import 'package:tabata/features/training/domain/usecases/impl/update_training_use_case_impl.dart';
import 'package:tabata/features/training/domain/usecases/settings/get_training_settings_use_case.dart';
import 'package:tabata/features/training/domain/usecases/settings/impl/get_training_settings_use_case_impl.dart';
import 'package:tabata/features/training/domain/usecases/settings/impl/save_training_settings_use_case_impl.dart';
import 'package:tabata/features/training/domain/usecases/settings/save_training_settings_use_case.dart';
import 'package:tabata/features/training/domain/usecases/update_training_use_case.dart';

import 'features/training/domain/usecases/get_training_use_case.dart';

class AppModule {
  static void initLocator(GetIt locator) {
    // Firebase
    locator.registerFactory<FirebaseAuth>(() => FirebaseAuth.instance);
    locator
        .registerFactory<FirebaseFirestore>(() => FirebaseFirestore.instance);

    // Mappers
    locator.registerFactory<LocalTrainingMapper>(() => LocalTrainingMapper());
    locator.registerFactory<LocalTrainingSettingsMapper>(
        () => LocalTrainingSettingsMapper());
    locator.registerFactory<TrainingMapper>(() => TrainingMapper());

    // DB Helper
    locator.registerSingleton<DatabaseHelper>(DatabaseHelper.instance);

    // Data sources
    locator.registerFactory(() => TrainingSettingsLocalDataSource(
        locator<DatabaseHelper>(), locator<LocalTrainingSettingsMapper>()));
    locator.registerFactory(() => TrainingSettingsFirestoreDataSource(
        locator<FirebaseFirestore>(),
        locator<FirebaseAuth>(),
        locator<LocalTrainingSettingsMapper>()));
    locator.registerFactory(() => TrainingLocalDataSource(
        locator<DatabaseHelper>(),
        locator<TrainingMapper>(),
        locator<LocalTrainingMapper>()));
    locator.registerFactory(() =>
        TrainingFirestoreDataSource(
            locator<FirebaseFirestore>(),
            locator<FirebaseAuth>(),
            locator<TrainingMapper>(),
            locator<LocalTrainingMapper>()));

    // Repositories
    locator.registerFactory<TrainingRepository>(() => TrainingRepositoryImpl(
        locator<TrainingLocalDataSource>(),
        locator<TrainingFirestoreDataSource>()));
    locator.registerFactory<TrainingSettingsRepository>(() =>
        TrainingSettingsRepositoryImpl(
            locator<TrainingSettingsLocalDataSource>(),
            locator<TrainingSettingsFirestoreDataSource>()));

    // Use cases
    locator.registerFactory<AddTrainingUseCase>(() => AddTrainingUseCaseImpl(
        locator<FirebaseAuth>(), locator<TrainingRepository>()));
    locator.registerFactory<DeleteTrainingUseCase>(() =>
        DeleteTrainingUseCaseImpl(
            locator<FirebaseAuth>(), locator<TrainingRepository>()));
    locator.registerFactory<GetTrainingUseCase>(() => GetTrainingUseCaseImpl(
        locator<FirebaseAuth>(), locator<TrainingRepository>()));
    locator.registerFactory<GetTrainingsUseCase>(() => GetTrainingsUseCaseImpl(
        locator<FirebaseAuth>(), locator<TrainingRepository>()));
    locator.registerFactory<UpdateTrainingUseCase>(() =>
        UpdateTrainingUseCaseImpl(
            locator<FirebaseAuth>(), locator<TrainingRepository>()));
    locator.registerFactory<GetTrainingSettingsUseCase>(() =>
        GetTrainingSettingsUseCaseImpl(
            locator<FirebaseAuth>(), locator<TrainingSettingsRepository>()));
    locator.registerFactory<SaveTrainingSettingsUseCase>(() =>
        SaveTrainingSettingsUseCaseImpl(
            locator<FirebaseAuth>(), locator<TrainingSettingsRepository>()));
  }
}
