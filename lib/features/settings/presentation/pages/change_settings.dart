import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tabata/common/widgets/button.dart';
import 'package:tabata/constants/routes.dart';
import 'package:tabata/features/settings/domain/entities/training_settings.dart';
import 'package:get_it/get_it.dart';
import 'package:tabata/features/settings/domain/usecases/save_training_settings_use_case.dart';
import 'package:tabata/features/settings/presentation/widgets/info_hint.dart';
import 'package:tabata/features/settings/presentation/widgets/row_input.dart';
import 'package:tabata/features/settings/store/settings.store.dart';
import 'package:tabata/theme/colors.dart';

class ChangeSettingsPage extends StatefulWidget {
  const ChangeSettingsPage({Key? key}) : super(key: key);

  @override
  State<ChangeSettingsPage> createState() => _ChangeSettingsPageState();
}

class _ChangeSettingsPageState extends State<ChangeSettingsPage> {
  final settingsStore = TrainingSettingsStore();
  late final SaveTrainingSettingsUseCase saveSettings;

  TrainingSettings settings = TrainingSettings.defaultSettings();

  void navigateToTabata(BuildContext context) {
    // const TrainingSettings updatedSettings = TrainingSettings(
    //   cycleCount: 1,
    //   cycleInterval: 1,
    //   restingTime: 1,
    //   seriesCount: 1,
    //   seriesTime: 1,
    // );
    // settingsStore.updateTrainingSettingStore(updatedSettings);
    Navigator.pushNamedAndRemoveUntil(context, tabataRoute, (_) => false);
  }

  @override
  void initState() {
    super.initState();
    saveSettings = GetIt.instance<SaveTrainingSettingsUseCase>();
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
              color: tabataGrey,
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
              children: [
                const InfoHint(),
                Observer(
                  builder: (_) => RowInput(
                    iconPath: 'assets/icons/ic_workout_time_colored.png',
                    label: "Tempo da série",
                    value: settingsStore.trainingSettings.seriesTime.toString(),
                    onTap: () {
                      // TODO
                    },
                  ),
                ),
                Observer(
                  builder: (_) => RowInput(
                    iconPath: 'assets/icons/ic_series.png',
                    label: "Quantidade de séries",
                    value:
                        settingsStore.trainingSettings.seriesCount.toString(),
                    onTap: () {
                      // TODO
                    },
                  ),
                ),
                Observer(
                  builder: (_) => RowInput(
                    iconPath: 'assets/icons/ic_rest_colored_alt.png',
                    label: "Tempo de descanso",
                    value:
                        settingsStore.trainingSettings.restingTime.toString(),
                    onTap: () {
                      // TODO
                    },
                  ),
                ),
                Observer(
                  builder: (_) => RowInput(
                    iconPath: 'assets/icons/ic_cicle_colored.png',
                    label: "Quantidade de ciclos",
                    value: settingsStore.trainingSettings.cycleCount.toString(),
                    onTap: () {
                      // TODO
                    },
                  ),
                ),
                Observer(
                  builder: (_) => RowInput(
                    iconPath: 'assets/icons/ic_interval.png',
                    label: "Intervalo entre ciclos",
                    value:
                        settingsStore.trainingSettings.cycleInterval.toString(),
                    onTap: () {
                      // TODO
                    },
                  ),
                ),
                Observer(
                  builder: (_) => RowInput(
                    iconPath: 'assets/icons/ic_time_colored.png',
                    label: "Tempo total",
                    value: settingsStore.trainingSettings.getTrainingTime
                        .toString(),
                    onTap: () {
                      // TODO
                    },
                  ),
                ),
              ],
            ),
            Button(
              text: "Próximo",
              onPressed: () async {
                // TODO: update MobX
                await saveSettings(settings);
                navigateToTabata(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
