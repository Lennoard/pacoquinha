import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tabata/features/settings/store/settings.store.dart';
import 'package:tabata/features/tabata/presentation/widgets/tabata_settings/tabata_setting_info.dart';

class TabataSettingsRow extends StatelessWidget {
  final TrainingSettingsStore trainingSettingsStore = TrainingSettingsStore();

  TabataSettingsRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Observer(
          builder: (_) => SettingInfo(
            assetPath: "assets/icons/ic_series.png",
            label: "Séries",
            quantity:
                trainingSettingsStore.trainingSettings.seriesCount.toString(),
          ),
        ),
        Observer(
          builder: (_) => SettingInfo(
            assetPath: "assets/icons/ic_cicle_colored.png",
            label: "Ciclos",
            quantity:
                trainingSettingsStore.trainingSettings.cycleCount.toString(),
          ),
        ),
        Observer(
          builder: (_) => SettingInfo(
            assetPath: "assets/icons/ic_time_colored.png",
            label: "Tempo total",
            quantity: trainingSettingsStore.trainingSettings.getTrainingTime
                .toString(),
          ),
        ),
      ],
    );
  }
}
