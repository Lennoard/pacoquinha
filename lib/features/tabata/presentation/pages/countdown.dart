import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CountdownAnimation extends StatelessWidget {
  const CountdownAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/lottie/training_countdown.json',
            onLoaded: (composition) {
          Timer(
            const Duration(milliseconds: 2800),
            () => Navigator.of(context).pop(true),
          );
        }),
      ),
    );
  }
}
