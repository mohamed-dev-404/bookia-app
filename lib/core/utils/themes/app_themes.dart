import 'package:bookia/core/constants/app_fonts.dart';
import 'package:bookia/core/utils/colors/app_colors.dart';
import 'package:bookia/core/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';

class AppThemes {
  AppThemes._();

  static ThemeData get lightTheme => ThemeData(
    //* core theme settings
    fontFamily: AppFonts.dMSerif,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      // text color
      onSurface: AppColors.darkColor,
    ),

    //* AppBar theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundColor,
      elevation: 0,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
    ),

    //* Divider theme
    dividerColor: Colors.transparent,
    dividerTheme: const DividerThemeData(color: AppColors.borderColor),

    // * TextButton theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: const Size(60, 30),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    ),

    //* Input decoration theme for styling of text fields
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: AppStyles.body.copyWith(color: AppColors.greyColor),
      fillColor: AppColors.accentColor,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.borderColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.errorColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.errorColor),
      ),
    ),

    //* BottomNavigationBar theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.greyColor,
      backgroundColor: Colors.transparent,
      selectedLabelStyle: AppStyles.caption2.copyWith(
        fontWeight: FontWeight.w600,
        height: 2,
      ),
      unselectedLabelStyle: AppStyles.caption2.copyWith(
        fontWeight: FontWeight.w600,
        height: 2,
      ),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 0,
    ),
  );
}
