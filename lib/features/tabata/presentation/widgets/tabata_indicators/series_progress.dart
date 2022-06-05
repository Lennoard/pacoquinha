import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:tabata/theme/colors.dart';

class SeriesProgress extends StatelessWidget {
  final int seriesCount;
  final int actualSerie;

  const SeriesProgress({
    Key? key,
    required this.seriesCount,
    required this.actualSerie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: MediaQuery.of(context).size.width * 0.4,
      lineWidth: 12.0,
      percent: ((seriesCount - actualSerie) / seriesCount).abs(),
      backgroundColor: timerBackground,
      progressColor: tabataPurple,
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
