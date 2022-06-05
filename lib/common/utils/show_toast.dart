import 'package:fluttertoast/fluttertoast.dart';
import 'package:tabata/theme/colors.dart';

void showToast({
  required String message,
  Toast? toastDuration,
  ToastGravity? gravity,
}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: toastDuration ?? Toast.LENGTH_SHORT,
    gravity: gravity ?? ToastGravity.BOTTOM,
    backgroundColor: foregroundColor,
    textColor: textColor,
  );
}
