import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tabata/common/widgets/button.dart';
import 'package:tabata/constants/routes.dart';
import 'package:tabata/features/tabata/presentation/widgets/tabata_settings/tabata_settings.dart';

class TabataMainPage extends StatefulWidget {
  const TabataMainPage({Key? key}) : super(key: key);

  @override
  State<TabataMainPage> createState() => _TabataMainPageState();
}

class _TabataMainPageState extends State<TabataMainPage>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const TabataSettingsRow(),
            Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/ic_play_large.png'),
                        const Padding(
                          padding: EdgeInsets.only(top: 26.0),
                          child: Text(
                            "Toque para iniciar",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Lottie.asset(
                  'assets/lottie/resting_progress.json',
                  fit: BoxFit.fill,
                  animate: false,
                ),
                Lottie.asset(
                  'assets/lottie/training_progress.json',
                  fit: BoxFit.fill,
                  animate: false,
                ),
                Lottie.asset(
                  'assets/lottie/training_total_progress.json',
                  fit: BoxFit.fill,
                  animate: false,
                ),
              ],
            ),
            Button(
              text: "Configurar Tabata",
              onPressed: () => navigateToSettings(context),
            )
          ],
        ),
      ),
    );
  }
}
