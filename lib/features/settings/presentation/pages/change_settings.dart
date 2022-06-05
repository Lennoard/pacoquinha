import 'package:flutter/material.dart';
import 'package:tabata/common/widgets/button.dart';
import 'package:tabata/constants/routes.dart';
import 'package:tabata/features/settings/presentation/widgets/info_hint.dart';
import 'package:tabata/features/settings/presentation/widgets/row_input.dart';

class ChangeSettingsPage extends StatelessWidget {
  const ChangeSettingsPage({Key? key}) : super(key: key);

  void navigateToTabata(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, tabataRoute, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          centerTitle: true,
          shape: const Border(
            bottom: BorderSide(
              color: Color(0xff454c54),
              width: 1,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text("Configurações"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: const [
                InfoHint(),
                RowInput(
                  iconPath: 'assets/icons/ic_workout_time_colored.png',
                  label: "Tempo da série",
                  value: "00:00",
                ),
                RowInput(
                  iconPath: 'assets/icons/ic_series.png',
                  label: "Quantidade de séries",
                  value: "8",
                ),
                RowInput(
                  iconPath: 'assets/icons/ic_rest_colored_alt.png',
                  label: "Tempo de descanso",
                  value: "00:10",
                ),
                RowInput(
                  iconPath: 'assets/icons/ic_cicle_colored.png',
                  label: "Quantidade de ciclos",
                  value: "1",
                ),
                RowInput(
                  iconPath: 'assets/icons/ic_interval.png',
                  label: "Intervalo entre ciclos",
                  value: "00:00",
                ),
                RowInput(
                  iconPath: 'assets/icons/ic_time_colored.png',
                  label: "Tempo total",
                  value: "00:00",
                ),
              ],
            ),
            Button(text: "Próximo", onPressed: () => navigateToTabata(context)),
          ],
        ),
      ),
    );
  }
}
