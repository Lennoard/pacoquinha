import 'package:flutter/material.dart';
import 'package:tabata/theme/colors.dart';

import 'number_picker.dart';

class HourPair {
  int minutes;
  int seconds;

  HourPair(this.minutes, this.seconds);
}

class CustomPicker extends StatefulWidget {
  final String? title;
  final int maxMin;
  final int maxSec;
  final Function(HourPair hourPair) onChanged;

  const CustomPicker({
    Key? key,
    required this.title,
    required this.maxMin,
    required this.maxSec,
    required this.onChanged,
  }) : super(key: key);

  @override
  CustomPickerState createState() => CustomPickerState(onChanged);
}

class CustomPickerState extends State<CustomPicker> {
  final Function(HourPair hourPair) onChanged;
  HourPair hourPair = HourPair(0, 0);

  CustomPickerState(this.onChanged);

  SizedBox buildDecoration() {
    return const SizedBox(
      width: 52,
      height: 2,
      child: Divider(
        color: tabataPurple,
        thickness: 2,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70, left: 56, right: 56),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildDecoration(),
                    buildDecoration(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 126, left: 56, right: 56),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildDecoration(),
                    buildDecoration(),
                  ],
                ),
              ),
              buildClockNumbers(),
            ],
          ),
        ),
      ],
    );
  }

  Row buildClockNumbers() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text('Minutos', style: Theme.of(context).textTheme.caption),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: NumberPicker(
                minValue: 00,
                maxValue: widget.maxMin,
                zeroPad: true,
                value: hourPair.minutes,
                infiniteLoop: true,
                onChanged: (value) {
                  setState(() {
                    hourPair.minutes = value;
                    onChanged(hourPair);
                  });
                },
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 22),
          child: Text(
            ":",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
        ),
        Column(
          children: [
            Text('Segundos', style: Theme.of(context).textTheme.caption),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: NumberPicker(
                minValue: 00,
                maxValue: widget.maxSec,
                zeroPad: true,
                value: hourPair.seconds,
                infiniteLoop: true,
                onChanged: (value) {
                  setState(() {
                    hourPair.seconds = value;
                    onChanged(hourPair);
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}