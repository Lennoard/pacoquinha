import 'package:flutter/material.dart';
import 'package:tabata/common/widgets/bold_text.dart';
import 'package:tabata/common/widgets/custom_textbutton.dart';
import 'package:tabata/common/widgets/disabled_text.dart';
import 'package:tabata/common/widgets/regular_text.dart';
import 'package:tabata/features/training_report/presentation/widgets/training_info.dart';
import 'package:tabata/theme/colors.dart';

class TrainingItem extends StatelessWidget {
  const TrainingItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF22262A),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: tabataPurple,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ImageIcon(
                          AssetImage(
                            'assets/icons/ic_training_feel_moderate.png',
                          ),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      BoldText(text: "Treino Moderado"),
                      RegularText(
                        text:
                            "Treino de cardio: skipping, salto, polichinelo...",
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  TrainingInfo(
                    imageIcon: ImageIcon(
                      AssetImage('assets/icons/ic_series.png'),
                    ),
                    label: "Séries",
                    quantity: "20",
                  ),
                  TrainingInfo(
                    imageIcon: ImageIcon(
                      AssetImage('assets/icons/ic_cicle.png'),
                    ),
                    label: "Ciclos",
                    quantity: "3",
                  ),
                  TrainingInfo(
                    imageIcon: ImageIcon(
                      AssetImage('assets/icons/ic_time_colored.png'),
                    ),
                    label: "Tempo total",
                    quantity: "04:00",
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color(0xFF2E3338),
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextButton(
                  imageIcon: const ImageIcon(
                    AssetImage('assets/icons/ic_return.png'),
                  ),
                  text: "Repetir tabata",
                  onPressed: () {},
                ),
                const DisabledText(text: "Seg | 23 Maio 22"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
