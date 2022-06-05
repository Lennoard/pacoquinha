import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:tabata/common/widgets/button.dart';
import 'package:tabata/common/widgets/hour_picker.dart';
import 'package:tabata/common/widgets/hour_picker_bottom_sheet.dart';
import 'package:tabata/constants/routes.dart';
import 'package:tabata/features/settings/domain/entities/training_settings.dart';
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
  int seriesTime = 0;
  int restingTime = 0;
  int cycleInterval = 0;
  int cycleCount = 0;
  int seriesCount = 0;
  int trainingTime = 0;

  TrainingSettings settings = TrainingSettings.defaultSettings();

  void submit(BuildContext context) {
    TrainingSettings updatedSettings = TrainingSettings(
      cycleCount: cycleCount,
      cycleInterval: cycleInterval,
      restingTime: restingTime,
      seriesCount: seriesCount,
      seriesTime: restingTime,
    );
    settingsStore.updateTrainingSettingStore(updatedSettings);
    Navigator.pushNamedAndRemoveUntil(context, tabataRoute, (_) => false);
  }

  @override
  void initState() {
    super.initState();
    seriesTime = settings.seriesTime;
    restingTime = settings.restingTime;
    cycleInterval = settings.cycleInterval;
    seriesCount = settings.seriesCount;
    cycleCount = settings.cycleCount;
    trainingTime = settings.getTrainingTime;

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
                    value: seriesTime.toString(),
                    onTap: () async {
                      var hourPair = await showHourPickerBottomSheet(
                            context: context,
                            title: "Tempo da série",
                          ) ??
                          HourPair(0, 0);

                      setState(() {
                        seriesTime = (hourPair.minutes * 60) + hourPair.seconds;
                      });
                    },
                  ),
                ),
                Observer(
                  builder: (_) => RowInput(
                    iconPath: 'assets/icons/ic_series.png',
                    label: "Quantidade de séries",
                    value: seriesCount.toString(),
                    onTap: () async {
                      var count = await showHourPickerBottomSheet(
                        context: context,
                        title: "Quantidade de séries",
                        maxMin: 00
                      ) ?? HourPair(0, 0);

                      setState(() {
                        seriesCount = count.seconds;
                      });
                    },
                  ),
                ),
                Observer(
                  builder: (_) => RowInput(
                    iconPath: 'assets/icons/ic_rest_colored_alt.png',
                    label: "Tempo de descanso",
                    value: restingTime.toString(),
                    onTap: () async {
                      var hourPair = await showHourPickerBottomSheet(
                            context: context,
                            title: "Tempo de descanso",
                          ) ??
                          HourPair(0, 0);

                      setState(() {
                        restingTime = (hourPair.minutes * 60) + hourPair.seconds;
                      });
                    },
                  ),
                ),
                Observer(
                  builder: (_) => RowInput(
                    iconPath: 'assets/icons/ic_cicle_colored.png',
                    label: "Quantidade de ciclos",
                    value: cycleCount.toString(),
                    onTap: () async {
                      var count = await showHourPickerBottomSheet(
                        context: context,
                        title: "Quantidade de ciclos",
                      ) ?? HourPair(0, 0);

                      setState(() {
                        cycleCount = count.seconds;
                      });
                    },
                  ),
                ),
                Observer(
                  builder: (_) => RowInput(
                    iconPath: 'assets/icons/ic_interval.png',
                    label: "Intervalo entre ciclos",
                    value: cycleInterval.toString(),
                    onTap: () async {
                      var hourPair = await showHourPickerBottomSheet(
                            context: context,
                            title: "Intervalo entre ciclos",
                          ) ??
                          HourPair(0, 0);

                      setState(() {
                        cycleInterval = (hourPair.minutes * 60) + hourPair.seconds;
                      });
                    },
                  ),
                ),
                Observer(
                  builder: (_) => RowInput(
                    iconPath: 'assets/icons/ic_time_colored.png',
                    label: "Tempo total",
                    value: trainingTime.toString(),
                  ),
                ),
              ],
            ),
            Button(
              text: "Próximo",
              onPressed: () async {
                // TODO: update MobX
                await saveSettings(settings);
                submit(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
