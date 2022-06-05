import 'package:flutter/material.dart';
import 'package:tabata/common/widgets/button.dart';
import 'package:tabata/theme/colors.dart';

Future<bool?> showConfirmationBottomSheet({
  required BuildContext context,
  required String imagePath,
  required String title,
  required String body,
  required String confirmLabel,
  required String denyLabel,
}) {
  return showModalBottomSheet<bool>(
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
                  Image.asset(imagePath),
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
                      vertical: 12.0,
                    ),
                    child: Text(
                      body,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Button(
                      text: confirmLabel,
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      }),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: tabataPurple,
                    ),
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text(
                      denyLabel,
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
