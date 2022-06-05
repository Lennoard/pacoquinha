import 'package:flutter/material.dart';
import 'package:tabata/theme/colors.dart';

class PaperContainer extends StatelessWidget {
  final Widget child;
  const PaperContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: paperBackground,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: child,
    );
  }
}
