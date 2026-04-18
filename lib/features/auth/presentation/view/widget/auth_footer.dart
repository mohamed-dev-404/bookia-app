import 'package:bookia/core/utils/colors/app_colors.dart';
import 'package:bookia/core/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({
    super.key,
    required this.label,
    required this.buttonLabel,
    required this.onTap,
  });
  final String label;
  final String buttonLabel;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: AppStyles.caption1.copyWith(color: AppColors.darkGreyColor),
          ),
          TextButton(
            onPressed: onTap,
            child: Text(
              buttonLabel,
              style: AppStyles.caption1.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
