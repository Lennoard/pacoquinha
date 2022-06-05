import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:tabata/features/settings/domain/usecases/get_training_settings_use_case.dart';
import 'package:tabata/features/settings/presentation/pages/first_access.dart';
import 'package:tabata/features/training/domain/usecases/get_trainings_use_case.dart';
import 'package:tabata/firebase_options.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: preloadFutureBuilder(),
      ),
    );
  }

  FutureBuilder preloadFutureBuilder() {
    return FutureBuilder<void>(
      future: preLoad(), // a previously-obtained Future<String> or null
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        Widget widget = Lottie.asset("assets/lottie/splash_animation.json",
            onLoaded: (composition) {
          Timer(
            const Duration(milliseconds: 2700),
            () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) => const FirstAccessPage(),
              ),
            ),
          );
        });

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [widget],
          ),
        );
      },
    );
  }

  Future<void> preLoad() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

    var getSettings = GetIt.instance<GetTrainingSettingsUseCase>();
    var getTrainings = GetIt.instance<GetTrainingsUseCase>();

    (await getSettings()).fold((failure) => null, (settings) {
      // TODO
    });

    (await getTrainings()).fold((failure) => null, (trainings) {
      // TODO
    });
  }
}
