import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tabata/common/widgets/bold_text.dart';
import 'package:tabata/common/widgets/button.dart';
import 'package:tabata/common/widgets/confirmation_bottom_sheet.dart';
import 'package:tabata/constants/routes.dart';
import 'package:tabata/features/tabata/presentation/widgets/tabata_indicators/cicle_progress.dart';
import 'package:tabata/features/tabata/presentation/widgets/tabata_indicators/series_progress.dart';
import 'package:tabata/features/tabata/presentation/widgets/tabata_settings/tabata_settings.dart';
import 'package:tabata/theme/colors.dart';

class TabataMainPage extends StatefulWidget {
  const TabataMainPage({Key? key}) : super(key: key);

  @override
  State<TabataMainPage> createState() => _TabataMainPageState();
}

class _TabataMainPageState extends State<TabataMainPage>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  static int maxSeconds = 60;
  int seconds = maxSeconds;
  Timer? timer;
  bool isRunningTimer = false;
  bool isPausedTimer = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void navigateToSettings(BuildContext context) {
    Navigator.of(context).pushNamed(changeSettingsRoute);
  }

  void startTimer() {
    setState(() => isRunningTimer = true);
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() => seconds--);
    });
  }

  void resetTimer() {
    seconds = maxSeconds;
    setState(() {
      isRunningTimer = false;
      isPausedTimer = false;
    });
    timer?.cancel();
    // stopTimer();
  }

  void stopTimer() {
    setState(() {
      isRunningTimer = false;
      isPausedTimer = true;
    });
    timer?.cancel();
  }

  void showCountdown(BuildContext context) async {
    await Navigator.of(context).pushNamedAndRemoveUntil(
      countdownAnimationRoute,
      (route) => true,
    );
    startTimer();
  }

  Widget timerStoppedContent() {
    return GestureDetector(
      onTap: () => showCountdown(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/icons/ic_play_large.png'),
          const Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: BoldText(text: "Toque para iniciar"),
          )
        ],
      ),
    );
  }

  Widget timerRunningContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 66.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ImageIcon(
            const AssetImage(
              'assets/icons/ic_workout_time_colored.png',
            ),
            color: tabataPurple.shade300,
          ),
          Column(
            children: [
              Text(
                seconds.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 60.0,
                ),
              ),
              const BoldText(text: "Exercite"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              ImageIcon(
                AssetImage('assets/icons/ic_series.png'),
              ),
              BoldText(text: "20/20"),
            ],
          )
        ],
      ),
    );
  }

  void handleSkipTraining(context) async {
    if (!isPausedTimer || isRunningTimer) {
      stopTimer();
    }

    final bool? skipTraining = await showConfirmationBottomSheet(
      context: context,
      imagePath: 'assets/images/warning.png',
      title: "Tem certeza que deseja finalizar o treino?",
      body: "Ao finalizar, o treino em andamento fechará e não será salvo.",
      confirmLabel: "Finalizar treino",
      denyLabel: "Voltar",
    );

    if (skipTraining!) {
      resetTimer();
    } else {
      startTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            if (!isRunningTimer && !isPausedTimer) const TabataSettingsRow(),
            if (isRunningTimer || isPausedTimer)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const ImageIcon(
                      AssetImage(
                        'assets/icons/ic_sound_on.png',
                      ),
                    ),
                  )
                ],
              ),
            Column(
              children: [
                if (isRunningTimer || isPausedTimer)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      ImageIcon(
                        AssetImage(
                          'assets/icons/ic_cicle.png',
                        ),
                      ),
                      BoldText(text: "1/3"),
                    ],
                  ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      const SeriesProgress(
                        seriesCount: 5,
                        actualSerie: 4,
                      ),
                      const CicleProgress(
                        cicleCount: 3,
                        actualCicle: 1,
                      ),
                      if (!isRunningTimer && !isPausedTimer)
                        timerStoppedContent(),
                      if (isRunningTimer || isPausedTimer)
                        timerRunningContent(),
                    ],
                  ),
                ),
                if (isRunningTimer || isPausedTimer)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      ImageIcon(
                        AssetImage(
                          'assets/icons/ic_time_colored.png',
                        ),
                      ),
                      BoldText(text: "4:00"),
                    ],
                  ),
              ],
            ),
            if (!isRunningTimer && !isPausedTimer)
              Button(
                text: "Configurar Tabata",
                onPressed: () => navigateToSettings(context),
              ),
            if (isRunningTimer || isPausedTimer)
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.2,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: resetTimer,
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(
                            side: BorderSide(
                          width: 1,
                          color: tabataGrey,
                        )),
                        padding: const EdgeInsets.all(16),
                        primary: tabataBackground,
                      ),
                      child: const ImageIcon(
                        AssetImage('assets/icons/ic_stop_large.png'),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: !isRunningTimer && isPausedTimer
                          ? startTimer
                          : stopTimer,
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(24),
                        primary: foregroundColor,
                      ),
                      child: ImageIcon(
                        AssetImage(
                          !isRunningTimer && isPausedTimer
                              ? 'assets/icons/ic_play.png'
                              : 'assets/icons/ic_pause.png',
                        ),
                        color: Colors.black,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => handleSkipTraining(context),
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(
                            side: BorderSide(
                          width: 1,
                          color: tabataGrey,
                        )),
                        padding: const EdgeInsets.all(16),
                        primary: tabataBackground,
                      ),
                      child: const ImageIcon(
                        AssetImage('assets/icons/ic_next.png'),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
