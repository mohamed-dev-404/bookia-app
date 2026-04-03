import 'package:bookia/core/utils/assets/app_lotties.dart';
import 'package:bookia/core/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// AppDialogs
///
/// Utility class for showing styled dialogs consistently across the application.

class AppDialogs {
  AppDialogs._(); // Private constructor to prevent instantiation

  static void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: AppColors.darkColor.withValues(alpha: 0.7),
      builder: (context) =>
          Center(child: Lottie.asset(AppLotties.loadingJson, height: 50)),
    );
  }
}
