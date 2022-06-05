import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:tabata/theme/colors.dart';

class CicleProgress extends StatelessWidget {
  final double percentage;
  const CicleProgress({
    Key? key,
    required this.percentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: MediaQuery.of(context).size.width * 0.42,
      lineWidth: 3.0,
      percent: percentage,
      backgroundColor: timerBackground,
      progressColor: foregroundColor,
      circularStrokeCap: CircularStrokeCap.round,
      center: const Padding(
        padding: EdgeInsets.all(8.0),
        child: SizedBox(
          width: 500,
          height: 500,
        ),
      ),
    );
  }
}
