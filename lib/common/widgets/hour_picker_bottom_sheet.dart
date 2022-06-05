import 'package:flutter/material.dart';
import 'package:tabata/common/widgets/button.dart';
import 'package:tabata/common/widgets/hour_picker.dart';

Future<HourPair?> showHourPickerBottomSheet({
  required BuildContext context,
  required String title,
  int max = 100,
  int min = 0,
}) {
  HourPair pair = HourPair(0, 0);

  return showModalBottomSheet<HourPair>(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
    builder: (BuildContext context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 22.0, horizontal: 26.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 36.0,
                      vertical: 16.0,
                    ),
                    child: CustomHourPicker(title: title, onChanged: (hourPair) {
                      pair = hourPair;
                    }),
                  ),
                ],
              ),
              Button(
                text: "Selecionar",
                onPressed: () {
                  Navigator.of(context).pop(pair);
                },
              ),
            ],
          ),
        ),
      );
    },
  );

}
