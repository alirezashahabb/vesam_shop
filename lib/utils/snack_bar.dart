import 'package:flutter/material.dart';
import 'package:online_shop/them.dart';

enum AlertType {
  success,
  error,
  warning,
}

void showCustomAlert(BuildContext context, String message,
    [AlertType alertType = AlertType.success]) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: alertType == AlertType.success
          ? AppColors.kSuccess600
          : alertType == AlertType.warning
              ? AppColors.kWarning500
              : AppColors.kAlert500,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
      content: Text(
        message,
        style: const TextStyle(
          fontFamily: 'Vazir',
        ),
      ),
    ),
  );
}
