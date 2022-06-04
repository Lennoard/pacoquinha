import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tabata/features/settings/presentation/pages/first_access.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset("assets/lottie/splash_animation.json",
            onLoaded: (composition) {
          Timer(
            const Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) => const FirstAccessPage(),
              ),
            ),
          );
        }),
      ),
    );
  }
}
