import 'package:flutter/material.dart';

void goScreen({
  required BuildContext context,
  required Widget screen,
  bool closeScreen = false,
  bool fullScreen = false,
}) {
  if (closeScreen) {
    Navigator.of(context, rootNavigator: fullScreen).pushReplacement(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  } else {
    Navigator.of(context, rootNavigator: fullScreen).push(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }
}
