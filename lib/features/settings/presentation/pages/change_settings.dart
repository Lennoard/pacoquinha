import 'package:flutter/material.dart';
import 'package:tabata/common/widgets/button.dart';
import 'package:tabata/common/widgets/confirmation_bottom_sheet.dart';
import 'package:tabata/features/settings/presentation/widgets/info_hint.dart';
import 'package:tabata/features/settings/presentation/widgets/row_input.dart';

class ChangeSettingsPage extends StatelessWidget {
  const ChangeSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          shape: const Border(
            bottom: BorderSide(
              color: Color(0xff454c54),
              width: 1,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.close),
              ),
              const Text(
                "Configurações",
                textAlign: TextAlign.center,
              ),
            ],
          ),
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
            Button(
              text: "Próximo",
              onPressed: () => showConfirmationBottomSheet(
                context: context,
                title: "Tem certeza que deseja sair?",
                body: "Ao sair, as alterações realizadas não serão salvas.",
                confirmLabel: "Confirmar",
                denyLabel: "Voltar",
                imagePath: 'assets/images/warning.png',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
