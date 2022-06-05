import 'package:flutter/material.dart';
import 'package:tabata/theme/colors.dart';

class PaperContainer extends StatelessWidget {
  final Widget child;
  final GestureTapCallback? onTap;
  const PaperContainer({Key? key, required this.child, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Material(
      color: paperBackground,
      borderRadius: BorderRadius.circular(16.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          child: child,
        ),
      ),
    );
  }
}
