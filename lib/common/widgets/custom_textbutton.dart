import 'package:flutter/material.dart';
import 'package:tabata/theme/colors.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  int? colorVariant = 500;
  ImageIcon? imageIcon;

  CustomTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.imageIcon,
    this.colorVariant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool hasImageIcon = imageIcon != null;

    return TextButton(
      style: TextButton.styleFrom(primary: tabataPurple[400]),
      onPressed: onPressed,
      child: Row(
        children: [
          if (hasImageIcon) imageIcon!,
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text("Repetir tabata"),
          ),
        ],
      ),
    );
  }
}
