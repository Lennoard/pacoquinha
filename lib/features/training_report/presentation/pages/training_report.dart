import 'package:flutter/material.dart';
import 'package:tabata/common/widgets/custom_appbar.dart';
import 'package:tabata/features/training_report/presentation/widgets/training_item.dart';

class TrainingReportPage extends StatelessWidget {
  const TrainingReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppbar(title: "Seus treinos"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            TrainingItem(),
          ],
        ),
      ),
    );
  }
}
