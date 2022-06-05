import 'package:flutter/material.dart';
import 'package:tabata/common/utils/instensity_label.dart';
import 'package:tabata/common/utils/show_toast.dart';
import 'package:tabata/common/widgets/bold_text.dart';
import 'package:tabata/common/widgets/button.dart';
import 'package:tabata/common/widgets/confirmation_bottom_sheet.dart';
import 'package:tabata/common/widgets/custom_appbar.dart';
import 'package:tabata/common/widgets/disabled_text.dart';
import 'package:tabata/common/widgets/paper_container.dart';
import 'package:tabata/features/training/domain/entities/training.dart';
import 'package:tabata/features/settings/domain/entities/training_settings.dart';
import 'package:tabata/features/training_report/presentation/widgets/training_detail_item.dart';
import 'package:tabata/features/training_report/presentation/widgets/training_intensity_icon.dart';
import 'package:tabata/theme/colors.dart';

class TrainingDetailsPage extends StatelessWidget {
  final Training training;
  late final TrainingSettings _trainingSettings = training.settings;
  late final String intensityLabel = getIntensityLabel(training.intensity);

  TrainingDetailsPage({Key? key, required this.training}) : super(key: key);

  void handleDeleteTraining(context) async {
    final bool? delete = await showConfirmationBottomSheet(
      context: context,
      imagePath: 'assets/images/delete.png',
      title: "Tem certeza que deseja excluir?",
      body: "Ao excluir, o treino será apagado e não poderá ser recuperado.",
      confirmLabel: "Excluir",
      denyLabel: "Voltar",
    );

    if (delete!) {
      showToast(message: "Treino excluído");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppbar(
          title: "Detalhes do treino",
          rightButton: IconButton(
            icon: const ImageIcon(
              AssetImage("assets/icons/ic_trash.png"),
            ),
            onPressed: () => handleDeleteTraining(context),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TrainingIntensityIcon(intensity: training.intensity),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BoldText(text: intensityLabel),
                          const DisabledText(text: "Seg | 23 Maio 22"),
                        ],
                      ),
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    "Treino de cardio: skipping, salto, polichinelo e escalador",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                PaperContainer(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        TrainingDetailItem(
                          iconPath: 'assets/icons/ic_workout_time_colored.png',
                          label: "Tempo da série",
                          value: _trainingSettings.seriesTime.toString(),
                        ),
                        const Divider(
                          color: neutralGrey,
                          thickness: 1,
                        ),
                        TrainingDetailItem(
                          iconPath: 'assets/icons/ic_rest_colored_alt.png',
                          label: "Tempo de descanso",
                          value: _trainingSettings.restingTime.toString(),
                        ),
                        const Divider(
                          color: neutralGrey,
                          thickness: 1,
                        ),
                        TrainingDetailItem(
                          iconPath: 'assets/icons/ic_interval.png',
                          label: "Intervalo entre ciclos",
                          value: _trainingSettings.restingTime.toString(),
                        ),
                        const Divider(
                          color: neutralGrey,
                          thickness: 1,
                        ),
                        TrainingDetailItem(
                          iconPath: 'assets/icons/ic_series.png',
                          label: "Quantidade de séries",
                          value: _trainingSettings.seriesCount.toString(),
                        ),
                        const Divider(
                          color: neutralGrey,
                          thickness: 1,
                        ),
                        TrainingDetailItem(
                          iconPath: 'assets/icons/ic_cicle_colored.png',
                          label: "Quantidade de ciclos",
                          value: _trainingSettings.cycleCount.toString(),
                        ),
                        const Divider(
                          color: neutralGrey,
                          thickness: 1,
                        ),
                        TrainingDetailItem(
                          iconPath: 'assets/icons/ic_series.png',
                          label: "Tempo total",
                          value: "02:20",
                          color: tabataPurple.shade300,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Button(text: "Repetir tabata", onPressed: () {})
          ],
        ),
      ),
    );
  }
}
