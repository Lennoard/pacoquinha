import 'package:flutter/material.dart';
import 'package:tabata/common/widgets/button.dart';
import 'package:tabata/common/widgets/number_picker.dart';

Future<int?> showNumberPickerBottomSheet({
  required BuildContext context,
  required String title,
}) {
  int number = 0;

  return showModalBottomSheet<int>(
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
                    child: NumberPicker(
                      value: 0,
                      minValue: 0,
                      maxValue: 100,
                      onChanged: (n) {
                        number = n;
                      },
                    ),
                  ),
                ],
              ),
              Button(
                text: "Selecionar",
                onPressed: () {
                  Navigator.of(context).pop(number);
                },
              ),
            ],
          ),
        ),
      );
    },
  );

}
